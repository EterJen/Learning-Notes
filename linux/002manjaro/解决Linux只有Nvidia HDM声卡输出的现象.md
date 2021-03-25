# 解决Linux只有Nvidia HDM声卡输出的现象

![img](https://csdnimg.cn/release/blogv2/dist/pc/img/original.png)

[宿雨融初阳](https://me.csdn.net/weixin_43594034) 2020-03-14 10:28:12 ![img](https://csdnimg.cn/release/blogv2/dist/pc/img/articleReadEyes.png) 174 ![img](https://csdnimg.cn/release/blogv2/dist/pc/img/tobarCollect.png) 收藏 2

分类专栏： [Linux Debug](https://blog.csdn.net/weixin_43594034/category_9803266.html) 文章标签： [linux](https://www.csdn.net/gather_2d/MtjaQg5sMDY0MC1ibG9n.html) [bug](https://www.csdn.net/gather_21/MtTaEg0sNTcyNzMtYmxvZwO0O0OO0O0O.html) [nvidia](https://www.csdn.net/gather_2e/MtjaEg1sOTc3NzktYmxvZwO0O0OO0O0O.html)

版权

# 解决Linux只有Nvidia HDM声卡输出的现象

### 起因

 前几天刚刚重装了`ArchLinux`然后安装桌面后发现声卡不能用，一直在网上找教程找了几天，问题都对不上。倒是在`archlinuxcn`论坛找到了一个相同问题的，但是那个帖子莫得回复。

 就在我苦恼的时候，我想起还有`Google`这个东西，立马`aplay -l`一下，把输出放到`Google`就硬搜。

```bash
aplay -l
**** List of PLAYBACK Hardware Devices ****
card 1: NVidia [HDA NVidia], device 3: HDMI 0 [HDMI 0]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 1: NVidia [HDA NVidia], device 7: HDMI 1 [HDMI 1]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 1: NVidia [HDA NVidia], device 8: HDMI 2 [HDMI 2]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 1: NVidia [HDA NVidia], device 9: HDMI 3 [HDMI 3]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
1234567891011121314
```

 其实还是毫无结果，但是我在一个帖子里发现了一个东西：`sof-audio-pci`。这是一个内核模块，我的电脑只显示`Nvidia`声卡的原因似乎就因为这个。

 真棒！

### 解决方案

 上面水了那么多字数，其实下面才是解决方案：

 编辑`Linux Kernel`启动项：这里以使用人数最多的`Grub2`为例子：

 在`/etc/default/grub`里编辑，在`GRUB_CMDLINE_LINUX_DEFAULT`加上

```bash
snd_hda_intel.dmic_detect=0
1
```

 然后保存退出，重新生成`Grub Config`：（注意提权）

```bash
grub-mkconfig -o /boot/grub/grub.cfg
1
```

 重启一下，就能看到`Intel`的声卡控制芯片了～

![在这里插入图片描述](https://img-blog.csdnimg.cn/20200314102701261.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80MzU5NDAzNA==,size_16,color_FFFFFF,t_70)

### 日后谈

 注意一下，我的电脑只是`aplay -l`显示不出设备，但是在`lspci | grep audio`能够显示出来

```bash
00:1f.3 Multimedia audio controller: Intel Corporation Cannon Lake PCH cAVS (rev 10)
1
```