## linux 下安装redis出现jemalloc/jemalloc.h：没有那个文件或目录

在运行make命令后加上MALLOC=libc

\#make MALLOC=libc