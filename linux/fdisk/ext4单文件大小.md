 

## ext3，ext4 文件系统最大多少，单个文件最大多少

(2014-08-06 21:37:06)

[![img](http://simg.sinajs.cn/blog7style/images/common/sg_trans.gif)转载*▼*](javascript:;)

| 标签： 																			                            it 																			                            ext3 																			                            ext4 																			                            最大文件大小 																			                            最大文件系统多少 |      |
| ------------------------------------------------------------ | ---- |
|                                                              |      |

ext3文件系统限制
  Block size  Max file size  Max filesystem size 
  1 KiB      16 GiB           <2 TiB 
  2 KiB      256 GiB          <4 TiB 
  4 KiB      2 TiB             <8 TiB 
  8 KiB      2 TiB             <16 TiB 
 
  fdisk对于大于2t的硬盘是不能分区的.即使分区成功,写数据就会有问题.超过2t使用parted分区工具分区。

 

ext4分别支持 1EB（1,048,576TB， 1EB=1024PB， 1PB=1024TB）的文件系统，以及 16TB 的单个文件。ext4无限数量的子目录。 Ext3 目前只支持 32,000 个子目录，而 Ext4 支持无限数量的子目录。