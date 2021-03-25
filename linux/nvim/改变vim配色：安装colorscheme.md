主要有两种方式安装colorscheme：

- 自行下载colorscheme安装，下载的文件扩展名通常为.vim。
- 通过安装相关vim的插件获取。

### 自行下载colorscheme安装

以mac为例，在系统自带的vim中有个colors文件夹，里面存放的便是各种colorscheme：

![colors](https://img-blog.csdn.net/20160713202818512)

在vim的配置文件`.vimrc`中配色方案的设置`colorscheme foo`为：

```vim
set t_Co=256 " required
colorscheme desert12
```

不过有时候我们对于自带的配色方案不太满意，那要怎么自己安装一些配色方案呢？主要分三步：

1. 在当前用户目录 `~/` 下的 `.vim` 目录(如果没有，`mkdir ~/.vim`进行新建该目录)。在 `~/.vim/` 下新建一个叫 `colors` 的目录，我们下一步下载的配色方案.vim文件便放到该目录下。
2. 到一个配色网站上选择一个配色方案下载到 `~/.vim/colors` 目录下面。这里推荐一个非常好的网站: [A ColorScheme Editor for Vim](http://bytefluent.com/vivify/), 这个网站不仅有很多的配色方案可供选择，还能自行进行编辑(比如变亮或变暗)再下载。比如我们看好了一个叫molokai的配色方案，点击下载按钮后下载 molokai.vim 的文件到 `~/.vim/colors` 目录下面 
    ![vivify](https://img-blog.csdn.net/20160713204112504)
3. 修改 `.vimrc` 配置文件：`colorscheme molokai`，退出再打开vim就能看到效果了。

注：网站上看到的配色方案效果仅供参考，不一定与实际使用的效果一样。

### 使用插件安装

vim插件：https://github.com/flazz/vim-colorschemes，使用插件管理器进行快速安装，安装完成后直接设置即可。

### 自己写一个 colorscheme

其实很简单，照葫芦画瓢即可，可以看我自己按照 spacemacs dark theme 修改的 [space-vim-dark](https://github.com/liuchengxu/space-vim-dark) colorscheme, 

![space-vim](https://raw.githubusercontent.com/liuchengxu/img/master/space-vim/space-vim-gui.png)

打开 colors 下面的 colorscheme, 其实很简单，完全可以自己写一个，主要内容差不多都是这样：

```vim
hi Function        ctermfg=134   guifg=#af5fd7 gui=bold            cterm=bold
hi Identifier      ctermfg=98    guifg=#875fd7 gui=bold           cterm=bold12
```

hi 就是 highlight，后面跟上一个类型，比如 Function, 就是指函数了，cterm 指的是 terminal  中的样式，比如加粗 bold，下划线 underline, gui 指的是 GUI vim中的样式，fg指的是 front  ground前景色，bg 指的是 background 背景色, 基本就是如此了。

调教一番就能使用了。

reddit 上也有一个关于创建 Colorscheme 的讨论：[Creating Your Lovely Color Scheme](https://www.reddit.com/r/vim/comments/7auw18/creating_your_lovely_color_scheme_vimconf2017/)