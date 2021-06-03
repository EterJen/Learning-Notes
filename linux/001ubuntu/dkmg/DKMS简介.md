## [     DKMS简介        ](https://www.cnblogs.com/wwang/archive/2011/06/21/2085571.html)

2011-06-21 23:33 [wwang](https://www.cnblogs.com/wwang/) 阅读(30783) 评论(1) [编辑](https://i.cnblogs.com/EditPosts.aspx?postid=2085571) [收藏](javascript:void(0))

我们都知道，如果要使用没有集成到内核之中的Linux驱动程序需要手动编译。当然，这并不是一件什么难事，即使是对于没有编程经验的Linux使用者，只要稍微有点hacker的意识，努力看看代码包里的Readme或者INSTALL文件，按部就班的执行几条命令还是很容易办到的。但这里还有一个问题，Linux模块和内核是有依赖关系的，如果遇到因为发行版更新造成的内核版本的变动，之前编译的模块是无法继续使用的，我们只能手动再编译一遍。这样重复的操作有些繁琐且是反生产力的，而对于没有内核编程经验的使用者来说可能会造成一些困扰，使用者搞不清楚为什么更新系统之后，原来用的好好的驱动程序突然就不能用了。这里，就是Dell创建的DKMS项目的意义所在。DKMS全称是Dynamic Kernel Module Support，它可以帮我们维护内核外的这些驱动程序，在内核版本变动之后可以自动重新生成新的模块。

在使用dkms之前首先需要确保系统中已经安装了 DKMS。在Ubuntu下可以执行下面这个命令安装：

> sudo apt-get install dkms

安装完毕之后，我们就可以开始使用 DKMS了。

本文的例子来自[Ubuntu Wiki](https://wiki.ubuntu.com/)，大家可以从[这里](http://files.cnblogs.com/wwang/hello-0.1.zip)下载。

# **使用DKMS编译安装内核模块**

DKMS的使用流程可以用下图简单表示：

![img](https://pic002.cnblogs.com/images/2011/175492/2011062117293552.jpg)

以hello-0.1为例，我们首先需要把代码copy到"/usr/src"下面，这样完整路径将是"/usr/src/hello-0.1"。

DKMS要求我们的代码目录必须以" <module>-<module-version>"的格式命名。本例中，代码的版本是0.1。

DKMS主要的命令可以参考上图所示，分别是add、build、install、uninstall和remove，另外，还可以执行"dkms status"查看目前DKMS系统维护的模块的状态。

在我自己的主机上，首先执行dkms status看看：

> bcmwl, 5.100.82.38+bdcom, 2.6.38-8-generic, i686: installed

目前我的机器上有一个处于“Installed State”的bcmwl模块，这是我的Broadcom无线网卡驱动。

我们还可以在目录"/var/lib/dkms"下查看目前有哪些由DKMS维护的驱动程序。

接下来，执行“sudo dkms add -m hello -v 0.1”来添加hello-0.1，执行的结果是：

> Creating symlink /var/lib/dkms/hello/0.1/source ->         /usr/src/hello-0.1
> DKMS: add Completed.

我们再执行“dkms status”看看：

> bcmwl, 5.100.82.38+bdcom, 2.6.38-8-generic, i686: installed
> hello, 0.1: added

hello-0.1已经处于"Added State"了。

下面执行“sudo dkms build -m hello -v 0.1”：

> Kernel preparation unnecessary for this kernel.  Skipping...
> Building module:cleaning build area....
> make KERNELRELEASE=2.6.38-8-generic all KVERSION=2.6.38-8-generic.....
> cleaning build area....
> DKMS: build Completed.

我们可以在目录“/var/lib/dkms/hello/0.1/2.6.38-8-generic/i686/module/”下面找到编译生成的hello.ko二进制模块。

最后执行“sudo dkms install -m hello -v 0.1”来安装hello.ko：

> hello.ko:
> Running module version sanity check.
>  \- Original module
>   \- No original module exists within this kernel
>  \- Installation
>   \- Installing to /lib/modules/2.6.38-8-generic/updates/dkms/

把hello.ko从/lib/modules下移除可以执行“sudo dkms uninstall -m hello -v  0.1”，甚至可以使用命令“sudo dkms remove -m hello -v 0.1  --all”把hello-0.1从/var/lib/dkms下彻底删除，这样，DKMS系统就不再维护hello-0.1模块了。

以上的每个步骤我们都可以通过“dkms status”来查看执行后的状态。

对于处于"Installed State"的模块，即使内核版本发生变化，我们也不需要手动重新编译内核了。

我们再回过头来研究一下hello-0.1中文件。

> /usr/src/hello-0.1/
> ├── dkms.conf
> ├── hello.c
> └── Makefile

如果您比较熟悉Linux内核模块的编写，hello.c和Makefile的内容应该很简单，本文不再详细解释。有一点需要注意，在Makefile中要使用变量$(KVERSION)指定内核版本号，这样我们在执行dkms时，就可以用“-k”选项来设定为哪个内核版本编译模块。

> $(MAKE) -C /lib/modules/$(KVERSION)/build M=$(PWD) modules

dkms.conf文件是本文关注的重点。

```
PACKAGE_NAME=``"hello"``PACKAGE_VERSION=``"0.1"``CLEAN=``"make clean"``MAKE[0]=``"make all KVERSION=$kernelver"``BUILT_MODULE_NAME[0]=``"hello"``DEST_MODULE_LOCATION[0]=``"/updates"``AUTOINSTALL=``"yes"
```

PACKAGE_NAME和PACKAGE_VERSION和文件夹的命名是一致的。

CLEAN的命令是每次build的时候第一条执行的动作。

MAKE[0]用来设定编译的命令，一般情况下是不用设定的。在本例中，就可以把MAKE[0]这行删掉。但在下面这种情况下就需要设定了。比如，您的Makefile里有多个target，分别为all、debug、release等，不指定MAKE[0]时，编译会选择第一个target来执行，也就是make all，如果您想执行make release来编译，就需要在dkms.conf里明确设定。

BUILD_MODULE_NAME[0]用来指定模块的名称，一般情况下也可以不设定。

DEST_MODULE_LOCATION[0]用来设定模块安装的目的地址，本例是"/lib/module/$(KVERSION)/updates"。

AUTOINSTALL="yes"表示在Linux引导之后DKMS会自动对这个模块执行Build和Install的动作，当然如果模块已经处于该状态的话，相应的动作是不用再执行的。

# 基于DKMS制作驱动程序的DEB安装包

作为Linux驱动开发者，有时候用户会要求我们提供驱动的DEB安装包，基于DKMS来制作DEB安装包是一个很好的选择。对开发者来说这样的DEB包制作起来比较简单，对于用户来说使用起来也省去许多烦恼。需要注意的是，制作DEB包依赖于dh-make，请首先执行“sudo apt-get install dh-make”安装。

在模块处于"Built State"的条件下，执行“sudo dkms mkdeb -m hello -v 0.1”可以在目录“/var/lib/dkms/hello/0.1/deb”下生成deb包。

另外，DKMS还提供了mktarball和mkrpm来制作tarball和RPM安装包，这里就不再一一赘述。

