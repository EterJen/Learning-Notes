导入第三方Jar包到Nexus私服
1.1登陆Nexus服务器，创建仓库 Create repository
1.2选择仓库类型,选择maven2(hosted),本地仓库:
1.3给仓库起个名字 3rd_part,然后点击最下面的(图中没显示)的Create repository 按钮
1.4保存之后,在点击进入这个本地仓库,拿到该本地仓库的地址:
http://localhost:8081/repository/3rd_part/
待会后面执行命令的时候需要把localhost换成Nexus的服务器地址.
1.5去到仓库组maven-public中添加刚刚创建的本地仓库3rd_part:
接着将本地仓库3rd_part 加入到仓库组中:

2.如下操作在项目组成员电脑操作都可以的.
找到.m2/setting.xml 或者 maven安装目录/conf/setting.xml 文件,找到里面的 <servers> 节点，添加如下配置:
<server>   
    <id>thirdparty</id>   
    <username>admin</username>
    <password>admin123</password>   
</server>
id:待会输入命令的时候需要用到
username:表示Nexus服务器的登陆账号
password:表示Nexus服务器的登陆密码

2.打开CMD命令控制台,输入如下命令:
mvn deploy:deploy-file -DgroupId=cn.wolfcode -DartifactId=p2p -Dversion=1.0.0 -Dpackaging=jar -Dfile=D:\test\p2p.jar -Durl=http://192.168.142.128:8081/repository/3rd_part/ -DrepositoryId=thirdparty


DgroupId、DartifactId、Dversion:构成了该jar包在pom.xml的坐标，自己起名字也是可以的.
Dpackaging:表示打包类型.
Dfile:表示需要上传的jar包的绝对路径.
Durl:私服上第三方仓库的地址,打开nexus——>repositories菜单,可以看到该路径。
DrepositoryId:服务器的表示id,就是我们在setting.xml文件中配置的serverId。
执行成功表示已经上传到Nexus私服了



