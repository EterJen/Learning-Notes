总结

 3893  sudo chown -R git:git jyjsxfw.git

出现git push 失败，提示 ： unable to create temporary object directory 。肯定是远程服务器对应的仓库权限不够了。至于为什么会权限不够的原因可能有很多种，需要根据实际情况去判断。这一次我遇到问题是因为GitLab服务器的磁盘已经没有了，导致无法进行写文件操作。

其他读者遇到此问题，可以仅仅参考，然后自己去解决实际问题。如果你不是git服务器的管理员之类的，可以尝试联系管理员来解决！
————————————————
版权声明：本文为CSDN博主「欧阳鹏」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
原文链接：https://blog.csdn.net/ouyang_peng/article/details/81431208