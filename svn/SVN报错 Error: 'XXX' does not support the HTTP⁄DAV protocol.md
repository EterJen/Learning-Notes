# SVN报错 Error: 'XXX' does not support the HTTP/DAV protocol

![img](https://csdnimg.cn/release/blogv2/dist/pc/img/original.png)

[迷茫的小猿](https://me.csdn.net/weixin_43747076) 2020-04-20 10:07:49 ![img](https://csdnimg.cn/release/blogv2/dist/pc/img/articleReadEyes.png) 3435 ![img](https://csdnimg.cn/release/blogv2/dist/pc/img/tobarCollect.png) 收藏 1

分类专栏： [svn](https://blog.csdn.net/weixin_43747076/category_9925226.html) 文章标签： [svn](https://www.csdn.net/gather_2f/MtTaEg0sMDcwNzYtYmxvZwO0O0OO0O0O.html) [tortoisesvn](https://www.csdn.net/gather_24/MtTaEg0sNTA2NjgtYmxvZwO0O0OO0O0O.html)

版权

报错信息：

```java
svn: E170013: Unable to connect to a repository at URL 'https://XXX/'

Command: Checkout from https://XXX/!/#XXX/XXX, revision HEAD, Fully recursive, Externals included  

Error: The server at 'https://XXX/!/#XXX/XXX' does not support the HTTP/DAV protocol  

123456
```

原因：该错误表明用于使用Subversion客户端寻址存储库的URL不适当。

解决方案： 通过VisualSVN Server的Web界面浏览资源库时 ，很可能是直接从Web浏览器的地址栏中复制了URL 。Subversion客户端程序无法处理此类URL的语法。通过点击 Web界面中的Checkout按钮，可以获得适当的URL 。

ok，解决

