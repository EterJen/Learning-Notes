# Warning: Permanently added the RSA host key for IP address '13.229.188.59' to the list of known host

![img](https://csdnimg.cn/release/blogv2/dist/pc/img/original.png)

​                    [Big_quant](https://blog.csdn.net/lvsehaiyang1993)                    2018-07-02 10:45:48                    ![img](https://csdnimg.cn/release/blogv2/dist/pc/img/articleReadEyes.png)                    14135                                            ![img](https://csdnimg.cn/release/blogv2/dist/pc/img/tobarCollect.png)                                                收藏                                                    9                                                                

​                            分类专栏：                                [Git版本控制](https://blog.csdn.net/lvsehaiyang1993/category_7759488.html)                                [Git 学习笔记](https://blog.csdn.net/lvsehaiyang1993/category_9276365.html)                            文章标签：                                [Git bash](https://so.csdn.net/so/search/s.do?q=Git bash&t=blog&o=vip&s=&l=&f=&viparticle=)                    

​                    版权                

# 前言

最近在学习GIt，安装了Git bash，过程中遇到了各种问题，写下帖子，方便大家解决问题，也方便自己回顾

# 问题描述

```
Warning: Permanently added the RSA host key for IP address '13.229.188.59' to the list of known host1
```

那条警告的大概意思就是：警告：为IP地址13.229.188.59的主机（RSA连接的）持久添加到hosts文件中，那就来添加吧！

# 解决办法：

## linux环境

　　 
 打开

```
vim /etc/hosts1
```

添加一行：13.229.188.59　　github.com

## Windows环境：

打开

```
C:\Windows\System32\drivers\etc\hosts     1
```

添加一行：13.229.188.59　　github.com

# 测试

![这里写图片描述](https://img-blog.csdn.net/20180702104408817?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2x2c2VoYWl5YW5nMTk5Mw==/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70) 
 可以看见它又变了，连接到另一个服务器上了。 
 但是不慌，将这个IP也加上去就行了。 
 最后一行可以看见，已经没有问题了。

