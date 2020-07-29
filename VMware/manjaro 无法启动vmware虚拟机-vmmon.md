manjaro 无法启动虚拟机-vmmon
报错：无法启动虚拟机
Please make sure that the kernel module `vmmon' is loaded.
原因分析：
解决
报错：无法启动网络
More information can be found in the vmware.log file.Failed to connect virtual device 'Ethernet0'.
原因分析：
解决
报错：无法启动虚拟机
Please make sure that the kernel module `vmmon’ is loaded.
Could not open /dev/vmmon: ???.
Please make sure that the kernel module `vmmon’ is loaded.

 

 

原因分析：
Unable to install module vmware-workstation/15.1.0_13591040 for kernel 5.2.8-1-MANJARO: Missing kernel headers.

Missing kernel headers

解决
先查看自己的内核

uname -r

➜  2.1.0 uname -r
5.2.8-1-MANJARO
1
2
安装 linux-headers

sudo pacman -S linux52-headers

加载内核模块

sudo modprobe -a vmw_vmci vmmon

报错：无法启动网络
More information can be found in the vmware.log file.Failed to connect virtual device ‘Ethernet0’.


原因分析：
没有设置开机自启虚拟机网络

解决
systemctl restart vmware-networks
systemctl enable vmware-networks
————————————————
版权声明：本文为CSDN博主「darkula」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
原文链接：https://blog.csdn.net/darkula/java/article/details/107073796