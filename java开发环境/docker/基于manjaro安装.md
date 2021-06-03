# 基于manjaro安装

sudo pacman -S docker

sudo groupadd docker #添加docker用户组

sudo gpasswd -a $USER docker #将登陆用户加入到docker用户组中

newgrp docker #更新用户组

sudo systemctl  daemon-reload 

sudo systemctl restart docker.service 

docker info #基本信息查看



# docker安装

1. 安装一些必要的系统工具：
   `sudo yum install -y yum-utils device-mapper-persistent-data lvm2`
2. 添加软件源信息：
   `sudo yum -y install yum-utils` #安装yum-config-manager命令对应工具
   `sudo yum-config-manager --add-repo http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo`
3. 更新 yum 缓存：
   `sudo yum makecache fast`
4. 安装 Docker-ce：
   `sudo yum -y install docker-ce`
5. 启动 Docker 后台服务
   `sudo systemctl start docker`
6. 测试运行 hello-world
   `docker run hello-world`
   ![在这里插入图片描述](https://img-blog.csdnimg.cn/20190515200335807.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80MzU4MzY5Mw==,size_16,color_FFFFFF,t_70)
   由于本地没有hello-world这个镜像，所以会下载一个hello-world的镜像，并在容器内运行。
7. 查看docker的镜像
   `docker images`
8. 在docker中安装与配置tomcat。
   1. 拉取镜像：`docker pull tomcat`
   2. 使用tomcat镜像
      启动docker容器中的镜像：
      例子：`docker run --name tomcat -p 5555:8080 -v /home/mengsheng/abc:/usr/local/tomcat/webapps/ -d tomcat`
      -d：表示以“守护模式”执行/root/run.sh脚本，此时 Tomcat 控制台不会出现在输出终端上。 -d跟镜像名 tomcat
      -p：表示宿主机与容器的端口映射，此时将容器内部的 8080 端口映射为宿主机的 5555 端口，这样就向外界暴露了 58080 端口，可通过 Docker 网桥来访问容器内部的 8080 端口了。
      -v：表示需要将本地哪个目录挂载到容器中，格式：-v <宿主机目录>:<容器目录>
      /home/mengsheng/abc 把自己的项目资源放到这个目录下，就相当于放到了tomcat中的usr/local/tomcat/webapps/
      –name：表示容器名称，用一个有意义的名称命名即可。
   3. 查看镜像软件的运行情况：
      `docker ps`
   4. 停止/运行tomcat软件容器： 5421指代id的前四位
      `docker stop/start 5421`
      ![在这里插入图片描述](https://img-blog.csdnimg.cn/20190515201034586.png)
   5. 移除docker中的软件容器
      \#docker rm 5421
   6. 移除掉docker中下载的镜像：
      ![在这里插入图片描述](https://img-blog.csdnimg.cn/20190515201153861.png)

1. 1. 