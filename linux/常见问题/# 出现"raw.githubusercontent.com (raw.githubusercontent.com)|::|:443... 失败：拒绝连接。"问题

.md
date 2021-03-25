# 安装MAVROS出现"raw.githubusercontent.com (raw.githubusercontent.com)|::|:443... 失败：拒绝连接。"问题

![img](https://csdnimg.cn/release/blogv2/dist/pc/img/original.png)

​                    [城南蜈蚣](https://blog.csdn.net/wowbing2)                    2020-04-27 20:00:36                    ![img](https://csdnimg.cn/release/blogv2/dist/pc/img/articleReadEyes.png)                    8791                                            ![img](https://csdnimg.cn/release/blogv2/dist/pc/img/tobarCollect.png)                                                收藏                                                    26                                                                

​                    

​                    版权                

## 安装MAVRO，wget https://raw.githubusercontent.com/mavlink/mavros/master/mavros/scripts/install_geographiclib_datasets.sh

出现以下错误：
 正在连接 raw.githubusercontent.com (raw.githubusercontent.com)|0.0.0.0|:443… 失败：拒绝连接。
 正在连接 raw.githubusercontent.com (raw.githubusercontent.com)|:😐:443… 失败：拒绝连接。
 ![在这里插入图片描述](https://img-blog.csdnimg.cn/20200427195817259.jpg)

进入网站：https://site.ip138.com/raw.Githubusercontent.com/

输入raw.githubusercontent.com
 查询其相关的IP地址:
 ![在这里插入图片描述](https://img-blog.csdnimg.cn/20200427195847208.jpg?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dvd2Jpbmcy,size_16,color_FFFFFF,t_70)
 在Ubuntu终端输入：
 sudo vi /etc/hosts

选择上面一个添加内容即可：
 比如：
 151.101.76.133 raw.githubusercontent.com
 或者
 151.101.228.133 raw.githubusercontent.com
 ![在这里插入图片描述](https://img-blog.csdnimg.cn/20200427195926219.jpg?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dvd2Jpbmcy,size_16,color_FFFFFF,t_70)
 然后保存，退出

然后再次执行
 wget https://raw.githubusercontent.com/mavlink/mavros/master/mavros/scripts/install_geographiclib_datasets.sh
 就可以啦！！！
 ![在这里插入图片描述](https://img-blog.csdnimg.cn/20200427200016236.jpg?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dvd2Jpbmcy,size_16,color_FFFFFF,t_70)

