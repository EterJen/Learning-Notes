

------

## git-commit编辑器nano改vim

```
zz @ home
zz @ 2017-8-6
```

> REF:

- [修改git默认的编辑器nano为vim的方法]
  (http://blog.csdn.net/wangyezi19930928/article/details/40919711)

------

------

## 1. git commit

提交说明信息的时候, linux默认是 nano 编辑器
nano 这个编辑器使用 ctrl + x 来退出
和熟知的 vi 编辑器不一样

## ------

### 1) 方法一 修改系统的配置

```sh
git config --global core.editor vim
```

## ------

### 2) 方法二 针对 git 项目修改

打开文件 .git/config
在 core 中添加
editor=vim