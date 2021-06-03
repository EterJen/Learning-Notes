# Linux模糊搜索神器fzf终极配置

[![img](https://upload.jianshu.io/users/upload_avatars/7574151/67ca9990-c4f7-4715-9715-e932f14cedc9.jpg?imageMogr2/auto-orient/strip|imageView2/1/w/96/h/96)](https://www.jianshu.com/u/5e5ccfc4217a)

[luv39](https://www.jianshu.com/u/5e5ccfc4217a)

0.7682020.01.15 09:41:57字数 1,183阅读 4,498

fzf是Linux终端下的一款模糊搜索神器，速度极快，还可以配合vim以及其他软件使用，可以说是终端党的必备神器。虽然它安装起来比 较简单，但是想要使用得比较好，还是需要一番配置的，但是我看网上配置的文章都写得比较简单，所以写这篇文章记录一下。

## 安装

fzf可以单独安装，不过我推荐在vim中和fzf.vim一起安装，比较方便而且简单,我使用的vim plug管理插件，所以在vim配置文件里添加 以下两行就可以了。

```shell
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
Plug 'junegunn/fzf.vim'
```

然后在vim下执行`:PlugInstall`，它就开始安装了，安装过程中会问你几个问题，都按y就好了。

安装完成后就可以开始使用了，但是现在使用起来并不是很爽，因为没有预览，不能搜索隐藏文件，而且只能搜索当前目录，还不能排除一些乱七八糟的文件夹，经过配置之后这些都可以解决。

## 配置

在使用之前首先要安装两个软件，fdfind（也有可能叫fd）和rg（ripgrep）还有 [bat](https://links.jianshu.com/go?to=https%3A%2F%2Fgithub.com%2Fsharkdp%2Fbat)（一个文本 预览工具，类似于cat，但是比它更强大）。然后在`.zshrc`文件下添加以下设置。

```shell
###
###FZF
###
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_COMMAND='fdfind --hidden --follow -E ".git" -E "node_modules" . /etc /home'
export FZF_DEFAULT_OPTS='--height 90% --layout=reverse --bind=alt-j:down,alt-k:up,alt-i:toggle+down --border --preview "echo {} | ~/linux-config-file/fzf/fzf_preview.py" --preview-window=down'

# use fzf in bash and zsh
# Use ~~ as the trigger sequence instead of the default **
#export FZF_COMPLETION_TRIGGER='~~'

# Options to fzf command
#export FZF_COMPLETION_OPTS=''

# Use fd (https://github.com/sharkdp/fd) instead of the default find
# command for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fdfind --hidden --follow -E ".git" -E "node_modules" . /etc /home
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fdfind --type d --hidden --follow -E ".git" -E "node_modules" . /etc /home
}
```

- 前面有#号的是注释
- FZF_DEFAULT_COMMAND是用来列出文件以供fzf搜索的命令
- --hidden：允许搜索隐藏文件
- -E：后面跟的目录不会被搜索，用来排除一些没什么用的目录
- 最后的/etc和/home就是会在这两个目录里进行搜索，你也可以添加其它目录
- FZF_COMPLETION_OPTS是fzf搜索时的默认参数
- --height：搜索窗口占屏幕的比例
- --layout=reverse：默认搜索栏在底部，设置后搜索栏在上面
- --bind：用来更改默认快捷键的，格式就是 快捷键:动作 设置之间用逗号分隔
- --preview：预览命令，后面的python文件是我自己写的Python脚本路径，可以实现一些文件的预览
- --preview-window：预览窗口的位置，默认在右边，我设置到下边
- FZF_COMPLETION_TRIGGER：在终端触发fzf的快捷键，默认是**
- 最下面两个命令就是终端使用的时候的列出文件的命令，其实和上面的是一样的，只是下面的那个是只列出文件夹，所以多了一个--type参数

下面是我自己写的预览脚本的内容，你得把它复制到文件里，授予执行权限，放到合适的路径，然后用你的路径替换上面我的路径，大佬请忽略我乱七八糟的语法和谜一般的命名。

```python
#! /usr/bin/python3

import os
import sys


def fzf_preview(rg_name):
    rg_list = rg_name.split(':')
    if len(rg_list) == 1:
        bat_range = 0
    else:
        bat_range = rg_list[1].replace('\n', '')
    file_path_list = rg_list[0].replace('\n', '').split('/')
    for i,filep in zip(range(len(file_path_list)), file_path_list):
        path_space = filep.find(' ')
        if not path_space == -1:
            file_path_list[i] = "'{}'".format(filep)
        file_path = '/'.join(file_path_list)
    preview_nameandline = [file_path, bat_range]
    return preview_nameandline


if __name__ == "__main__":
    rg_name = sys.stdin.readlines()[0]
    preview_nameandline = fzf_preview(rg_name)
    if os.path.isdir(preview_nameandline[0]):
        os.system('ls -la {}'.format(preview_nameandline[0]))
    elif preview_nameandline[0].replace("'", '').endswith(('.zip', '.ZIP')):
        os.system('unzip -l {}'.format(preview_nameandline[0]))
    elif preview_nameandline[0].replace("'", '').endswith(('.rar', '.RAR')):
        os.system('unrar l {}'.format(preview_nameandline[0]))
    elif preview_nameandline[0].replace("'", '').endswith('.torrent'):
        os.system('transmission-show {}'.format(preview_nameandline[0]))
    elif preview_nameandline[0].replace("'", '').endswith(('.html', '.htm', '.xhtml')):
        os.system('w3m -dump {}'.format(preview_nameandline[0]))
    else:
        os.system('bat --style=numbers --color=always -r {}: {}'.format(
            preview_nameandline[1], preview_nameandline[0]))
```

## 使用

#### 终端中使用

- 在终端直接执行`fzf`，搜索到文件后会返回文件的绝对路径

![img](https://upload-images.jianshu.io/upload_images/7574151-2bc6a559cbce23c2.png?imageMogr2/auto-orient/strip|imageView2/2/w/801)

image.png

- 在终端使用快捷键触发，在任何需要使用路径的地方都可以用

```shell
nvim **<tab>
```

- kill命令进程搜索，这个是真的好用

```shell
kill -9 <tab>
```

#### 在vim中使用

- 使用`:Files`命令开始搜索文件，找到后回车打开

![img](https://upload-images.jianshu.io/upload_images/7574151-b155d16b7899f2e5.png?imageMogr2/auto-orient/strip|imageView2/2/w/800)

image.png

- 使用`:Rg`对文本内容进行模糊搜索，厉害了

![img](https://upload-images.jianshu.io/upload_images/7574151-eec35349c98ca440.png?imageMogr2/auto-orient/strip|imageView2/2/w/811)

image.png

然后你可以将这两个命令绑定到快捷键上，这样你就可以享受fzf所带来的便利了。

## 和ranger配合使用

ranger是一个终端下的文件浏览器，和它配合使用可以实现文件的寻找并快速跳转。

ranger默认安装完成后没有配置文件，需要执行`ranger --copy-config=all`来生成默认配置文件。文件路径在`~/.config/ranger`。现在可以开始添加配置到*commands.py*，官方的配置你可以在 [这里](https://links.jianshu.com/go?to=https%3A%2F%2Fgithub.com%2Franger%2Franger%2Fwiki%2FCustom-Commands) 找到，但是官方的命令并不好用，所以我进行了一些修改，如下：

```python
# use fzf in ranger
class fzf_select(Command):
    """
    :fzf_select

    Find a file using fzf.

    With a prefix argument select only directories.

    See: https://github.com/junegunn/fzf
    """
    def execute(self):
        import subprocess
        import os.path
        if self.quantifier:
            # match only directories
            command='fdfind --type d --hidden --follow -E ".git" -E "node_modules" . /etc /home/tom | fzf +m'
        else:
            # match files and directories
            command='fdfind --hidden --follow -E ".git" -E "node_modules" . /etc /home/tom | fzf +m'
        fzf = self.fm.execute_command(command, universal_newlines=True, stdout=subprocess.PIPE)
        stdout, stderr = fzf.communicate()
        if fzf.returncode == 0:
            fzf_file = os.path.abspath(stdout.rstrip('\n'))
            if os.path.isdir(fzf_file):
                self.fm.cd(fzf_file)
            else:
                self.fm.select_file(fzf_file)
```

添加完成之后你就可以通过`:fzf_select`命令来在ranger中启动fzf查找，并自动跳转了。当然你可以把这个命令绑定到一个快捷键上，通过在*rc.conf*中添加以下配置。

```shell
# 将fzf查找绑定到ctrl+f键，最好添加到注释Searching后面，我之前添加到前面没有生效，不知道为什么
map <C-f> fzf_select
```

> 目前尚未解决的问题，在nvim中使用Rg进行文本内容搜索时依然只能搜索当前文件夹，并且无法搜索隐藏文件

## 问题解决

2020/9/14, 搜索隐藏文件的问题已解决, 在init.vim中加上以下内容

```bash
command! -bang -nargs=* Rg
             \ call fzf#vim#grep(
             \ "rg --column --line-number --no-heading --color=always --smart-case --hidden -g '!**/.git/**' -- ".shellescape(<q-args>), 1, <bang>0)

# --hidden: 显示隐藏文件
#   -g '!**/.git/**': 排除所有.git文件夹
```