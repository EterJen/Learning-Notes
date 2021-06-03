

# idea中git commit 的时候出现 you are about to commit crlf line separators to the git repository...

![img](https://csdnimg.cn/release/blogv2/dist/pc/img/original.png)

[排骨瘦肉丁](https://me.csdn.net/iamlihongwei) 2020-07-23 18:07:08 ![img](https://csdnimg.cn/release/blogv2/dist/pc/img/articleReadEyes.png) 1285 ![img](https://csdnimg.cn/release/blogv2/dist/pc/img/tobarCollect.png) 收藏

分类专栏： [版本控制管理工具](https://blog.csdn.net/iamlihongwei/category_6736282.html) 文章标签： [git](https://www.csdn.net/gather_27/MtzaYgwsMzEzMy1ibG9n.html)

版权

今天在整理学习资料的时候，把windows上写的代码copy到了我的mac上，然后准备上传到github上，在我用idea准备commit的时候，突然出现一个提示框，类似这样：
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200723181226555.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2lhbWxpaG9uZ3dlaQ==,size_16,color_FFFFFF,t_70)

从提示中看到是不同操作系统中的文本编辑的时候的换行符不一样导致的。所以搜索了一下git config 的core.autocrlf的说明：

##### 格式和空格

格式和空格问题是许多开发人员在协作（尤其是跨平台）协作时遇到的一些更令人沮丧和微妙的问题。补丁程序或其他协作工作很容易引入细微的空格变化，因为编辑者会默默地引入它们，并且如果您的文件曾经接触过Windows系统，它们的行尾可能会被替换。 Git有一些配置选项可帮助解决这些问题。

###### core.autocrlf

如果您是在Windows上进行编程，并且和其他人一起工作（或者只有你自己），则有时可能会遇到行尾问题。这是因为Windows在其文件中的换行符中同时使用了回车符和换行符，而macOS和Linux系统仅使用了换行符。这是跨平台工作的一个微妙但令人讨厌的事实。 Windows上的许多编辑器均以CRLF静默替换现有的LF样式的行尾，或者在用户按下Enter键时插入两个行尾字符。

当您将文件添加到index时，Git可以通过将CRLF行尾自动转换为LF来解决此问题，反之，当它在文件系统中签出代码时，也是ok的。您可以使用core.autocrlf设置启用此功能。如果您使用的是Windows计算机，请将其设置为true-签出代码时，这会将LF结尾转换为CRLF：

```python
$ git config --global core.autocrlf true
1
```

如果您使用的是使用LF行尾的Linux或macOS系统，那么您不希望Git在签出文件时自动将它们转换；但是，如果意外引入了带有CRLF结尾的文件，则您可能需要Git对其进行修复。您可以通过将core.autocrlf设置为input来告诉Git在提交时将CRLF转换为LF，而不是通过别的方式：

```python
$ git config --global core.autocrlf input
1
```

此设置会使您在Windows检出时以CRLF结尾，但在macOS和Linux系统以及仓库中以LF结尾。

如果您是Windows程序员，并且仅在Windows上进行项目，则可以关闭此功能，将config值设置为false，将回车符记录在仓库中：

```python
$ git config --global core.autocrlf false
1
```

当然，在本文开始的时候出现的这个问题，你就可以视情况而定，你可以选择fix and commit，也可以选择commit as is

