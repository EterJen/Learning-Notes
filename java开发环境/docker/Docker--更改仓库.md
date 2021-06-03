# Docker--更改仓库

![img](https://csdnimg.cn/release/phoenix/template/new_img/original.png)

[喜欢雨天的我](https://me.csdn.net/qq_15807167) 2018-04-11 11:16:20 ![img](https://csdnimg.cn/release/phoenix/template/new_img/articleReadEyes.png) 12760 ![img](https://csdnimg.cn/release/phoenix/template/new_img/tobarCollect.png) 收藏 2

分类专栏： [Linux--运维](https://blog.csdn.net/qq_15807167/category_6567109.html)

版权

> 为什么进行更改仓库是由于`TLS handshake timeout`异常 无法连接docker境外仓库
>
> ------



- [Linux更改](https://blog.csdn.net/qq_15807167/article/details/79893584#linux更改)
- [window更改](https://blog.csdn.net/qq_15807167/article/details/79893584#window更改)
- [生效后](https://blog.csdn.net/qq_15807167/article/details/79893584#生效后)



# Linux更改

- 单次更改
  **格式内容为**

```
docker pull registry.docker-cn.com/myname/myrepo:mytag1
```

**例如**

```
docker pull registry.docker-cn.com/library/ubuntu:16.041
```

- 永久更改
  **修改：**`/etc/docker/daemon.json`增加如下内容

```
{
  "registry-mirrors": ["https://registry.docker-cn.com"]
}

```

保存配置后，重启Docker进行生效

sudo systemctl daemon-reload  

sudo systemctl restart docker.service 



sudo mkdir -p /etc/docker 

sudo tee /etc/docker/daemon.json <<-'EOF' {  "registry-mirrors": ["https://vhqb3esx.mirror.aliyuncs.com"] } EOF 

sudo systemctl daemon-reload 

sudo systemctl restart docker

# window更改

Windows进行更改仓库位置如图：

![这里写图片描述](https://img-blog.csdn.net/20180411111418128?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzE1ODA3MTY3/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)

等待重启后进行使用。

# 生效后

![这里写图片描述](https://img-blog.csdn.net/20180411111546881?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzE1ODA3MTY3/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)