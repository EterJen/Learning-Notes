 

# rsync 的 delete参数

![img](https://csdnimg.cn/release/blogv2/dist/pc/img/reprint.png)

​                    [weixin_33929309](https://blog.csdn.net/weixin_33929309)                    2012-12-05 18:25:45                    ![img](https://csdnimg.cn/release/blogv2/dist/pc/img/articleReadEyes.png)                    589                                            ![img](https://csdnimg.cn/release/blogv2/dist/pc/img/tobarCollect.png)                                                收藏                                                                                        

​                    

​                    版权                

  rsync 的 delete参数  
  
rsync带上delete的参数后，当源目录中的文件删除，同步后目标目录中的文件也会被删除，如果源目录写法不当，可能无法达到同步删除目标目录的文件。例如：  
  
/usr/bin/rsync -vzrtopg --progress --delete /home/yangyz/tmp/src/* /home/yangyz/tmp/dest/  
  
当删除src下的文件或文件夹时，同步后dest中还是存在，如果是删除src的子目录下的，同步后dest中会被删除，而下面命令就不一样，不管删除的是哪个文件夹下的内容，同步dest都会做相同的删除  
  
/usr/bin/rsync -vzrtopg --progress --delete /home/yangyz/tmp/src/ /home/yangyz/tmp/dest/  
  
上述两条命令的不同之处就是在src后面是否带*号，另外如果src目录后不带斜杠，那么是将src目录复制到dest中，包含了src目录，否则是把src目录下的文件同步到dest中，不包含src目录。 

转载于:https://blog.51cto.com/passion5/1079644