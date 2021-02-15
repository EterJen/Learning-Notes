# 问题描述

Manjaro使用差不多2年了，一直拖着没有解决ssh端口拒绝访问的问题。 所以在服务器运行“scp Server Manjaro_local”`服务器主动发送`都报错，不得已改成在本地打开命令行来`向服务器索取`。 问题如下：
 ![img](https://img2018.cnblogs.com/blog/1430038/201907/1430038-20190725170706464-1123760959.png)

# 解决办法：

之前以为是22端口没有开放， 但是开放后仍然不起作用。 今天终于找到了原因， 是ssh服务没有启动.

立即启动ssh服务：

```
systemctl start sshd.service 
```

开机自动启动ssh服务：

```
systemctl enable sshd.service 
```

![img](https://img2018.cnblogs.com/blog/1430038/201907/1430038-20190725172117278-1719868820.png)


