[![返回主页](https://www.cnblogs.com/skins/custom/images/logo.gif)](https://www.cnblogs.com/lutaishi/)

# [鲁太师](https://www.cnblogs.com/lutaishi/)

## 

- [ 博客园](https://www.cnblogs.com/)
- [ 首页](https://www.cnblogs.com/lutaishi/)
- [ 新随笔](https://i.cnblogs.com/EditPosts.aspx?opt=1)
- [ 联系](https://msg.cnblogs.com/send/鲁太师)
- [ 订阅](javascript:void(0))
- [ 管理](https://i.cnblogs.com/)

​			随笔 - 153  文章 - 1  评论 - 0  阅读 -  34633 		

#                  [     ubuntu下Typora的安装和使用         ](https://www.cnblogs.com/lutaishi/p/13436205.html)             

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
```

如果想要学习更加详细教程，请点击[这里](https://juejin.im/post/5e6758ae6fb9a07c9e1c3753)。

天上我才必有用，千金散尽还复来！

​        [好文要顶](javascript:void(0);)        [关注我](javascript:void(0);)    [收藏该文](javascript:void(0);)    [![img](https://common.cnblogs.com/images/icon_weibo_24.png)](javascript:void(0);)    [![img](https://common.cnblogs.com/images/wechat.png)](javascript:void(0);)

[![img](https://pic.cnblogs.com/face/1309459/20190102162852.png)](https://home.cnblogs.com/u/lutaishi/)

​            [鲁太师](https://home.cnblogs.com/u/lutaishi/)
​            [关注 - 4](https://home.cnblogs.com/u/lutaishi/followees/)
​            [粉丝 - 0](https://home.cnblogs.com/u/lutaishi/followers/)        

​                [+加关注](javascript:void(0);)    

​        0    

​        0    

​    

​    [« ](https://www.cnblogs.com/lutaishi/p/13436206.html) 上一篇：    [模糊搜索工具fzf的安装和使用](https://www.cnblogs.com/lutaishi/p/13436206.html)    
​    [» ](https://www.cnblogs.com/lutaishi/p/13412471.html) 下一篇：    [院校推荐](https://www.cnblogs.com/lutaishi/p/13412471.html)

posted @  2020-07-13 20:55 [鲁太师](https://www.cnblogs.com/lutaishi/) 阅读(1731) 评论(0) [编辑](https://i.cnblogs.com/EditPosts.aspx?postid=13436205) [收藏](javascript:void(0))





[刷新评论](javascript:void(0);)[刷新页面](https://www.cnblogs.com/lutaishi/p/13436205.html#)[返回顶部](https://www.cnblogs.com/lutaishi/p/13436205.html#top)

​    登录后才能查看或发表评论，立即 [登录](javascript:void(0);) 或者    [逛逛](https://www.cnblogs.com/) 博客园首页

[【推荐】大型组态、工控、仿真、CAD\GIS 50万行VC++源码免费下载!](http://www.uccpsoft.com/index.htm)
[【推荐】创新 聚力 融合，HMS Core.Sparkle 影音娱乐创新沙龙，邀您参加](https://brands.cnblogs.com/huawei)
[【推荐】限时秒杀！国云大数据魔镜，企业级云分析平台](http://www.moojnn.com/?source=bokeyuan)

​            

**园子动态**：
· [致园友们的一封检讨书：都是我们的错](https://www.cnblogs.com/cmt/p/14585828.html)
· [数据库实例 CPU 100% 引发全站故障](https://www.cnblogs.com/cmt/p/14595262.html)
· [发起一个开源项目：博客引擎 fluss](https://www.cnblogs.com/cmt/p/14217355.html)

<iframe id="google_ads_iframe_/1090369/C2_0" title="3rd party ad content" name="google_ads_iframe_/1090369/C2_0" scrolling="no" marginwidth="0" marginheight="0" style="border: 0px none; vertical-align: bottom;" srcdoc="" data-google-container-id="2" data-load-complete="true" width="468" height="60" frameborder="0"></iframe>

​    **最新新闻**：    
 ·          [和Google们一起定义开放式办公室的那家设计公司，现在说：开放式办公室已死](https://news.cnblogs.com/n/691833/)        
 ·          [用上傅里叶变换，很快啊，AI几秒钟就能解出偏微分方程](https://news.cnblogs.com/n/691811/)        
 ·          [新招募岗位暗示微软将继续深耕家庭服务业务](https://news.cnblogs.com/n/691832/)        
 ·          [新3D生物打印技术可同时修复皮肤和骨骼损伤](https://news.cnblogs.com/n/691831/)        
 ·          [特斯拉不正经：一季度没造Model S、X 却花12亿美元买币](https://news.cnblogs.com/n/691827/)        
​    » [更多新闻...](https://news.cnblogs.com/)

### 公告

​        昵称：        [             鲁太师         ](https://home.cnblogs.com/u/lutaishi/)
​        园龄：        [             3年3个月         ](https://home.cnblogs.com/u/lutaishi/)
​        粉丝：        [             0         ](https://home.cnblogs.com/u/lutaishi/followers/)
​        关注：        [             4         ](https://home.cnblogs.com/u/lutaishi/followees/)

[+加关注](javascript:void(0))

| [<](javascript:void(0);)                                                        2021年4月                                                            [>](javascript:void(0);) |      |      |      |      |      |      |
| ------------------------------------------------------------ | ---- | ---- | ---- | ---- | ---- | ---- |
| 日                                                           | 一   | 二   | 三   | 四   | 五   | 六   |
| 28                                                           | 29   | 30   | 31   | 1    | 2    | 3    |
| 4                                                            | 5    | 6    | 7    | 8    | 9    | 10   |
| 11                                                           | 12   | 13   | 14   | 15   | 16   | 17   |
| 18                                                           | 19   | 20   | 21   | 22   | 23   | 24   |
| 25                                                           | 26   | 27   | 28   | 29   | 30   | 1    |
| 2                                                            | 3    | 4    | 5    | 6    | 7    | 8    |

### 搜索

​                 

### 常用链接

- [我的随笔](https://www.cnblogs.com/lutaishi/p/)
- [我的评论](https://www.cnblogs.com/lutaishi/MyComments.html)
- [我的参与](https://www.cnblogs.com/lutaishi/OtherPosts.html)
- [最新评论](https://www.cnblogs.com/lutaishi/RecentComments.html)
- [我的标签](https://www.cnblogs.com/lutaishi/tag/)

### 最新随笔

- ​                     [1.pip源](https://www.cnblogs.com/lutaishi/p/13784520.html)                 
- ​                     [2.产看僵尸进程并杀死](https://www.cnblogs.com/lutaishi/p/13753618.html)                 
- ​                     [3.torch.Tensor和torch.tensor的区别](https://www.cnblogs.com/lutaishi/p/13436200.html)                 
- ​                     [4.torch.unsqueeze()和torch.squeeze()](https://www.cnblogs.com/lutaishi/p/13436201.html)                 
- ​                     [5.ubuntu下github克隆速度慢解决方案](https://www.cnblogs.com/lutaishi/p/13436202.html)                 
- ​                     [6.python之unittest单元测试框架](https://www.cnblogs.com/lutaishi/p/13436203.html)                 
- ​                     [7.python之logging日志模块](https://www.cnblogs.com/lutaishi/p/13436204.html)                 
- ​                     [8.python之logging日志模块](https://www.cnblogs.com/lutaishi/p/13425445.html)                 
- ​                     [9.python之unittest单元测试框架](https://www.cnblogs.com/lutaishi/p/13425417.html)                 
- ​                     [10.院校推荐](https://www.cnblogs.com/lutaishi/p/13412471.html)                 

### 我的标签

- ​            [github(3)](https://www.cnblogs.com/lutaishi/tag/github/)        
- ​            [毕业(2)](https://www.cnblogs.com/lutaishi/tag/毕业/)        
- ​            [linux(1)](https://www.cnblogs.com/lutaishi/tag/linux/)        
- ​            [logging(1)](https://www.cnblogs.com/lutaishi/tag/logging/)        
- ​            [unittest(1)](https://www.cnblogs.com/lutaishi/tag/unittest/)        
- ​            [tfrecord(1)](https://www.cnblogs.com/lutaishi/tag/tfrecord/)        
- ​            [tensorflow(1)](https://www.cnblogs.com/lutaishi/tag/tensorflow/)        
- ​            [VOC2012(1)](https://www.cnblogs.com/lutaishi/tag/VOC2012/)        
- ​            [华为云(1)](https://www.cnblogs.com/lutaishi/tag/华为云/)        

### 积分与排名

- ​		积分 -	 27300 
- ​		排名 -	 41795 

###              随笔档案          

- ​                     [     2020年10月(1) ](https://www.cnblogs.com/lutaishi/archive/2020/10.html)                  
- ​                     [     2020年9月(1) ](https://www.cnblogs.com/lutaishi/archive/2020/09.html)                  
- ​                     [     2020年8月(7) ](https://www.cnblogs.com/lutaishi/archive/2020/08.html)                  
- ​                     [     2020年7月(4) ](https://www.cnblogs.com/lutaishi/archive/2020/07.html)                  
- ​                     [     2020年5月(1) ](https://www.cnblogs.com/lutaishi/archive/2020/05.html)                  
- ​                     [     2020年4月(5) ](https://www.cnblogs.com/lutaishi/archive/2020/04.html)                  
- ​                     [     2020年3月(2) ](https://www.cnblogs.com/lutaishi/archive/2020/03.html)                  
- ​                     [     2020年2月(1) ](https://www.cnblogs.com/lutaishi/archive/2020/02.html)                  
- ​                     [     2020年1月(5) ](https://www.cnblogs.com/lutaishi/archive/2020/01.html)                  
- ​                     [     2019年12月(9) ](https://www.cnblogs.com/lutaishi/archive/2019/12.html)                  
- ​                     [     2019年11月(1) ](https://www.cnblogs.com/lutaishi/archive/2019/11.html)                  
- ​                     [     2019年8月(6) ](https://www.cnblogs.com/lutaishi/archive/2019/08.html)                  
- ​                     [     2019年7月(5) ](https://www.cnblogs.com/lutaishi/archive/2019/07.html)                  
- ​                     [     2019年6月(13) ](https://www.cnblogs.com/lutaishi/archive/2019/06.html)                  
- ​                     [     2019年5月(24) ](https://www.cnblogs.com/lutaishi/archive/2019/05.html)                  
- ​                [更多](javascript:void(0))            

###              文章档案          

- ​                     [     2019年11月(1) ](https://www.cnblogs.com/lutaishi/archives/2019/11.html)                  

###              相册          

- ​                     [     背景图片(3) ](https://www.cnblogs.com/lutaishi/gallery/1616062.html)                  

### 阅读排行榜

- ​                        [                             1. git clone出现 fatal: unable to access 'https://github.com/...'的解决办法(亲测有效)(10405)                         ](https://www.cnblogs.com/lutaishi/p/13436278.html)                    
- ​                        [                             2. Git上传错误：The requested URL returned error: 403(2455)                         ](https://www.cnblogs.com/lutaishi/p/12063668.html)                    
- ​                        [                             3. ubuntu下Typora的安装和使用(1731)                         ](https://www.cnblogs.com/lutaishi/p/13436205.html)                    
- ​                        [                             4. windows下VS 无法打开源文件 unistd.h(1445)                         ](https://www.cnblogs.com/lutaishi/p/13436265.html)                    
- ​                        [                             5. github添加branch(1444)                         ](https://www.cnblogs.com/lutaishi/p/12092067.html)                    

### 推荐排行榜

- ​                            [                                 1. QT学习——dialog、widget、mainwindow的区别和选择(1)                             ](https://www.cnblogs.com/lutaishi/p/13436283.html)                        

​		 Copyright © 2021 鲁太师 
Powered by .NET 5.0 on Kubernetes  	

你都复制了些什么呀，转载要记得加上出处哦

​            