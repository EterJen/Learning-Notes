##              [     ssh-agent代理的简单用法        ](https://www.cnblogs.com/huangmengke/p/11508431.html)         

## 前言

在ansible的[官方文档](https://docs.ansible.com/ansible/latest/user_guide/intro_getting_started.html)中，提到了强烈推荐用ssh-agent来管理密钥
 ![img](https://img2018.cnblogs.com/blog/1713736/201909/1713736-20190912115946732-1184440.png)

![img](https://img2018.cnblogs.com/blog/1713736/201909/1713736-20190912115954533-267263341.png)

究竟ssh-agent是什么，它有什么用法呢，下面来一探究竟。

## ssh-agent是什么？用处是什么？

ssh-agent是什么？
 ssh-agent是一个代理程序，它能帮助我们管理我们的私钥。

------

ssh-agent在哪里用得到？

1. 当我们的主机有多个密钥对（例如：root用户生成了一对公钥私钥对，hmk用户生成了另外一对公钥私钥对），我们连接到其他不同的多台主机时，可能用的认证用户不一样，这时候需要我们手动指定使用哪个密钥，一旦机器过多输入会非常繁琐，ssh-agent能帮我们管理这些密钥对
2. 当我们给私钥加了密码，而我们的认证方式又选择了密钥认证，ssh-agent可以帮助我们免去输入密码的繁琐操作

## ssh-agent的启动

启动ssh-agent有两种命令：

```
 ssh-agent $SHELL
 eval `ssh-agent`
```

第一条命令：`ssh-agent $SHELL`
 它会在当前的shell（笔者的shell为bash）中启动一个子shell，ssh-agent程序运行在这个子shell中，在centos中，$SEHLL就是bash，所以这个命令可以写为`ssh-agent bash`，我们可以用pstree命令来查看进程树验证（找不到pstree命令可以用`yum -y install psmisc`安装）。
 执行命令前：
 ![img](https://img2018.cnblogs.com/blog/1713736/201909/1713736-20190912120010058-1042632879.png)

执行命令后：
 ![img](https://img2018.cnblogs.com/blog/1713736/201909/1713736-20190912120017478-1645207721.png)

在当前会话中，我们已经进入到了子shell里了，ssh-agent也运行在这里，我们可以退出当前的子shell，ssh-agent会随之消失。
 ![img](https://img2018.cnblogs.com/blog/1713736/201909/1713736-20190912120026763-750271969.png)

第二条命令：

```
 eval `ssh-agent`
```

它会直接开启一个ssh-agent进程：
 ![img](https://img2018.cnblogs.com/blog/1713736/201909/1713736-20190912120040058-731296623.png)

因为它是独立进程，所以即使我们退出当前shell连接，它依然存在，所以，我们最好在退出前用命令`ssh-agent k`关闭它。当然，这种方式同样适用于第一种开启了的ssh-agent程序。如果我们意外断开了连接，再连接的时候用`ssh-agent k`是无法关闭它的：
 ![img](https://img2018.cnblogs.com/blog/1713736/201909/1713736-20190912120047799-1858747452.png)

这个时候很简单，用`ps -ef|grep ssh-agent`找到对应的agent程序，用`kill pid号`来杀死进程即可。

## ssh-agent添加密钥

使用前面的步骤开启了ssh-agent后，可以用`ssh-add /root/.ssh/id_rsa`命令添加密钥了，注意：如果没有开启ssh-agent，你会看到这个报错
 ![img](https://img2018.cnblogs.com/blog/1713736/201909/1713736-20190912120055685-2147230591.png)

此时需要用第一步的方法开启ssh-agent

## ssh-agent管理多个私钥

首先，我们需要生成多对密钥，方法可以参考我前面的博客[https://www.cnblogs.com/huangmengke/p/11497740.html]，首先，生成一个非默认名字的私钥：
 ![img](https://img2018.cnblogs.com/blog/1713736/201909/1713736-20190912120104781-279077270.png)

然后用这个来做免密登录到其他机器的认证：
 ![img](https://img2018.cnblogs.com/blog/1713736/201909/1713736-20190912120114612-174971472.png)

然后，我们来“免密”登录试试：
 ![img](https://img2018.cnblogs.com/blog/1713736/201909/1713736-20190912120122938-699606900.png)

WTF？？？不是免密了吗？这是因为ssh的密钥认证默认使用/.ssh/id_rsa进行认证，如果你使用非默认的密钥认证，需要手动指定你的私钥文件，因为你发给172.16.101.251的公钥和251问你的/.ssh/id_rsa不匹配，所以需要问你输入密码，正确的认证方式通过-i指定私钥文件：
 ![img](https://img2018.cnblogs.com/blog/1713736/201909/1713736-20190912120133951-476387310.png)

以上只是以一个私钥举例子，当我们需要连接N台主机，而且使用不同的密钥来认证，每次需要手动指定私钥，会极其繁琐，这时ssh-agent就可以帮忙了~
 ![img](https://img2018.cnblogs.com/blog/1713736/201909/1713736-20190912120144893-767828613.png)

## ssh-agent避免输入私钥密码

首先，设置ssh的私钥/root/.ssh/id_rsa_hmk1 和私钥密码123456：
 ![img](https://img2018.cnblogs.com/blog/1713736/201909/1713736-20190912120155287-1161502833.png)

同样的步骤做密钥验证，最后会提示我们输入密钥的密码：
 ![img](https://img2018.cnblogs.com/blog/1713736/201909/1713736-20190912120203472-1018669461.png)

这样的话，每次我们用密钥认证登录，都要求我们输入密码，非常的麻烦，ssh-agent可以帮助我们管理密钥。在一个ssh会话中，只要输入一次私钥密码，在同一ssh会话中之后再次使用到相同的私钥时，可以不用再次输入对应密码，示例如下：
 ![img](https://img2018.cnblogs.com/blog/1713736/201909/1713736-20190912120217998-1251179023.png)

## ssh-agent管理密钥的其它命令

查看ssh-agent已经添加的私钥：

```
 ssh-add -l
```

示例：
 ![img](https://img2018.cnblogs.com/blog/1713736/201909/1713736-20190912120228539-52919843.png)

查看ssh-agent已经添加的私钥对应的公钥：

```
  ssh-add -L
```

示例：
 ![img](https://img2018.cnblogs.com/blog/1713736/201909/1713736-20190912120242265-1674017413.png)

删除指定的私钥

```
  ssh-add -d 私钥文件
```

示例：
 ![img](https://img2018.cnblogs.com/blog/1713736/201909/1713736-20190912120251789-190340665.png)

删除所有私钥

```
  ssh-add -D
```

## 类比总结

host1:二叔所在的公司
 私钥：我的私人财产-电脑
 私钥密码：开机密码
 公钥：我的个人名片
 host2：胖虎公司（胖虎是笔者的朋友）
 认证文件：收到二叔的名片，去geo找他，通过私钥验证身份

我copy公钥--->全世界撒名片，这个我自己来，不让管家胖虎干，毕竟刷脸
 添加代理agent--->管家胖虎代为管理我的私人财产-电脑，和进入电脑的开机密码；我有N台电脑和密码，只给胖虎管一台或几台，不满意他的表现可以随时不让管家管理，不过这样接洽外部会变得非常麻烦。

所以，ssh-agent，你学会了吗？

​    分类:             [Linux基础](https://www.cnblogs.com/huangmengke/category/1541444.html)

​    标签:             [ssh-agent](