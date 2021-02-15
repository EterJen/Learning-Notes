# Manjaro开机挂载NTFS硬盘

![img](https://csdnimg.cn/release/phoenix/template/new_img/original.png)

[mAzo](https://me.csdn.net/weixin_43840399) 2019-06-24 12:49:01 ![img](https://csdnimg.cn/release/phoenix/template/new_img/articleRead.png) 2060 ![img](https://csdnimg.cn/release/phoenix/template/new_img/collect.png) 收藏 3

展开



## 1. 首先打开终端运行命令`sudo fdisk -l`查看列表，找到自己要挂载的硬盘 我要挂载的盘是这个

```
Disk /dev/sda：931.5 GiB，1000204886016 字节，1953525168 个扇区
Disk model: HGST HTS541010B7
单元：扇区 / 1 * 512 = 512 字节
扇区大小(逻辑/物理)：512 字节 / 4096 字节
I/O 大小(最小/最佳)：4096 字节 / 4096 字节
磁盘标签类型：gpt
磁盘标识符：6C6AF072-C43D-4CB6-8F5C-9D3B7C3AA12F
设备         起点       末尾       扇区   大小 类型
/dev/sda1    2048     204799     202752    99M EFI 系统
/dev/sda2  204800     466943     262144   128M Microsoft 保留
/dev/sda3  466944 1953525134 1953058191 931.3G Microsoft 基本数据
1234567891011
```

我要挂载的分区是`/dev/sda3`，如果没分区的话你需要先自己分区。

对了，还要安装`ntfs-3g`这个包，已安装的就不用再安装了。

------

## 2.运行命令`ls -l /dev/disk/by-uuid/`查看UUID

```
ls -l /dev/disk/by-uuid/
总用量 0
lrwxrwxrwx 1 root root 15  6月 24 12:02 000898930005AE3A -> ../../nvme0n1p1
lrwxrwxrwx 1 root root 15  6月 24 12:02 0009C4A90000C896 -> ../../nvme0n1p5
lrwxrwxrwx 1 root root 10  6月 24 12:02 0009E26D0006ECF4 -> ../../sda3
lrwxrwxrwx 1 root root 10  6月 24 12:02 0e7efab8-cafd-41ac-add7-323d8cec18ec -> ../../sdb1
lrwxrwxrwx 1 root root 10  6月 24 12:02 410db31f-06e6-489d-89cc-e477e8702e76 -> ../../sdb2
lrwxrwxrwx 1 root root 10  6月 24 12:02 71D4-2502 -> ../../sda1
1234567
```

`0009E26D0006ECF4`这个就是/dev/sda3对应的UUID，记录下来。

------

## 3. 编辑`/etc/fstab`文件

注意，这个文件要正确修改其内容，否则会**开不了机**，需要通过liveCD进行修复，进入liveCD挂载(mount)系统分区，然后编辑/etc/fstab删除你添加的内容然后保存。

我的挂载点是`/home/mazo/data`(可自己定义)，于是我先创建个data目录：

```
cd /home/mazo
mkdir data
12
```

运行命令`sudo nano /etc/fstab`编辑文件
里面的内容如下：

```
 # /etc/fstab: static file system information.
#
# Use 'blkid' to print the universally unique identifier for a device; this may
# be used with UUID= as a more robust way to name devices that works even if
# disks are added and removed. See fstab(5).
#
# <file system>             <mount point>  <type>  <options>  <dump>  <pass>
UUID=0e7efab8-cafd-41ac-add7-323d8cec18ec /              ext4    defaults,noatime,discard 0 1
UUID=410db31f-06e6-489d-89cc-e477e8702e76 swap           swap    defaults,noatime,discard 0 2
tmpfs                                     /tmp           tmpfs   defaults,noatime,mode=1777 0 0
12345678910
```

在文件最后一行添加挂载分区：
`UUID=这里是刚刚查询出来的UUID 要挂载到的目录　ntfs　defaults 0 0`
我的示例：
`UUID=0009E26D0006ECF4 /home/mazo/data　ntfs　defaults 0 0`
注意有空格。
UUID是刚刚查询出来的
/home/mazo/data表示挂载点
ntfs表示格式，小写
0 0表示开机不检查磁盘。
修改后内容

```
 # /etc/fstab: static file system information.
#
# Use 'blkid' to print the universally unique identifier for a device; this may
# be used with UUID= as a more robust way to name devices that works even if
# disks are added and removed. See fstab(5).
#
# <file system>             <mount point>  <type>  <options>  <dump>  <pass>
UUID=0e7efab8-cafd-41ac-add7-323d8cec18ec /              ext4    defaults,noatime,discard 0 1
UUID=410db31f-06e6-489d-89cc-e477e8702e76 swap           swap    defaults,noatime,discard 0 2
tmpfs                                     /tmp           tmpfs   defaults,noatime,mode=1777 0 0
UUID=0009E26D0006ECF4                     /home/mazo/data　ntfs　  defaults 0 0
1234567891011
```

Ctrl+O保存，Ctrl+X退出文本编辑。

------

## 4.reboot重启。

可运行命令`df -h`查看挂载情况

```
文件系统        容量  已用  可用 已用% 挂载点
dev             7.8G     0  7.8G    0% /dev
run             7.8G  1.4M  7.8G    1% /run
/dev/sdb1       100G   46G   50G   48% /
tmpfs           7.8G   61M  7.8G    1% /dev/shm
tmpfs           7.8G     0  7.8G    0% /sys/fs/cgroup
tmpfs           7.8G   19M  7.8G    1% /tmp
/dev/sda3       932G  4.2G  928G    1% /home/mazo/data
tmpfs           1.6G   16K  1.6G    1% /run/user/1000
123456789
```

我刚开始使用的时候是有效果的可读写的，但是一段时间后发现变成只读了。发现原因是我装的是双系统，一个Win10一个是Manjaro，需要进去Win10，关闭`快速启动`,然后重启进入Manjaro发现挂载的NTFS又可以写了。



❶在管理员命令提示符窗口，输入：powercfg /h on命令 - 启用Windows快速启动；输入：powercfg /h off命令 - 关闭Windows快速启动。

❷在系统的电源选项中启用和关闭快速启动。