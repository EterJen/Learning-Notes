# 如何在Vim中复制到剪贴板？

![img](https://csdnimg.cn/release/blogv2/dist/pc/img/translate.png)

​                    [asdfgh0077](https://blog.csdn.net/asdfgh0077)                    2019-12-26 13:48:37                    ![img](https://csdnimg.cn/release/blogv2/dist/pc/img/articleReadEyes.png)                    592                                            ![img](https://csdnimg.cn/release/blogv2/dist/pc/img/tobarCollect.png)                                                收藏                                                                                        

​                            文章标签：                                [vim](https://www.csdn.net/tags/MtTaEg0sMDM5OTAtYmxvZwO0O0OO0O0O.html)                                [clipboard](https://www.csdn.net/tags/MtTaEg0sMzk1MDYtYmxvZwO0O0OO0O0O.html)                    

​                    版权                

 是否可以直接从[Vim](http://www.javaxxz.com/thread-368216-1-1.html)复制到剪贴板？ `yy`只复制东西给Vim的内部缓冲区。 我想复制到操作系统的剪贴板。 在Vim中有没有这样的命令，或者你只能在Vim中猛拉东西？ 

------

### #1楼

 在vimrc文件中，您可以指定自动使用系统剪贴板进行复制和粘贴。 

 在Windows上设置： 

```
set clipboard=unnamed
```

 在Linux上设置（vim 7.3.74+）： 

```
set clipboard=unnamedplus
```

 注意：您可能需要使用最新版本的Vim才能使用这些版本。 

 [http://vim.wikia.com/wiki/Accessing_the_system_clipboard](https://stackoom.com/question/Gcex/如何在Vim中复制到剪贴板) 

------

### #2楼

 在Mac **OSX上** 

-  复制所选部分：直观地选择文本（在正常模式下键入`v`或`V` ）并键入`:w !pbcopy` 
-  复制整个文件`:%w !pbcopy` 
-  从剪贴板粘贴`:r !pbpaste` 

 在*大多数* **Linux** Distros上，您可以替换： 

-  `pbcopy`上面`xclip -i -sel c`或`xsel -i -b` 
-  `pbpaste`使用`xclip -o -sel -c` `xsel -o -b` `xclip -o -sel -c`或`xsel -o -b` 
   \- **注意：** *如果您的发行版上没有预安装这些工具（ `xsel`和`xclip` ），您可以在回购中找到它们* 

------

### #3楼

 @Jacob Dalton在评论中提到了这一点，但似乎没有人在答案中提到vim必须使用剪贴板支持编译，以便提供此处提到的任何建议。 默认情况下我没有在Mac OS X上配置我的方式，我不得不重建vim。 使用此命令查明是否有`vim --version | grep 'clipboard'` `vim --version | grep 'clipboard'` 。 `+clipboard`意味着你很好，这里的建议对你`-clipboard` ，而`-clipboard`意味着你必须重新编译和重建vim。 

------

### #4楼

 我在.vimrc中写了一个简单的行来进行复制工作。 希望这有助于某人。 不幸的是，我的vim没有安装剪贴板支持，所以这些建议都不适合我。 基本上，将此行粘贴到.vimrc中： 

```
map <C-c> y:e ~/clipsongzboard<CR>P:w !pbcopy<CR><CR>:bdelete!<CR>
```

 如果您想阅读有关此功能的详细信息，可以在[我的博客](https://stackoom.com/question/Gcex/如何在Vim中复制到剪贴板)上阅读此内容 