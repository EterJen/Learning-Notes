[![CSDN首页](https://img-home.csdnimg.cn/images/20201124032511.png)](https://www.csdn.net/)

- [首页](https://www.csdn.net/)
- [博客](https://blog.csdn.net/)
- [程序员学院](https://edu.csdn.net/)
- [下载](https://download.csdn.net/)
- [论坛](https://bbs.csdn.net/)
- [问答](https://ask.csdn.net/)
- [代码](https://codechina.csdn.net/?utm_source=csdn_toolbar)
- [直播](https://live.csdn.net/?utm_source=csdn_toolbar)
- [电子书](https://book.csdn.net/)

 

[登录/注册](https://passport.csdn.net/account/login)

[会员中心](https://mall.csdn.net/vip)

[收藏](https://i.csdn.net/#/uc/collection-list?type=1)

[消息](https://live.csdn.net/room/py_ai_326/9MUeZ9A7?utm_source=gonggao_1201)

[创作中心](https://mp.csdn.net/)

# manjaro 配置zsh以及powerLine主题安装

![img](https://csdnimg.cn/release/blogv2/dist/pc/img/original.png)

[清风冷吟](https://blog.csdn.net/weixin_43968923) 2019-07-21 00:05:25 ![img](https://csdnimg.cn/release/blogv2/dist/pc/img/articleReadEyes.png) 16802 ![img](https://csdnimg.cn/release/blogv2/dist/pc/img/tobarCollect.png) 收藏 18

分类专栏： [Manjaro](https://blog.csdn.net/weixin_43968923/category_9319519.html) 文章标签： [manjaro](https://www.csdn.net/tags/MtjaEg5sNzQ3MzctYmxvZwO0O0OO0O0O.html) [powerline](https://www.csdn.net/tags/MtzaMg0sOTcyNDUtYmxvZwO0O0OO0O0O.html) [zsh](https://www.csdn.net/tags/MtzaMg0sODY5MzMtYmxvZwO0O0OO0O0O.html)

版权



### 配置zsh以及powerLine主题安装

- [安装 zsh](https://blog.csdn.net/weixin_43968923/article/details/86663001#_zsh_2)
- [安装 oh-my-zsh](https://blog.csdn.net/weixin_43968923/article/details/86663001#_ohmyzsh_5)
- [安装 powerline及字体](https://blog.csdn.net/weixin_43968923/article/details/86663001#_powerline_14)
- [查看命令](https://blog.csdn.net/weixin_43968923/article/details/86663001#_19)
- - [查看已有的shell](https://blog.csdn.net/weixin_43968923/article/details/86663001#shell_20)
  - [查看当前shell](https://blog.csdn.net/weixin_43968923/article/details/86663001#shell_23)
  - [使用zsh替换bash（重新打开终端生效）](https://blog.csdn.net/weixin_43968923/article/details/86663001#zshbash_26)
  - [还原bash（需要重启）](https://blog.csdn.net/weixin_43968923/article/details/86663001#bash_29)
  - [查看zsh版本](https://blog.csdn.net/weixin_43968923/article/details/86663001#zsh_31)
- [powerline 配置](https://blog.csdn.net/weixin_43968923/article/details/86663001#powerline__33)
- - [bashrc 配置（注意python版本）](https://blog.csdn.net/weixin_43968923/article/details/86663001#bashrc_python_34)
  - [vim .zshrc（注意python版本）](https://blog.csdn.net/weixin_43968923/article/details/86663001#vim_zshrcpython_51)
- [vim配置](https://blog.csdn.net/weixin_43968923/article/details/86663001#vim_336)
- [解决zsh中无法正常使用home和end等键的问题](https://blog.csdn.net/weixin_43968923/article/details/86663001#zshhomeend_345)
- [更换powerline主题](https://blog.csdn.net/weixin_43968923/article/details/86663001#powerline_409)



# 安装 zsh

```
sudo  pacman -S zsh
1
```

# 安装 oh-my-zsh

```
sh -c "$wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)”

或
wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh
sh install.sh
或
https://github.com/robbyrussell/oh-my-zsh/archive/master.zip
1234567
```

# 安装 powerline及字体

```
pacman -S powerline
pacman -S powerline-fonts
pacman -S powerline-vim
123
```

# 查看命令

## 查看已有的shell

```
cat /etc/shells
1
```

## 查看当前shell

```
echo $SHELL
1
```

## 使用zsh替换bash（重新打开终端生效）

```
chsh -s /bin/zsh
1
```

## 还原bash（需要重启）

```
chsh -s /bin/bash
1
```

## 查看zsh版本

```
zsh --version
1
```

# powerline 配置

## bashrc 配置（注意python版本）

```shell
vim ~/.bashrc  ## 可不配置

# powerline
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. /usr/lib/python3.7/site-packages/powerline/bindings/bash/powerline.sh

12345678
应用: 

source ~/.bashrc
123
```

## vim .zshrc（注意python版本）

vim ~/.zshrc 文件配置

```shell
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# powerline
powerline-daemon -q
. /usr/lib/python3.7/site-packages/powerline/bindings/zsh/powerline.zsh


#color{{{
autoload colors
colors

for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
eval _$color='%{$terminfo[bold]$fg[${(L)color}]%}'
eval $color='%{$fg[${(L)color}]%}'
(( count = $count + 1 ))
done
FINISH="%{$terminfo[sgr0]%}"
#}}}


#命令提示符
#RPROMPT=$(echo "$RED%D %T$FINISH")
#PROMPT=$(echo "$CYAN%n@$YELLOW%M:$GREEN%/$_YELLOW>$FINISH ")


#PROMPT=$(echo "$BLUE%M$GREEN%/
#$CYAN%n@$BLUE%M:$GREEN%/$_YELLOW>>>$FINISH ")
#标题栏、任务栏样式{{{
case $TERM in (*xterm*|*rxvt*|(dt|k|E)term)
precmd () { print -Pn "\e]0;%n@%M//%/\a" }
preexec () { print -Pn "\e]0;%n@%M//%/\ $1\a" }
;;
esac
#}}}




#关于历史纪录的配置 {{{
#历史纪录条目数量
export HISTSIZE=10000
#注销后保存的历史纪录条目数量
export SAVEHIST=10000
#历史纪录文件
export HISTFILE=~/.zsh_history
#以附加的方式写入历史纪录
setopt INC_APPEND_HISTORY
#如果连续输入的命令相同，历史纪录中只保留一个
setopt HIST_IGNORE_DUPS
#为历史纪录中的命令添加时间戳
setopt EXTENDED_HISTORY

#启用 cd 命令的历史纪录，cd -[TAB]进入历史路径
setopt AUTO_PUSHD
#相同的历史路径只保留一个
setopt PUSHD_IGNORE_DUPS

#在命令前添加空格，不将此命令添加到纪录文件中
#setopt HIST_IGNORE_SPACE
#}}}

# 补全{{{
#彩色补全菜单
eval $(dircolors -b)
export ZLSCOLORS="${LS_COLORS}"
zmodload zsh/complist
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'

#修正大小写
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
#错误校正
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

#kill 命令补全
compdef pkill=kill
compdef pkill=killall
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:*:*:*:processes' force-list always
zstyle ':completion:*:processes' command 'ps -au$USER'

#补全类型提示分组
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:descriptions' format $'\e[01;33m -- %d --\e[0m'
zstyle ':completion:*:messages' format $'\e[01;35m -- %d --\e[0m'
zstyle ':completion:*:warnings' format $'\e[01;31m -- No Matches Found --\e[0m'
zstyle ':completion:*:corrections' format $'\e[01;32m -- %d (errors: %e) --\e[0m'

# cd ~ 补全顺序
zstyle ':completion:*:-tilde-:*' group-order 'named-directories' 'path-directories' 'users' 'expand'
#}}}


##行编辑高亮模式 {{{
# Ctrl+@ 设置标记，标记和光标点之间为 region
zle_highlight=(region:bg=magenta #选中区域
special:bold      #特殊字符
isearch:underline)#搜索时使用的关键字
#}}}

##空行(光标在行首)补全 "cd " {{{
user-complete(){
case $BUFFER in
"" )                       # 空行填入 "cd "
BUFFER="cd "
zle end-of-line
zle expand-or-complete
;;
"cd --" )                  # "cd --" 替换为 "cd +"
BUFFER="cd +"
zle end-of-line
zle expand-or-complete
;;
"cd +-" )                  # "cd +-" 替换为 "cd -"
BUFFER="cd -"
zle end-of-line
zle expand-or-complete
;;
* )
zle expand-or-complete
;;
esac
}
zle -N user-complete
bindkey "\t" user-complete
#}}}



#命令别名 {{{
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias ls='ls -F --color=auto'
alias ll='ls -l --color=auto'
alias grep='grep --color=auto'
alias la='ls -a'
alias pacman='pacman --color=auto'
alias yay='yay --color=auto'
#}}}


#漂亮又实用的命令高亮界面
setopt extended_glob
TOKENS_FOLLOWED_BY_COMMANDS=('|' '||' ';' '&' '&&' 'sudo' 'do' 'time' 'strace')


recolor-cmd() {
region_highlight=()
colorize=true
start_pos=0
for arg in ${(z)BUFFER}; do
((start_pos+=${#BUFFER[$start_pos+1,-1]}-${#${BUFFER[$start_pos+1,-1]## #}}))
((end_pos=$start_pos+${#arg}))
if $colorize; then
colorize=false
res=$(LC_ALL=C builtin type $arg 2>/dev/null)
case $res in
*'reserved word'*)   style="fg=magenta,bold";;
*'alias for'*)       style="fg=cyan,bold";;
*'shell builtin'*)   style="fg=yellow,bold";;
*'shell function'*)  style='fg=green,bold';;
*"$arg is"*)
[[ $arg = 'sudo' ]] && style="fg=red,bold" || style="fg=blue,bold";;
*)                   style='none,bold';;
esac
region_highlight+=("$start_pos $end_pos $style")
fi
[[ ${${TOKENS_FOLLOWED_BY_COMMANDS[(r)${arg//|/\|}]}:+yes} = 'yes' ]] && colorize=true
start_pos=$end_pos
done
}
check-cmd-self-insert() { zle .self-insert && recolor-cmd }
check-cmd-backward-delete-char() { zle .backward-delete-char && recolor-cmd }

zle -N self-insert check-cmd-self-insert
zle -N backward-delete-char check-cmd-backward-delete-char

123456789101112131415161718192021222324252627282930313233343536373839404142434445464748495051525354555657585960616263646566676869707172737475767778798081828384858687888990919293949596979899100101102103104105106107108109110111112113114115116117118119120121122123124125126127128129130131132133134135136137138139140141142143144145146147148149150151152153154155156157158159160161162163164165166167168169170171172173174175176177178179180181182183184185186187188189190191192193194195196197198199200201202203204205206207208209210211212213214215216217218219220221222223224225226227228229230231232233234235236237238239240241242243244245246247248249250251252253254255256257258259260261262263264265266267268269270271272273274275276277278279280
```

# vim配置

vim ~/.vimrc

```shell
let g:powerline_pycmd="py3"
set laststatus=2
set t_Co=256
syntax on
1234
```

# 解决zsh中无法正常使用home和end等键的问题

方案1（会出现删除整个单词的情况）：

> 来自：https://bbs.archlinux.org/viewtopic.php?pid=201942#p201942

```shell
# key bindings
bindkey "\e[1~" beginning-of-line
bindkey "\e[4~" end-of-line
bindkey "\e[5~" beginning-of-history
bindkey "\e[6~" end-of-history
bindkey "\e[3~" delete-char
bindkey "\e[2~" quoted-insert
bindkey "\e[5C" forward-word
bindkey "\eOc" emacs-forward-word
bindkey "\e[5D" backward-word
bindkey "\eOd" emacs-backward-word
bindkey "\ee[C" forward-word
bindkey "\ee[D" backward-word
bindkey "^H" backward-delete-word
# for rxvt
bindkey "\e[8~" end-of-line
bindkey "\e[7~" beginning-of-line
# for non RH/Debian xterm, can't hurt for RH/DEbian xterm
bindkey "\eOH" beginning-of-line
bindkey "\eOF" end-of-line
# for freebsd console
bindkey "\e[H" beginning-of-line
bindkey "\e[F" end-of-line
# completion in the middle of a line
bindkey '^i' expand-or-complete-prefix
12345678910111213141516171819202122232425
```

方案2:

> 来自：https://anjia0532.github.io/2017/09/10/zsh-home-end-keypad-not-work/

```shell
# Home
bindkey '\e[1~' beginning-of-line
# End
bindkey '\e[4~' end-of-line

# Keypad
# 0 . Enter
bindkey -s "^[Op" "0"
bindkey -s "^[Ol" "."
bindkey -s "^[OM" "^M"
# 1 2 3
bindkey -s "^[Oq" "1"
bindkey -s "^[Or" "2"
bindkey -s "^[Os" "3"
# 4 5 6
bindkey -s "^[Ot" "4"
bindkey -s "^[Ou" "5"
bindkey -s "^[Ov" "6"
# 7 8 9
bindkey -s "^[Ow" "7"
bindkey -s "^[Ox" "8"
bindkey -s "^[Oy" "9"
# + -  * /
bindkey -s "^[Ok" "+"
bindkey -s "^[Om" "-"
bindkey -s "^[Oj" "*"
bindkey -s "^[Oo" "/"
123456789101112131415161718192021222324252627
```

# 更换powerline主题

```
修改config.py中的theme的设置，然后运行 install.py
1
```



- ![img](https://csdnimg.cn/release/blogv2/dist/pc/img/tobarThumbUp.png)点赞7

- [![img](https://csdnimg.cn/release/blogv2/dist/pc/img/tobarComment.png)评论2](https://blog.csdn.net/weixin_43968923/article/details/86663001#commentBox)

- [![img](https://csdnimg.cn/release/blogv2/dist/pc/img/tobarShare.png)分享](javascript:;)

- [![img](https://csdnimg.cn/release/blogv2/dist/pc/img/tobarCollect.png)收藏18](javascript:;)

- ![img](https://csdnimg.cn/release/blogv2/dist/pc/img/tobarReward.png)打赏

- ![img](https://csdnimg.cn/release/blogv2/dist/pc/img/tobarReport.png)举报

- [关注](javascript:;)

- 一键三连

  点赞Mark关注该博主, 随时了解TA的最新博文![img](https://csdnimg.cn/release/blogv2/dist/pc/img/closePrompt.png)

[*manjaro*终端美化教程](https://blog.csdn.net/m0_46322376/article/details/105761285)

[m0_46322376的博客](https://blog.csdn.net/m0_46322376)

![img](https://csdnimg.cn/release/blogv2/dist/pc/img/readCountWhite.png) 3745

[终端美化 效果 ![在这里插入图片描述](https://img-blog.csdnimg.cn/20200426093157540.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L20wXzQ2MzIyMzc2,size_16,color_...](https://blog.csdn.net/m0_46322376/article/details/105761285)

[*manjaro* *安装*分区以及*配置*方案](https://blog.csdn.net/lj402159806/article/details/80218360)

[提辖鲁的博客](https://blog.csdn.net/lj402159806)

![img](https://csdnimg.cn/release/blogv2/dist/pc/img/readCountWhite.png) 7万+

[制作启动盘 windows下制作启动盘 推荐在windows下使用Rufus工具来制作启动盘,做成启动盘后还能用来存储文件 linux下制作启动盘 使用dd命令，使用该命令做成启动盘后U盘就不能用来存储文件了，具体命令格式可以看wiki https://wiki.*manjaro*.org/index.php?title=Burn_an_ISO_File#Using_t...](https://blog.csdn.net/lj402159806/article/details/80218360)





[![img](https://g.csdnimg.cn/static/user-img/anonymous-User-img.png)](javascript:void(0);)

![表情包](https://csdnimg.cn/release/blogv2/dist/pc/img/emoticon.png)



- [![qq_37415690](https://profile.csdnimg.cn/5/6/1/3_qq_37415690)](https://blog.csdn.net/qq_37415690)

  [starslayerx](https://blog.csdn.net/qq_37415690)**:**换主题的config.py在那啊？有什么命令可以查看主题吗：)？7月前回复![img](https://csdnimg.cn/release/blogv2/dist/pc/img/commentMore.png)

  ![点赞](https://csdnimg.cn/release/blogv2/dist/pc/img/commentUnHeart.png)

- - [![weixin_43968923](https://profile.csdnimg.cn/7/1/5/3_weixin_43968923)](https://blog.csdn.net/weixin_43968923)

    [清风冷吟![img](https://csdnimg.cn/release/blogv2/dist/components/img/bloger@2x.png)](https://blog.csdn.net/weixin_43968923)回复**:**vim ~/.zshrc 更改 ZSH_THEME="robbyrussell"7月前回复![img](https://csdnimg.cn/release/blogv2/dist/pc/img/commentMore.png)

    ![点赞](https://csdnimg.cn/release/blogv2/dist/pc/img/commentUnHeart.png)

[8.*Manjaro**配置*优化](https://blog.csdn.net/fan_xiao_hui/article/details/104547750)

[fan_xiao_hui的博客](https://blog.csdn.net/fan_xiao_hui)

![img](https://csdnimg.cn/release/blogv2/dist/pc/img/readCountWhite.png) 1144

[文章目录*配置*镜像源1. 排列源并自动添加源2. 手动添加镜像源3. 增加archlinuxcn软件仓库4. 同步软件索引5. *安装* archlinuxcn-keyring 包以导入 GPG key系统更新1. 升级系统2.扩展系统(1) *安装*“*安装*AUR库中软件”命令3. 美化xfce terminal(1) *安装**zsh*（ 一个强大的虚拟终端）(2) *安装* oh-my-*zsh* (基于*zsh*命令行的...](https://blog.csdn.net/fan_xiao_hui/article/details/104547750)

[【Linux】*Manjaro**安装*以及*配置*](https://blog.csdn.net/qq_45271256/article/details/106558196)

[Foryatto的博客](https://blog.csdn.net/qq_45271256)

![img](https://csdnimg.cn/release/blogv2/dist/pc/img/readCountWhite.png) 603

[目录VM虚拟机中*安装**Manjaro**Manjaro*的*配置*换源*安装*AUR工具*安装**zsh* VM虚拟机中*安装**Manjaro* 参考文章：VMware虚拟机下*Manjaro*17.1.6*安装*详细教程 *Manjaro*的*配置* 参考文章：*Manjaro**安装*，*配置*，美化指南 换源 sudo pacman-mirrors -i -c China -m rank sudo pacman -Syy 在 /etc/pacman.conf 中添加以下代码： [archlinuxcn\] SigLevel = Optional Truste](https://blog.csdn.net/qq_45271256/article/details/106558196)

![img](https://kunyu.csdn.net/1.png?p=59&a=944&c=0&k=&spm=1001.2101.3001.5003&d=1&t=3&u=7eed7852711144639151454d5df7945d)

[简单的*manjaro**安装**powerline*及vim *zsh**配置*_zhf's blog](https://blog.csdn.net/z924139546/article/details/79815788)

12-9

[sh -c"$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-*zsh*/master/tools/install.sh -O -) 1 *安装*字体 pacman-S*powerline* pacman-Spowerl...](https://blog.csdn.net/z924139546/article/details/79815788)

[Oh My *Zsh* 命令行工具以及*powerLine**主题**安装*_IOS开发工...](https://blog.csdn.net/kuangdacaikuang/article/details/82666543)

12-6

[找到“文本->>字体->>更改”,"所有字体"中选中“ Meslo LG M for *powerLine*“字体 四、设置oh my *zsh* *配置*文件 上一步其实还未完成*主题*的设置,*配置**主题*需要...](https://blog.csdn.net/kuangdacaikuang/article/details/82666543)

[*ZSH* *安装*和Oh-My-*Zsh* *配置*](https://blog.csdn.net/weixin_42835132/article/details/107114191)

[shejialuo的博客](https://blog.csdn.net/weixin_42835132)

![img](https://csdnimg.cn/release/blogv2/dist/pc/img/readCountWhite.png) 222

[1. *安装* *ZSH* 直接通过pacman包管理器*安装*： sudo pacman -S *zsh* 2. *安装* Oh-My-*Zsh* 以下过程参考于Oh-My-*Zsh*的Github项目主页1。 2.1 通过 curl sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmy*zsh*/ohmy*zsh*/master/tools/install.sh)" 2.2 通过 wget sh -c "$(wget -O- https://raw.githubuserc](https://blog.csdn.net/weixin_42835132/article/details/107114191)

[oh-my-*zsh* 国内*安装*及*配置*](https://blog.csdn.net/qwe641259875/article/details/107201760)

[在所不辞的博客](https://blog.csdn.net/qwe641259875)

![img](https://csdnimg.cn/release/blogv2/dist/pc/img/readCountWhite.png) 5228

[*安装* *zsh* ubuntu 下： sudo apt-get install *zsh* *安装* oh-my-*zsh* wget https://gitee.com/mirrors/oh-my-*zsh*/raw/master/tools/install.sh 然后给install.sh添加权限： chmod +x install.sh 然后执行install.sh：./install.sh 如果发现很慢，可以修改为gitee： vim install.sh进入编辑状态： 找到以下部分： # Default set](https://blog.csdn.net/qwe641259875/article/details/107201760)

[*manjaro* kde *安装**zsh*和oh my *zsh*_小知识](https://blog.csdn.net/Hao_jiu/article/details/108306397)

12-8

[3 *安装**zsh* 实际上*manjaro*默认已经*安装*。运行cat /etc/shells查看有没有*zsh*,结果如下: /bin/sh /bin/bash /bin/*zsh* /usr/bin/*zsh* ...](https://blog.csdn.net/Hao_jiu/article/details/108306397)

[*Manjaro* oh-my-*zsh**安装**配置*_weixin_30679823的博客](https://blog.csdn.net/weixin_30679823/article/details/99644522)

12-27

[#*Manjaro* 自带*zsh*,但初始*zsh**配置*不好用,需下载oh-my-*zsh*进行*配置*。 # 1.首先:*安装*官方源的*zsh*,默认*安装*位置: ~/.*zsh*rc sudopacman -S *zsh* ...](https://blog.csdn.net/weixin_30679823/article/details/99644522)

[oh-my-*zsh**安装*](https://blog.csdn.net/BearKChan/article/details/106619299)

[BearKChan的博客](https://blog.csdn.net/BearKChan)

![img](https://csdnimg.cn/release/blogv2/dist/pc/img/readCountWhite.png) 266

[一、*安装**zsh* 首先，先检查自己的shell： echo $SHELL 如果显示是bash,则*安装**zsh*: yum install -y *zsh* 切换*zsh*： chsh -s /bin/*zsh* 二、*安装*oh-my-*zsh* cd ~ git clone https://github.com/ohmy*zsh*/ohmy*zsh*.git cd ohmy*zsh*/tools ./install.sh 三、*安装*插件 git clone https://github.com/wting/autojump.git $Z](https://blog.csdn.net/BearKChan/article/details/106619299)

[*manjaro*系统*配置*脚本](https://blog.csdn.net/dongchangzhang/article/details/54882842)

[dongchang's blog](https://blog.csdn.net/dongchangzhang)

![img](https://csdnimg.cn/release/blogv2/dist/pc/img/readCountWhite.png) 3871

[相关*manjaro*是基于一款基于arch-linux的操作系统。其除了保持了arch的kiss特性之外，还大大地简化了*安装*过程，并且在*安装*过程中相对完美地解决了显卡驱动等问题，当然，*manjaro*也支持aur，你可以在这里方便的*安装*需要的软件。因此，如果你喜欢arch-linux但是对于其繁琐的*安装*过程又感到烦恼的话，*manjaro*是一个更好的选择。新*安装*的系统之后在之前使用ubuntu时我就把基本](https://blog.csdn.net/dongchangzhang/article/details/54882842)

[高效Linux之*zsh*的*安装*与*配置*_半亩方塘](https://blog.csdn.net/u012801337/article/details/46954809)

12-11

[*manjaro* *配置**zsh*以及*powerLine**主题**安装* 清风冷吟 07-21 1万+ *manjaro* *配置* vim *zsh**安装* *zsh**安装* oh-my-*zsh**安装* *powerline*及字体使用*zsh*替换bash(重新打开终端...](https://blog.csdn.net/u012801337/article/details/46954809)

[gnome-*manjaro**安装*后的*配置*_peacewind](https://blog.csdn.net/nostandby/article/details/103743933)

12-14

[*powerline*+*zsh* 永久挂载分区 设置swap分区 显示实时网速,CPU信息 截图工具 其他 换源+常用软件 参考网址:*Manjaro**安装*后*配置* 我的软件: ...](https://blog.csdn.net/nostandby/article/details/103743933)

[Archlinux下*安装*和*配置**zsh*](https://blog.csdn.net/kingolie/article/details/53066679)

[kingolie的博客](https://blog.csdn.net/kingolie)

![img](https://csdnimg.cn/release/blogv2/dist/pc/img/readCountWhite.png) 1万+

[archlinux*安装*和*配置**zsh*](https://blog.csdn.net/kingolie/article/details/53066679)

[*Manjaro*17.0.1(KDE)*安装*后*配置*笔记](https://blog.csdn.net/ZOKEKAI/article/details/74740664)

[ZOKEKAI的博客](https://blog.csdn.net/ZOKEKAI)

![img](https://csdnimg.cn/release/blogv2/dist/pc/img/readCountWhite.png) 1万+

[1.切换中国源sudo gedit /etc/pacman-mirrors.conf如果提示没有gedit , 则执行命令 : sudo pacman -S gedit修改如下地方为中国：OnlyCountry = China2.增加archlinuxcn软件仓库以及各种开发工具源sudo gedit /etc/pacman.conf添加以下内容：[archlinuxcn\]SigLevel = O](https://blog.csdn.net/ZOKEKAI/article/details/74740664)

[*Manjaro*/Arch Linux *安装*后的*配置*(Gnome)_不想当厨子的...](https://blog.csdn.net/qq_33188802/article/details/85232669)

12-15

[*安装*微信(网页版打包的) sudo pacman -S electronic-wechat *安装*蓝灯和Git sudo pacman -S lantern git *安装**zsh*(非常好用的shell) ...](https://blog.csdn.net/qq_33188802/article/details/85232669)

[Oh-My-*Zsh*及*主题*、插件*安装*与*配置*_weixin_34167819的博...](https://blog.csdn.net/weixin_34167819/article/details/94563302)

12-22

[切换*zsh* *Manjaro* linux默认*安装*了*zsh*,其他可能需要先*安装* cat /etc/shells #查看本地有哪几种shell chsh -s /bin/*zsh* #切换到*zsh* ...](https://blog.csdn.net/weixin_34167819/article/details/94563302)

©️2020 CSDN 皮肤主题: 技术黑板 设计师:CSDN官方博客 [返回首页](https://blog.csdn.net/)

- [关于我们](https://www.csdn.net/company/index.html#about)
- [招贤纳士](https://www.csdn.net/company/index.html#recruit)
- [广告服务](https://www.csdn.net/company/index.html#advertisement)
- [开发助手](https://plugin.csdn.net/)
- ![img](https://g.csdnimg.cn/common/csdn-footer/images/tel.png)400-660-0108
- ![img](https://g.csdnimg.cn/common/csdn-footer/images/email.png)[kefu@csdn.net](mailto:webmaster@csdn.net)
- ![img](https://g.csdnimg.cn/common/csdn-footer/images/cs.png)[在线客服](https://csdn.s2.udesk.cn/im_client/?web_plugin_id=29181)
- 工作时间 8:30-22:00

- [公安备案号11010502030143](http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=11010502030143)
- [京ICP备19004658号](http://beian.miit.gov.cn/publish/query/indexFirst.action)
- [京网文〔2020〕1039-165号](https://csdnimg.cn/release/live_fe/culture_license.png)
- [经营性网站备案信息](https://csdnimg.cn/cdn/content-toolbar/csdn-ICP.png)
- [北京互联网违法和不良信息举报中心](http://www.bjjubao.org/)
- [网络110报警服务](http://www.cyberpolice.cn/)
- [中国互联网举报中心](http://www.12377.cn/)
- [家长监护](https://download.csdn.net/index.php/tutelage/)
- [Chrome商店下载](https://chrome.google.com/webstore/detail/csdn开发者助手/kfkdboecolemdjodhmhmcibjocfopejo?hl=zh-CN)
- ©1999-2020北京创新乐知网络技术有限公司
- [版权与免责声明](https://www.csdn.net/company/index.html#statement)
- [版权申诉](https://blog.csdn.net/blogdevteam/article/details/90369522)

[![img](https://profile.csdnimg.cn/7/1/5/3_weixin_43968923)](https://blog.csdn.net/weixin_43968923)

[清风冷吟](https://blog.csdn.net/weixin_43968923)

码龄2年[![img](https://csdnimg.cn/identity/nocErtification.png) 暂无认证](https://blog.csdn.net/weixin_43968923?utm_source=14998968)







- 30万+

  访问

- [![img](https://csdnimg.cn/identity/blog5.png)](https://blog.csdn.net/home/help.html#level)

  等级

- 4138

  积分

- 55

  粉丝

- 107

  获赞

- 54

  评论

- 450

  收藏

![持之以恒](https://csdnimg.cn/medal/chizhiyiheng@240.png)

![勤写标兵Lv4](https://csdnimg.cn/medal/qixiebiaobing4@240.png)

![学习力](https://csdnimg.cn/medal/yuanli_xuexili@240.png)

[私信](https://im.csdn.net/chat/weixin_43968923)

关注

![img](https://csdnimg.cn/cdn/content-toolbar/csdn-sou.png?v=1587021042)

### 热门文章

- [arch/Manjaro 添加国内源以及社区源 ![img](https://csdnimg.cn/release/blogv2/dist/pc/img/readCountWhite.png) 36770](https://blog.csdn.net/weixin_43968923/article/details/86349914)
- [VMware 15 创建虚拟机 ![img](https://csdnimg.cn/release/blogv2/dist/pc/img/readCountWhite.png) 24523](https://blog.csdn.net/weixin_43968923/article/details/86093803)
- [Manjaro 常用软件安装 ![img](https://csdnimg.cn/release/blogv2/dist/pc/img/readCountWhite.png) 16955](https://blog.csdn.net/weixin_43968923/article/details/86662256)
- [manjaro 配置zsh以及powerLine主题安装 ![img](https://csdnimg.cn/release/blogv2/dist/pc/img/readCountWhite.png) 16799](https://blog.csdn.net/weixin_43968923/article/details/86663001)
- [Manjaro 升级失败-解决方案 ![img](https://csdnimg.cn/release/blogv2/dist/pc/img/readCountWhite.png) 14289](https://blog.csdn.net/weixin_43968923/article/details/86350192)

### 分类专栏

- [![img](https://img-blog.csdnimg.cn/20190918140213434.png?x-oss-process=image/resize,m_fixed,h_64,w_64)Golang-Qt544篇](https://blog.csdn.net/weixin_43968923/category_9825462.html)
- [![img](https://img-blog.csdnimg.cn/20190918140145169.png?x-oss-process=image/resize,m_fixed,h_64,w_64)Golang-Gtk321篇](https://blog.csdn.net/weixin_43968923/category_9825162.html)
- [![img](https://img-blog.csdnimg.cn/20201014180756928.png?x-oss-process=image/resize,m_fixed,h_64,w_64)Golang 爬虫6篇](https://blog.csdn.net/weixin_43968923/category_10459321.html)
- [![img](https://img-blog.csdnimg.cn/20201014180756913.png?x-oss-process=image/resize,m_fixed,h_64,w_64)渗透测试3篇](https://blog.csdn.net/weixin_43968923/category_10287474.html)
- [![img](https://img-blog.csdnimg.cn/20201014180756925.png?x-oss-process=image/resize,m_fixed,h_64,w_64)UOS2篇](https://blog.csdn.net/weixin_43968923/category_9909305.html)
- [![img](https://img-blog.csdnimg.cn/2019091813595558.png?x-oss-process=image/resize,m_fixed,h_64,w_64)Tensorflow20篇](https://blog.csdn.net/weixin_43968923/category_9920332.html)
- [![img](https://img-blog.csdnimg.cn/20201014180756925.png?x-oss-process=image/resize,m_fixed,h_64,w_64)深度学习5篇](https://blog.csdn.net/weixin_43968923/category_9949865.html)
- [![img](https://img-blog.csdnimg.cn/20201014180756930.png?x-oss-process=image/resize,m_fixed,h_64,w_64)Python相关23篇](https://blog.csdn.net/weixin_43968923/category_8526547.html)
- [![img](https://img-blog.csdnimg.cn/20201014180756927.png?x-oss-process=image/resize,m_fixed,h_64,w_64)Python软件6篇](https://blog.csdn.net/weixin_43968923/category_9319563.html)
- [![img](https://img-blog.csdnimg.cn/20201014180756780.png?x-oss-process=image/resize,m_fixed,h_64,w_64)运维2篇](https://blog.csdn.net/weixin_43968923/category_9658815.html)
- [![img](https://img-blog.csdnimg.cn/20201014180756724.png?x-oss-process=image/resize,m_fixed,h_64,w_64)Manjaro20篇](https://blog.csdn.net/weixin_43968923/category_9319519.html)
- [![img](https://img-blog.csdnimg.cn/20201014180756930.png?x-oss-process=image/resize,m_fixed,h_64,w_64)OS3篇](https://blog.csdn.net/weixin_43968923/category_8595927.html)
- [![img](https://img-blog.csdnimg.cn/20201014180756930.png?x-oss-process=image/resize,m_fixed,h_64,w_64)linux4篇](https://blog.csdn.net/weixin_43968923/category_8554687.html)
- [![img](https://img-blog.csdnimg.cn/20201014180756926.png?x-oss-process=image/resize,m_fixed,h_64,w_64)Windows软件5篇](https://blog.csdn.net/weixin_43968923/category_8574350.html)
- [![img](https://img-blog.csdnimg.cn/20201014180756738.png?x-oss-process=image/resize,m_fixed,h_64,w_64)Hadoop5篇](https://blog.csdn.net/weixin_43968923/category_8593298.html)

![img](https://csdnimg.cn/release/blogv2/dist/pc/img/arrowDownWhite.png)

### 最新评论

- Go-Qt5开发之Windows10安装配置(1)

  [凌凌凌凌凌: ](https://blog.csdn.net/qq_44121609)请问一下库文件处理中的“在src中进入对应的包，去掉版本号”如何实现，我遇到了无法识别的情况

- python asyncio协程动态添加任务、协程池

  [不正经的kimol君: ](https://blog.csdn.net/kimol_justdo)忍不住就是一个赞，写得很棒，欢迎回赞哦~

- Manjaro 常用软件安装

  [清风冷吟: ](https://blog.csdn.net/weixin_43968923)忘了，不过你可以参照yay -S xx 的日志找到相关的编译命令

- Manjaro 常用软件安装

  [Synologs过客: ](https://blog.csdn.net/yinxiulong)手动编译怎么搞

- Manjaro 常用软件安装

  [清风冷吟: ](https://blog.csdn.net/weixin_43968923)去yay缓存目录下，删除一个走git 的png图片的链接，以及验证就可以了，然后手动编译

### 最新文章

- [asyncio 协程动态添加任务、支持阻塞任务](https://blog.csdn.net/weixin_43968923/article/details/111445971)
- [python asyncio协程动态添加任务、协程池2](https://blog.csdn.net/weixin_43968923/article/details/111397237)
- [go goroutine池的使用](https://blog.csdn.net/weixin_43968923/article/details/110739170)

2020

[12月4篇](https://blog.csdn.net/weixin_43968923/article/month/2020/12)

[10月6篇](https://blog.csdn.net/weixin_43968923/article/month/2020/10)

[08月14篇](https://blog.csdn.net/weixin_43968923/article/month/2020/08)

[07月1篇](https://blog.csdn.net/weixin_43968923/article/month/2020/07)

[04月23篇](https://blog.csdn.net/weixin_43968923/article/month/2020/04)

[03月61篇](https://blog.csdn.net/weixin_43968923/article/month/2020/03)

[01月2篇](https://blog.csdn.net/weixin_43968923/article/month/2020/01)

[2019年55篇](https://blog.csdn.net/weixin_43968923/article/month/2019/09)

[2018年3篇](https://blog.csdn.net/weixin_43968923/article/month/2018/12)

### 目录

1. [配置zsh以及powerLine主题安装](https://blog.csdn.net/weixin_43968923/article/details/86663001#t0)
2. [安装 zsh](https://blog.csdn.net/weixin_43968923/article/details/86663001#t1)
3. [安装 oh-my-zsh](https://blog.csdn.net/weixin_43968923/article/details/86663001#t2)
4. [安装 powerline及字体](https://blog.csdn.net/weixin_43968923/article/details/86663001#t3)
5. [查看命令](https://blog.csdn.net/weixin_43968923/article/details/86663001#t4)
6. 1. [查看已有的shell](https://blog.csdn.net/weixin_43968923/article/details/86663001#t5)
   2. [查看当前shell](https://blog.csdn.net/weixin_43968923/article/details/86663001#t6)
   3. [使用zsh替换bash（重新打开终端生效）](https://blog.csdn.net/weixin_43968923/article/details/86663001#t7)
   4. [还原bash（需要重启）](https://blog.csdn.net/weixin_43968923/article/details/86663001#t8)
   5. [查看zsh版本](https://blog.csdn.net/weixin_43968923/article/details/86663001#t9)
7. [powerline 配置](https://blog.csdn.net/weixin_43968923/article/details/86663001#t10)
8. 1. [bashrc 配置（注意python版本）](https://blog.csdn.net/weixin_43968923/article/details/86663001#t11)
   2. [vim .zshrc（注意python版本）](https://blog.csdn.net/weixin_43968923/article/details/86663001#t12)
9. [vim配置](https://blog.csdn.net/weixin_43968923/article/details/86663001#t13)
10. [解决zsh中无法正常使用home和end等键的问题](https://blog.csdn.net/weixin_43968923/article/details/86663001#t14)
11. [更换powerline主题](https://blog.csdn.net/weixin_43968923/article/details/86663001#t15)

![img](https://kunyu.csdn.net/1.png?p=479&a=3266&c=0&k=&spm=1001.2101.3001.4834&d=1&t=3&u=7bb19181e30c4a60b907f791b4b4ca90)

- ##### CSDN官方插件，现在体验可获得永久免费去广告特权！

- ##### 浅谈C#多线程简单例子讲解

  立即下载

- ##### C语言数组入门之数组的声明与二维数组的模拟

  立即下载

- ##### VRRP——虚拟路由器冗余协议

- ##### 大前端案例综合视频课

- ##### tomcat技术文档.doc

  立即下载

- ##### 【数据分析实战训练营】数据分析建模和预测

- ##### 前端热门技术之新版TypeScript入门学习到案例教程

- ##### 【数据分析实战训练营】机器学习模型及应用

- ##### Nopcommerce QQ授权插件

  立即下载

- ##### Linux下kibana的下载及安装

- ##### C#中让控件全屏显示的实现代码（WinForm）

  立即下载

- ##### 动态规划一次性背包问题（python）

- ##### 《解一元一次方程》PPT课件2

  立即下载

- ##### C#简单生成随机密码的方法示例

  立即下载

- ##### 定制企业级的linux系统

- ##### 机器学习原理(直播时间：1月4日---1月10日)

- ##### SSM在线考试系统

- ##### Java集合（集合框架）

- ##### Python闯关训练营第三十四期---直播回放

- ##### C#数据库操作小结

  立即下载

- ##### 微服务系列第二季-java极简入门介绍

- ##### c#读写注册表示例分享

  立即下载

- ##### JS数组的添加,删除操作

- ##### 《解一元一次方程》PPT课件4

  立即下载

- ##### 一点车网页版html+css+script

  立即下载

- ##### 深度学习原理到实战(直播时间：1月25日---1月30日)

- ##### VC中CDC、HDC、pDC区别与联系及相互转换

  立即下载

- ##### RocketMQ执行流程

- ##### Java教程:Java程序员必须知道的学习路线

- ##### C#配置文件操作类分享

  立即下载

- ##### Zookeeper & Kafka集群搭建+Flume & Beat 使用与数据收集

- ##### Pytorch学习笔记（深度之眼）（8）之优化器

- ##### c++中虚函数的实现详解

  立即下载

- ##### JQuery中html()，val()，text()-的区别

- ##### 高级数据分析工具与AI求职

- ##### R语言语法基础

- ##### Unity3D实现鼠标控制视角转动

  立即下载

- ##### 在.NET Core 中收集数据的几种方式

- ##### 移动端自动化测试Appium实战-基于Java语言-提供源码



![img](https://g.csdnimg.cn/side-toolbar/2.8/images/guide.png)![img](https://g.csdnimg.cn/side-toolbar/2.8/images/kefu.png)举报