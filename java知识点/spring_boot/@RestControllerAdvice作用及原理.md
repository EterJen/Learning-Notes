# [@RestControllerAdvice作用及原理](https://www.cnblogs.com/UncleWang001/p/10949318.html)

### 原文：[Spring Boot 系列（八）@ControllerAdvice 拦截异常并统一处理](https://www.cnblogs.com/magicalSam/p/7198420.html)

#### 在spring 3.2中，新增了@ControllerAdvice 注解，可以用于定义@ExceptionHandler、@InitBinder、@ModelAttribute，并应用到所有@RequestMapping中。参考：[@ControllerAdvice 文档](http://docs.spring.io/spring-framework/docs/5.0.0.M1/javadoc-api/org/springframework/web/bind/annotation/ControllerAdvice.html)

## 一、介绍

#### 创建 MyControllerAdvice，并添加 @ControllerAdvice注解。

```
package com.sam.demo.controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import java.util.HashMap;
import java.util.Map;

/**
 * controller 增强器
 * @author sam
 * @since 2017/7/17
 */
@ControllerAdvice
public class MyControllerAdvice {

    /**
     * 应用到所有@RequestMapping注解方法，在其执行之前初始化数据绑定器
     * @param binder
     */
    @InitBinder
    public void initBinder(WebDataBinder binder) {}

    /**
     * 把值绑定到Model中，使全局@RequestMapping可以获取到该值
     * @param model
     */
    @ModelAttribute
    public void addAttributes(Model model) {
        model.addAttribute("author", "Magical Sam");
    }

    /**
     * 全局异常捕捉处理
     * @param ex
     * @return
     */
    @ResponseBody
    @ExceptionHandler(value = Exception.class)
    public Map errorHandler(Exception ex) {
        Map map = new HashMap();
        map.put("code", 100);
        map.put("msg", ex.getMessage());
        return map;
    }

}
```

#### 启动应用后，被 @ExceptionHandler、@InitBinder、@ModelAttribute 注解的方法，都会作用在 被 @RequestMapping 注解的方法上。

#### @ModelAttribute：在Model上设置的值，对于所有被 @RequestMapping 注解的方法中，都可以通过 ModelMap 获取，如下：

```
@RequestMapping("/home")
public String home(ModelMap modelMap) {
    System.out.println(modelMap.get("author"));
}

//或者 通过@ModelAttribute获取

@RequestMapping("/home")
public String home(@ModelAttribute("author") String author) {
    System.out.println(author);
}
```

#### @ExceptionHandler 拦截了异常，我们可以通过该注解实现自定义异常处理。其中，@ExceptionHandler 配置的 value 指定需要拦截的异常类型，上面拦截了 Exception.class 这种异常。

## 二、自定义异常处理（全局异常处理）

> spring boot 默认情况下会映射到 /error 进行异常处理，但是提示并不十分友好，下面自定义异常处理，提供友好展示。

### 1、编写自定义异常类：

```
package com.sam.demo.custom;

/**
 * @author sam
 * @since 2017/7/17
 */
public class MyException extends RuntimeException {

    public MyException(String code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    private String code;
    private String msg;

    // getter & setter
}
```

##### 注：spring 对于 RuntimeException 异常才会进行事务回滚。

### 2、编写全局异常处理类

#### 创建 MyControllerAdvice.java，如下：

```
package com.sam.demo.controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

/**
 * controller 增强器
 *
 * @author sam
 * @since 2017/7/17
 */
@ControllerAdvice
public class MyControllerAdvice {

    /**
     * 全局异常捕捉处理
     * @param ex
     * @return
     */
    @ResponseBody
    @ExceptionHandler(value = Exception.class)
    public Map errorHandler(Exception ex) {
        Map map = new HashMap();
        map.put("code", 100);
        map.put("msg", ex.getMessage());
        return map;
    }
    
    /**
     * 拦截捕捉自定义异常 MyException.class
     * @param ex
     * @return
     */
    @ResponseBody
    @ExceptionHandler(value = MyException.class)
    public Map myErrorHandler(MyException ex) {
        Map map = new HashMap();
        map.put("code", ex.getCode());
        map.put("msg", ex.getMsg());
        return map;
    }

}
```

### 3、controller中抛出异常进行测试。

```
@RequestMapping("/home")
public String home() throws Exception {

//        throw new Exception("Sam 错误");
    throw new MyException("101", "Sam 错误");

}
```

#### 启动应用，访问：http://localhost:8080/home ，正常显示以下json内容，证明自定义异常已经成功被拦截。

```
{"msg":"Sam 错误","code":"101"}
```

#### * 如果不需要返回json数据，而要渲染某个页面模板返回给浏览器，那么MyControllerAdvice中可以这么实现：

```
@ExceptionHandler(value = MyException.class)
public ModelAndView myErrorHandler(MyException ex) {
    ModelAndView modelAndView = new ModelAndView();
    modelAndView.setViewName("error");
    modelAndView.addObject("code", ex.getCode());
    modelAndView.addObject("msg", ex.getMsg());
    return modelAndView;
}
```

#### 在 templates 目录下，添加 error.ftl（这里使用freemarker） 进行渲染：

```
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>错误页面</title>
</head>
<body>
    <h1>${code}</h1>
    <h1>${msg}</h1>
</body>
</html>
```

#### 重启应用，http://localhost:8080/home 显示自定的错误页面内容。

#### 补充：如果全部异常处理返回json，那么可以使用 @RestControllerAdvice 代替 @ControllerAdvice ，这样在方法上就可以不需要添加 @ResponseBody。