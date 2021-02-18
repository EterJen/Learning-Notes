# 1.首先从官网获取安装包

#### [官方下载地址传送门](http://www.jetbrains.com/idea/download/)

![从官网获取安装包](https://img2018.cnblogs.com/blog/1730512/201907/1730512-20190706000115193-257450162.png)

> 然后我就在下载目录下得到了tar.gz的包

![idea安装包](https://img2018.cnblogs.com/blog/1730512/201907/1730512-20190706000155810-528322119.png)

# 2.接下来开始命令行解压安装

### 2.1 解压缩gzip包

首先,切换工作目录到**/usr/local**
 然后解压**当前用户主文件夹/下载/idea压缩包**至**/usr/local/idea**

> tar命令参数：
>  -c ：create 建立压缩档案的参数；
>  -x ： **解压缩**压缩档案的参数；
>  -z ： 是否需要用gzip压缩；
>  -v： 压缩的过程中显示档案；
>  -f： 置顶文档名，在f后面立即接文件名，不能再加参数

**Shell指令：**

```shell
cd /usr/local
sudo mkdir idea
sudo tar -zxvf ~/下载/ideaIU-2019.1.3.tar.gz -C idea/
```

![img](https://img2018.cnblogs.com/blog/1730512/201907/1730512-20190706000259281-1194656800.png)

> 从上面截图上我们需要注意的是：***执行tar解压缩命令前，需要先创建好idea文件夹***，另外Ubuntu系统遇到没权限问题时在命令前加上 ***sudo***,或者可以**su root**以root系统管理员身份创建一个bash后再执行命令

### 2.2 重命名文件夹

**Shell指令：**

```shell
cd /usr/local/idea
pwd
sudo mv idea-IU-191.7479.19/ ideaIU/
```

> 使用***pwd***命令确认当前工作目录为/usr/local/idea
>  然后使用***mv***命令修改文件夹名称

![img](https://img2018.cnblogs.com/blog/1730512/201907/1730512-20190706000327115-1296930023.png)

### *2.3 如果还想把ideaIU里面的内容转移到/usr/local/ideaIU/下

```shell
sudo mv ideaIU/ /usr/local/ideaIU/
cd ../
ll
sudo rm -d idea/
```

![img](https://img2018.cnblogs.com/blog/1730512/201907/1730512-20190706000357174-1186078735.png)

> 文件夹idea已经是一个空文件夹了，所以可以用***rm*** 指令移除

### *思考：其实我们也可以在2.1时执行

```shell
cd /usr/local
sudo tar -zxvf ~/下载/ideaIU-2019.1.3.tar.gz
```

> 这样可以直接生成**\usr\local\idea-IU-191.7479.19**
>  然后再执行重命名不就OK了吗？为何多次一举呢？
>  解答：**因为我之前遇到解压下来不是一个文件夹的情况，所有的文件会一股脑跑到/usr/local/文件夹下面，到时候再想处理就比较棘手了，所以还是新建一个文件夹再解压比较保稳**
>  但是,单纯就安装idea这件事，你还是可以这么干的！

# 3.创建桌面快捷方式

如果只执行到上面的2.2,那么你现在的idea安装目录是
 `/usr/local/idea/ideaIU`，如果你还执行了2.3，那么你的安装目录是`/usr/local/ideaIU`，你可以通过`cd bin/`和`ll`指令，你将看到
 ![浏览bin文件夹](https://img2018.cnblogs.com/blog/1730512/201907/1730512-20190706000432057-1867615371.png)
 这两个文件创建桌面快捷方式时将会用到
 Shell命令：

```shell
cd ~/桌面
touch idea.desktop
sudo vi idea.desktop
```

然后按I开始输入,最后输入完了，按ESC，再输入`:wq`

```
[Desktop Entry]
Name=IntelliJ IDEA
Comment=IntelliJ IDEA
Exec=/usr/local/ideaIU/bin/idea.sh
Icon=/usr/local/ideaIU/bin/idea.png
Terminal=false
Type=Application
Categories=Developer;
```

![img](https://img2018.cnblogs.com/blog/1730512/201907/1730512-20190706000506701-2071598007.png)

> 允许这个文件可执行，需要用到***chmod*** 命令

```shell
sudo chmod +x idea.desktop
```

![img](https://img2018.cnblogs.com/blog/1730512/201907/1730512-20190706000522316-754951017.png)

> 选择信任就完事了

# 4. 请支持正版软件

### 4.1 Activation Code

> https://www.cnblogs.com/jajian/p/7989032.html

### 4.2 修改hosts

可以参考这篇博客： [关于ubuntu修改hosts文件的方法](https://www.cnblogs.com/henryhappier/archive/2013/02/21/2920493.html)

> 进入特权模式，
>  Shell命令：

```shell
sudo su
vi /etc/hosts
```

![img](https://img2018.cnblogs.com/blog/1730512/201907/1730512-20190706000546140-1472228502.png)

保存后重启网络：

```shell
sudo /etc/init.d/networking restart
```

------

## END

***Enjoy It!***