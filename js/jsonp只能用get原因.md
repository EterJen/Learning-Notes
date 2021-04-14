域名A中的JS代码AJAX请求域名为B的服务器数据，这就是跨域AJAX请求，默认情况下是不行的。

但是HTML中有地方可以跨域请求，比如img script标签，它们的src属性指向的地址可以是不在域名A下的（即跨域）。

那有人就利用了上面的特点，选择了script中src能够跨域获得内容的特性，研究出了JSONP这种hack协议。（src中请求都是GET）

那假设JSONP请求如下：

```
jsonp({
    url: 'http://path/to/server/b',
    params: {A: a, B: b},
    success: function myCallback (response) {}
})
```

背后其实在进行：

1. 拼接一个script标签，`<script src="http://path/to/server/b?A=a&B=b&callbackFunctionName=myCallback"></script>`，从而触发对指定地址的GET请求
2. 那服务器端对这个GET请求进行处理，并返回字符串 "myCallback('response value')"
3. 那前端script加载完之后，其实就是在script中执行`myCallback('response value')`
4. 是不是就完成了跨域的请求，
5. 是不是就是只能用GET