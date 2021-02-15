被远程端 

3326  sudo vi /etc/ssh/sshd_config 
 3327  sudo systemctl restart sshd.service

```
#       $OpenBSD: sshd_config,v 1.103 2018/04/09 20:41:22 tj Exp $

# This is the sshd server system-wide configuration file.  See
# sshd_config(5) for more information.

# This sshd was compiled with PATH=/usr/local/sbin:/usr/local/bin:/usr/bin

# The strategy used for options in the default sshd_config shipped with
# OpenSSH is to specify options with their default value where
# possible, but leave them commented.  Uncommented options override the
# default value.

Port 22 
Port 2222 #增加端口为2222 开放多个时会以第一个为默认访问端口

```



访问端操作

```sh
#1.生成密钥  可以使用-t ed25519指定加密方案
ssh-keygen  -f eter_dell_rsa -P'sshtest'
#2.将指定公钥追加到被远程主机的默认受信任文件
cat eter_dell_rsa.pub | ssh -p 22 eter@192.168.1.101 'cat >> ~/.ssh/authorized_keys' 
#3.通过私钥远程访问，没有使用ssh-agent时每次都会要求输入私钥的认证密码
ssh -i /home/eter/.ssh/eter_dell_rsa eter@192.168.1.101 
#4.启动ssh-agent的两种方式
ssh-agent $SHELL #当前shell
eval `ssh-agent` #开启独立进程
#5.讲私钥添加到ssh-agent，会要求输入私钥认证密码（存储起来，后面不再需要）
ssh-add eter_dell_rsa 
ssh-add -p 2222 eter_dell_rsa
#6.后面远程访问只需提供一次私钥密码，断开后可直接重连，多个密钥会自动匹配，无需手动指定用那个私钥（第二种访问方式）
ssh -p 2222 -i  /home/eter/.ssh/eter_dell_rsa eter@192.168.1.101
ssh -p 2222 eter@192.168.1.101
#7.维护当前已添加私钥
ssh-add -l #查看所有私钥
ssh-add -L #查看所有对应公钥
ssh-add -d 私钥文件 #删除指定的私钥
ssh-add -D #删除所有私钥
```

