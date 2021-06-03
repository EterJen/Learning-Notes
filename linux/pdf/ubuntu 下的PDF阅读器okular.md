      今天很兴奋地给大家介绍ubuntu 下的PDF 阅读器 okular [ˈɔkjələ]   中文意思是 眼睛
    
       这个软件是一用就让你爱上他的那种。
    
        step 1: 安装
    
      sudo apt-get install okular


      step 2: 注释
    
      按 F6 快捷方式打开注释功能，你会发现太神奇了。


      step 3: 中文配置
    
      如果安装完成后中文显示有问题的话，可按如下试试，如果没有问题可跳过。
    
      在 terminal 里输入
    
      sudo apt-get install poppler-data
    
      如果还不行，则再次输入
    
      sudo apt-get install poppler-utils
    
      如果依然不行，则可能是因为某些 pdf 文件没有明确指明字体，系统就会默认用英文字体来显示，于是导致中文字体显示失败！
    
      解决办法是：
    
      sudo vi /etc/fonts/conf.d/49-sansserif.conf
    
      把
      <edit name="family" mode="append_last">
      <string>sans-serif</string>
      </edit>
    
      改为
      <edit name="family" mode="append_last">
      <string>monospace</string>
      </edit>
    
      如果修改后的字体 monospace 依然不能显示，则可以改为 宋体 来显示！
————————————————
版权声明：本文为CSDN博主「steven_yzx」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
原文链接：https://blog.csdn.net/yangzhongxuan/article/details/8242740