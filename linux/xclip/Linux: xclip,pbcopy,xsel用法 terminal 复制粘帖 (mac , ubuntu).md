# Linux: xclip,pbcopy,xsel用法 terminal 复制粘帖 (mac , ubuntu)

[![img](https://upload.jianshu.io/users/upload_avatars/4293760/161a067ae23c?imageMogr2/auto-orient/strip|imageView2/1/w/96/h/96)](https://www.jianshu.com/u/945f0956c74e)

[幻雪孤蓝](https://www.jianshu.com/u/945f0956c74e)

0.1822017.09.18 23:35:29字数 718阅读 2,055

# 1. Windows下

使用系统自带的clip命令。# 位于C:\Windows\system32\clip.exe

示例：

```c
echo Hello | clip  

# 将字符串Hello放入Windows剪贴板  

dir | clip  
# 将dir命令输出（当前目录列表）放入Windows剪贴板  
   
clip < README.TXT    
# 将readme.txt的文本放入Windows剪贴板  
   
echo | clip  
# 将一个空行放入Windows剪贴板，即清空Windows剪贴板  
```

# 2. Ubuntu下

ubuntu下的用户可以用apt-get来安装：pycharm git ssh

```csharp
sudo apt-get install xclip  
```

其他发行版的用户可以选择自己的安装方式，也可以用源码编译安装，xclip项目的主页是：[http://sourceforge.net/projects/xclip/](https://link.jianshu.com?t=http://sourceforge.net/projects/xclip/)

xclip可以将内容输出到‘X’的剪切板中，比如：

```bash
echo "Hello, world" | xclip  
```

执行这个命令后你就可以用鼠标中键来在X程序中将内容粘贴出来。但是更多的时候，我们需要不仅仅把内容输出到‘X’的剪切板中，而是希望可以在GUI程序 中用ctrl + v也可以粘贴（比如，输出到gnome的剪切板中），下面这段命令就可以让你将内容输出到gnome的剪切板中：

```bash
echo "Hello, world" | xclip -selection clipboard  
```

再在一个GUI程序中按下ctrl + v，看下是不是粘贴上去了呢？顺着这个命令，我也重新写了一下ifconfig，让它在执行后输入内容到终端的同时，也将ip地址输出到剪切板中，因为通常情况下，查看ifconfig就是为了获取机器的ip地址：

```bash
alias ifconfig='/sbin/ifconfig && echo `/sbin/ifconfig | sed -n 2p | awk "{ print \\$2 }" | grep -o "[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}"` | xclip -selection clipboard'  
```

或者

```undefined
xclip -sel clip < file   
```

此时你就可以在网页等编辑框CTRL+V了。

项目主页：[http://sourceforge.net/projects/xclip/](https://link.jianshu.com?t=http://sourceforge.net/projects/xclip/)
 命令man page: [http://linux.die.net/man/1/xclip](https://link.jianshu.com?t=http://linux.die.net/man/1/xclip)

### **-i**, **-in**

read text into X selection from standard input or files (default)

### **-o**, **-out**

prints the selection to standard out (generally for piping to a file or program)

### **-f**, **-filter**

when xclip is invoked in the in mode with output level set to silent  (the defaults), the filter option will cause xclip to print the text  piped to standard in back to standard out unmodified

### **-l**, **-loops**

number of X selection requests (pastes into X applications) to wait  for before exiting, with a value of 0 (default) causing xclip to wait  for an unlimited number of requests until another application (possibly  another invocation of xclip) takes ownership of the selection

### **-d**, **-display**

X display to use (e.g. "localhost:0"), xclip defaults to the value in $**DISPLAY** if this option is omitted

# 3. Linux下

使用xsel命令。

示例：

```ruby
cat README.TXT | xsel  
cat README.TXT | xsel -b # 如有问题可以试试-b选项  
xsel < README.TXT  
# 将readme.txt的文本放入剪贴板  
   
xsel -c  
# 清空剪贴板  
```

# 4. Mac下

使用pbcopy命令。 # 对应有个pbpaste命令。

示例：

```bash
echo 'Hello World!' | pbcopy  
# 将字符串Hello World放入剪贴板  


cat myFile.txt | pbcopy  
 

pbpaste > file.txt  
```

要复制结果又想看到命令的输出
 命令的结果输出时，如果给复制命令（即上面提到的命令clip、xsel、pbcopy）那么命令输出就看不到了。如果你想先看到命令的输出，可以下面这么做。

```bash
$ echo 'Hello World!' | tee tmp.file.txt  
Hello World!  
$ xsel < tmp.file.txt  
$ rm tmp.file.txt  
```

即先使用tee命令把输出输到控制台和一个文件中。命令执行完成后，再把输出的内容放到剪贴板中。pycharm git ssh

## 复制SSH的公有KEY使用下面的命令：

```ruby
$ pbcopy < ~/.ssh/id_rsa.pub  
```

注：不同系统使用不同的复制命令。避免用文本编辑器打开这个文件、选中文本、CTRL + C这样繁琐操作。