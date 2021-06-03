# [rsync备份系统和恢复](https://my.oschina.net/bigtimes/blog/411933)

原创

[janetyan](https://my.oschina.net/bigtimes)

[工作日志](https://my.oschina.net/bigtimes?tab=newest&catalogId=585661)

2015/05/07 17:39

阅读数 4.8K

​                                                    [                                                         ![img](https://static.oschina.net/uploads/img/202008/31180557_CtYD.png)                                                     ](https://www.oschina.net/group/architecture)                                                

本文被收录于专区

[软件架构](https://www.oschina.net/group/architecture)

​                                                    [进入专区参与更多专题讨论 ](https://www.oschina.net/group/architecture)                                                



### 备份系统

```
rsync -aAXv --exclude={"/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/media/*","/lost+found","/etc/fstab"} /* /media/to
```





### 恢复系统

```
rsync -aAXv  /media/to/* / --exclude={"/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/media/*","/lost+found","/etc/fstab"}
```





### 注意事项

1. 如果按照了kvm，需要把kvm卸掉再装。

```
apt-get remove kvm qemu-kvm && apt-get install kvm qemu-kvm
```

 
