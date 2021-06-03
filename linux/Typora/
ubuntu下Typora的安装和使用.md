# ubuntu下Typora的安装和使用

Typora是一款非常好用的markdown编辑工具，下面介绍一下ubuntu上安装Typora的方法。

## 安装

```
# or use
# sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys BA300B7755AFCFAE
wget -qO - https://typora.io/linux/public-key.asc | sudo apt-key add -

# add Typora's repository
sudo add-apt-repository 'deb https://typora.io/linux ./'
sudo apt-get update

# install typora
sudo apt-get install typora
12345678910
```

## 升级

```
# upgrade all packages include Typora
sudo apt-get upgrade
# or use
# sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys BA300B7755AFCFAE
wget -qO - https://typora.io/linux/public-key.asc | sudo apt-key add -

# add Typora's repository
echo -e "\ndeb https://typora.io/linux ./" | sudo tee -a /etc/apt/sources.list
sudo apt-get update

# install typora
sudo apt-get install typora
123456789101112
```

## 使用

markdown语法教程详见[菜鸟教程Markdown](https://www.runoob.com/markdown/md-tutorial.html)

### 常用的快捷键

```
Typora快捷键整合
​```
Ctrl+1  一阶标题    Ctrl+B  字体加粗
Ctrl+2  二阶标题    Ctrl+I  字体倾斜
Ctrl+3  三阶标题    Ctrl+U  下划线
Ctrl+4  四阶标题    Ctrl+Home   返回Typora顶部
Ctrl+5  五阶标题    Ctrl+End    返回Typora底部
Ctrl+6  六阶标题    Ctrl+T  创建表格
Ctrl+L  选中某句话   Ctrl+K  创建超链接
Ctrl+D  选中某个单词  Ctrl+F  搜索
Ctrl+E  选中相同格式的文字   Ctrl+H  搜索并替换
Alt+Shift+5 删除线 Ctrl+Shift+I    插入图片
Ctrl+Shift+M    公式块 Ctrl+Shift+Q    引用

注：一些实体符号需要在实体符号之前加”\”才能够显示
​```
12345678910111213141516
```

如果想要学习更加详细教程，请点击[这里](https://juejin.im/post/5e6758ae6fb9a07c9e1c3753)。

