# 模糊搜索神器FZF番外篇

## Fuzzy finder

什么是模糊搜索？
广义的模糊搜索是指允许被搜索信息和搜索提问之间存在一定的差异，这种差异就是“模糊”在搜索中的含义。例如，查找名字Smith时，就会找出与之相似的Smithe， Smythe， Smyth， Smitt等。
但我们这里模糊搜索特指搜索关键词离散且乱序。
看如下的搜索，我的关键词是“a t dir go 15 6”, 搜索到的结果是“app/go/test/fixedbugs/issue15609.dir/call_amd64.s”
![vmplayer_2018-08-20_18-53-11](https://segmentfault.com/img/remote/1460000016186046?w=858&h=269)
可以看到结果并不是按照关键词顺序有序排列的

## 为什么要用Fuzzy finder

- 让工具像有灵魂一样
- 节省你的宝贵时间
- 输入更少，实际做的更多
- 自动处理

## 工具

最出名的fizzy finder当然是FZF， 这位韩国大神Junegunn Choi写的几个小工具都很神，证明了一个道理:牛人出品质量有保障。

## 为什么选择FZF

- FZF非常酷，它是一个组合性的命令行工具
- 是用Go写的，非常快
- 异步运行，能够处理非常大数量级的数据而不对调用工具产生影响
- 可以非常多的方面帮助你，而不仅仅是用来查找文件
- 移植容易（无信赖), 灵活的窗口配置
- vim集成

## FZF定位

FZF只是一个模糊搜索的命令行工具，它需要结合其他工具一起来用，它的输入要从其他工具得到，它的输出一般也是送给其他工具。

## 有哪些工具可以方便的和FZF一起使用

目前比较多的是以下几个工具

- Find (目录搜索)
- Grep (文本搜索)
- Ag (文本搜索)
- fd (目录搜索)
- ripgrep (文本搜索)

后两个是最新出的两个搜索方面的新秀，应该是目前速度最快的。

## 如何和ripgrep一起使用

可以设置使用rg来得到文件列表

```
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!{.git,node_modules}/*" 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="rg --sort-files --files --null 2> /dev/null | xargs -0 dirname | uniq"
```

在.vimrc里可以写上

```
let g:rg_command = '
  \ rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always"
  \ -g "*.{js,json,php,md,styl,jade,html,config,py,cpp,c,go,hs,rb,conf}"
  \ -g "!{.git,node_modules,vendor}/*" '

command! -bang -nargs=* F call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1, <bang>0)
```

这样你在vim里输入:F <key word>就可以进行相关rv

## 如何和fd一起使用

也可以设置用fd来得到文件列表，因为fd和rg的walkthrough代码是共享的，所以速度基本一样

```
export FZF_DEFAULT_COMMAND='fd --type f --color=never'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type d --color=never"
```

注意如果用time来比较rg和fd的速度时，往往会得出rg比fd快的结论，其实这是因为fd会彩色输出结果。
如果用`fd --type f --color=never`和`rg --files`来比较的话，结果基本是一样的

## 和各种shell配合

比如下面进入所选文件所在文件夹

```
# cdf - cd into the directory of the selected file
cdf() {
   local file
   local dir
   file=$(fzf +m -q "$1") && dir=$(dirname "$file") && cd "$dir"
}
```

比如执行历史命令

```
fh() {
  eval $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//')
}
```

比如checkout git分支

```
# fbr - checkout git branch (including remote branches), sorted by most recent commit, limit 30 last branches
fbr() {
  local branches branch
  branches=$(git for-each-ref --count=30 --sort=-committerdate refs/heads/ --format="%(refname:short)") &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}
```

## 总结

FZF其实是胶水工具，它需要读入其他工具的输出做为输入，然后或者调用其他工具读取它的输出，或者把自己的输出送给其他工具作为输入。
理解了这一点就能够很好的结合fzf和其他工具。
有任何有趣的点子，欢迎和本人分享