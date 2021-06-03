### npm查看镜像源

```
//查看源
npm config get registry
//更换源
npm config set registry https://registry.npmjs.org
//淘宝源
npm config set registry https://registry.npm.taobao.org
123456
```

### yarn安装

```
//安装
npm install -g yarn
//查看版本
yarn --version
//安装依赖包
yarn install
123456
```

#### windows 打开vs code使用yarn报错:

##### yarn : 无法加载文件 C:\Users\Admin\AppData\Roaming\npm\yarn.ps1,因为在此系统因为在此系统上禁止运行脚本。

![在这里插入图片描述](https://img-blog.csdnimg.cn/20210225143722879.png)

##### 解决

1、以管理员身份运行vscode;
 2、执行：get-ExecutionPolicy，显示Restricted，表示状态是禁止的;
 3、执行：set-ExecutionPolicy RemoteSigned;
 4、这时再执行get-ExecutionPolicy，就显示RemoteSigned

```
//查看状态
get-ExecutionPolicy
//修改状态
set-ExecutionPolicy RemoteSigned

12345
```

![在这里插入图片描述](https://img-blog.csdnimg.cn/2021022514390374.png)
 然后再次/使用yarn install安装依赖，但是这个这个过程相当慢

