# Docker 拉取 oracle 11g镜像配置

 docker pull registry.cn-hangzhou.aliyuncs.com/helowin/oracle_11g 
 1578  ls 
 1579  ll 
 1580  sudo -i 
 1581  docker images 
 1582  docker run -d -p 1521:1521 --name oracle11g registry.cn-hangzhou.aliyuncs.com/helowin/oracle_11g 
 1583  docker exec -it oracle11g bash 
 1584  docker status 
 1585  docker images 
 1589  sudo docker tag 3fa112fd3642 registry.cn-hangzhou.aliyuncs.com/eter/oracle_11g_docker:[v1] 
 1590  sudo docker tag 3fa112fd3642 registry.cn-hangzhou.aliyuncs.com/eter/oracle_11g_docker 
 1591  sudo docker tag 3fa112fd3642 registry.cn-hangzhou.aliyuncs.com/eter/oracle_11g_docker:v1 
 1592  sudo docker push registry.cn-hangzhou.aliyuncs.com/eter/oracle_11g_docker:v1



 1593  docker ps -a 
 1596  docker search oracle

docker commit 2c60458eda4f oracle11g_jyjoa

置顶 [荡漾-](https://me.csdn.net/qq_38380025) 2018-06-11 11:14:23 ![img](https://csdnimg.cn/release/phoenix/template/new_img/articleReadEyes.png) 54545 ![img](https://csdnimg.cn/release/phoenix/template/new_img/tobarCollect.png) 收藏 113

分类专栏： [docker](https://blog.csdn.net/qq_38380025/category_7724500.html)

版权

**话不多说**

**开始记录docker拉取阿里的oracle11g 镜像并进行配置，**

**用pl/sql 可以登录为最终结果**

### **navicat连接是在最后一步**

**参考：https://blog.csdn.net/zwx521515/article/details/77982884**

**但是根据这个进行配置会有一些问题，所以写这篇记录一下，希望可以帮助其他人**

开始：

##  **①、**开始拉取镜像-执行命令：

​     docker pull registry.cn-hangzhou.aliyuncs.com/helowin/oracle_11g

​    下载的过程少长，等待吧，喝杯咖啡，休息一会！（镜像6.8G）

​    下载完成后 查看镜像： docker images

![img](https://img-blog.csdn.net/20180611095333277?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzM4MzgwMDI1/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)

  可以看到已经下载好了

## ② 、创建容器

​    docker run -d -p 1521:1521 --name oracle11g registry.cn-hangzhou.aliyuncs.com/helowin/oracle_11g

​    这里说一下，命令后面的地址一定要是你下载的镜像地址也就是你拉取镜像名字，否则会出现名字已存在等问题！

​    如果创建成功能会返回容器id

## ③、启动容器 

​    docker start oracle11g

​    ![img](https://img-blog.csdn.net/20180611101502699?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzM4MzgwMDI1/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)

**④、进入镜像进行配置**

   1、 docker exec -it oracle11g bash

   ![img](https://img-blog.csdn.net/2018061110182486?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzM4MzgwMDI1/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)  

​    

   2、进行软连接

​      sqlplus /nolog

  ![img](https://img-blog.csdn.net/20180611102045487?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzM4MzgwMDI1/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)

  发现没有这个命令，用不了

   3、切换到root 用户下

​      su root

​      密码：helowin

​    ![img](https://img-blog.csdn.net/20180611102304799?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzM4MzgwMDI1/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)

​    **注意这里还是在容器当中。。有朋友退去了。。。。。。。**

   4、编辑profile文件配置ORACLE环境变量

```html
export ORACLE_HOME=/home/oracle/app/oracle/product/11.2.0/dbhome_2



 



export ORACLE_SID=helowin



 



export PATH=$ORACLE_HOME/bin:$PATH
```

​    ![img](https://img-blog.csdn.net/20180611102552609?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzM4MzgwMDI1/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)

​    在最后加上

​    ![img](https://img-blog.csdn.net/2018061110262749?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzM4MzgwMDI1/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)

​      保存并退出  ：wq



指出一点,docker容器配置环境变量不是在/etc/profile中,容器启动不会走这个文件;可以将环境变量的配置设置在/home/oracle/.bashrc文件下,这样可以省略掉软连接的创建

​    5、创建软连接

​      ln -s $ORACLE_HOME/bin/sqlplus /usr/bin

​    6、切换到oracle 用户

​       这里还要说一下，一定要写中间的内条 -  必须要，否则软连接无效

​      ![img](https://img-blog.csdn.net/20180611103004656?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzM4MzgwMDI1/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)

##  ⑤ 、登录sqlplus并修改sys、system用户密码

​    sqlplus /nolog

​    conn /as sysdba

​    ![img](https://img-blog.csdn.net/20180611103252382?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzM4MzgwMDI1/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)

 

​    接着执行下面命令

​    alter user system identified by system;

​    alter user sys identified by sys;

​    也可以创建用户 create user test identified by test;

​     并给用户赋予权限 grant connect,resource,dba to test;

###   注意了这里的坑开始出现了   当执行修改密码的时候出现 ：   database not open

   提示数据库没有打开，不急按如下操作

   输入：**alter database open;**

  **注意了：这里也许还会提示  ：  \**ORA-01507: database not mounted\****

   **不急！继续！**

   ![img](https://img-blog.csdn.net/20180611104926327?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzM4MzgwMDI1/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)  

  **=========== 解决方法\**===========\****

   输入：**alter database mount;**

   输入 ：**alter database open;**

​    ![img](https://img-blog.csdn.net/2018061110503377?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzM4MzgwMDI1/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)

   然后就可执行 修改数据库密码的命令了

   改完之后输入：ALTER PROFILE DEFAULT LIMIT PASSWORD_LIFE_TIME UNLIMITED;

   刷新下表 

​    exit  是退休sql 软连接

  ![img](https://img-blog.csdn.net/20180611105257965?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzM4MzgwMDI1/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)

## ⑥、使用pl/sql 进行连接 

##  ***\*navicat 连接的直接跳过 第 ⑥ 步\****

## ***\*但是\**** oracle 的 lsnrctl 服务 在第6步所以你还是看完在看第7步（虽然不需要干啥）

## **第7步是navicat连接的在最后**

​     之前我们把端口映射到了1521上，所以我们需要进行配置 **tnsnames.ora**

  **几个朋友不知道ora文件在哪，所以添加了这一步**  

  **pl/sql 安装包，汉化包，秘钥工具** **https://download.csdn.net/download/qq_38380025/11168289**

   **plsql安装配置工具包  https://blog.csdn.net/qq_38380025/article/details/89677588**

```java
docker_oracle11 =



 (DESCRIPTION =



   (ADDRESS_LIST =



     (ADDRESS = (PROTOCOL = TCP)(HOST = 192.168.211.135)(PORT =1521))



   )



   (CONNECT_DATA =



     (SERVICE_NAME = orcl)



   )



)
```

 

  打开pl/sql 进行登录 ：提示监听程序当前无法识别连接描述符中请求的服务

 

​      ![img](https://img-blog.csdn.net/20180611110342418?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzM4MzgwMDI1/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)

​      ![img](https://img-blog.csdn.net/20180611110350907?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzM4MzgwMDI1/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)  

​    这时我们需要去看一下oracle 的 lsnrctl 服务

​    ![img](https://img-blog.csdn.net/20180611110648642?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzM4MzgwMDI1/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)

​    看到这两个了么，任选其一，修改 **tnsnames.ora的 service_name=helowinXDB**

```java
docker_oracle11 =



 (DESCRIPTION =



   (ADDRESS_LIST =



     (ADDRESS = (PROTOCOL = TCP)(HOST = 192.168.211.135)(PORT =1521))



   )



   (CONNECT_DATA =



     (SERVICE_NAME = helowinXDB)



   )



)
```

   欧克，登录成功。

  ![img](https://img-blog.csdn.net/20180611111057657?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzM4MzgwMDI1/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)

## 第7步是navicat连接

 有几个朋友用的是navicat连的所以故此添加这一步

打开navicat后（navicat12不用配置oci.dll文件了）

直接新建连接

![img](https://img-blog.csdnimg.cn/20190617123213199.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzM4MzgwMDI1,size_16,color_FFFFFF,t_70)

 

![img](https://img-blog.csdnimg.cn/20190617122433781.png)

 









# 基于docker安装的oracle安装

1. 拉取镜像：
   `docker pull registry.cn-hangzhou.aliyuncs.com/helowin/oracle_11g`

2. 下载完成后 查看镜像：
   `docker images`
   ![在这里插入图片描述](https://img-blog.csdnimg.cn/2019051520153135.png)

3. 创建容器：
   docker run -d –p 1521:1521 --name oracle11g registry.cn-hangzhou.aliyuncs.com/helowin/oracle_11g
   这里说一下，命令后面的地址一定要是你下载的镜像地址也就是你拉取镜像名字，否则会出现名字已存在等问题！
   如果空间不足可以清理数据：
   删除所有dangling数据卷（即无用的Volume）：

   docker volume rm $(docker volume ls -qf dangling=true)

4. 启动容器
   docker start oracle11g
   ![在这里插入图片描述](https://img-blog.csdnimg.cn/20190515201550563.png)

5. 进入镜像进行配置

   1. 进入oracle的命令环境中。
      docker exec -it oracle11g bash
      ![在这里插入图片描述](https://img-blog.csdnimg.cn/20190515201601159.png)
   2. 切换到oracle数据库的root 用户下
      su root
      密码：helowin
      ![在这里插入图片描述](https://img-blog.csdnimg.cn/20190515201610690.png)
   3. 编辑profile文件配置ORACLE环境变量
      export ORACLE_HOME=/home/oracle/app/oracle/product/11.2.0/dbhome_2
      export ORACLE_SID=helowin
      export PATH=ORACLEHOME/bin:ORACLE_HOME/bin:*O**R**A**C**L**E**H*​*O**M**E*/*b**i**n*:PATH
      在最后加上
      ![在这里插入图片描述](https://img-blog.csdnimg.cn/20190515201632556.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80MzU4MzY5Mw==,size_16,color_FFFFFF,t_70)
   4. 创建软连接
      ln -s $ORACLE_HOME/bin/sqlplus /usr/bin
   5. 切换到oracle 用户
      这里还要说一下，一定要写中间的内条 - 必须要，否则软连接无效
      ![在这里插入图片描述](https://img-blog.csdnimg.cn/20190515201642266.png)
   6. 登录sqlplus–修改sys、system用户密码–创建用户
      ![在这里插入图片描述](https://img-blog.csdnimg.cn/20190515201652564.png)
      修改密码：
      alter user system identified by system;
      alter user sys identified by sys;
      ALTER PROFILE DEFAULT LIMIT PASSWORD_LIFE_TIME UNLIMITED;
      创建用户
      create user test identified by test;
      并给用户赋予权限
      grant connect,resource,dba to test;
      ![在这里插入图片描述](https://img-blog.csdnimg.cn/20190515201701439.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80MzU4MzY5Mw==,size_16,color_FFFFFF,t_70)
      过程中出现的报错需要输入以下内容：
      输入：alter database mount;
      输入 ：alter database open;

6. 客户端安装：
   \1. instantclient_11_2 软件目录放置到 C:\Program Files目录下
   \2. 配置环境变量：
         变量名：ORACLE_HOME
         变量值：C:\Program Files\instantclient_11_2
         变量名：TNS_ADMIN
         变量值：C:\Program Files\instantclient_11_2
         变量名：NLS_LANG
         变量值：SIMPLIFIED CHINESE_CHINA.ZHS16GBK
         修改Path变量：在后面添加 C:\Program Files\instantclient_11_2
   \3. 安装：plsqldev11.0.4.exe 除了可以选择安装路径外，其他全部默认。
   \4. 打开PLSQL Developer软件后，取消登录，可以进入软件内部，进行破解。破解文件：PLSQL Developer10.0.3.1701_keygen.exe
   \5. 配置plsql与客户端 instantclient的连接
   ![在这里插入图片描述](https://img-blog.csdnimg.cn/20190515201716503.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80MzU4MzY5Mw==,size_16,color_FFFFFF,t_70)

   1. 把instantclient_11_2目录中ADMIN文件夹中的 tnsnames.ora连接配置文件，复制进入instantclient_11_2根目录，并修改连接配置。
      host:指代服务所在ip地址。port指代：端口号 SERVICE_NAME 指代服务名
      docker_oracle11g =
         (DESCRIPTION =
            (ADDRESS_LIST =
                  (ADDRESS = (PROTOCOL = TCP)(HOST = 192.168.6.136)(PORT = 1521))
             )
            (CONNECT_DATA =
                  (SERVICE_NAME = helowinXDB)
             )
      )
      7.7 登录：
            管理员账号sys 密码sys
            connect as登录方式 sysdba