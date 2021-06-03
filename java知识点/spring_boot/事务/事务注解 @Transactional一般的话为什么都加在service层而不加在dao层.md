# 事务注解 @Transactional一般的话为什么都加在service层而不加在dao层

![img](https://csdnimg.cn/release/blogv2/dist/pc/img/reprint.png)

[stujike123456](https://blog.csdn.net/jikefzz1095377498) 2018-07-25 11:40:43 ![img](https://csdnimg.cn/release/blogv2/dist/pc/img/articleReadEyes.png) 19359 ![img](https://csdnimg.cn/release/blogv2/dist/pc/img/tobarCollect.png) 收藏 14

分类专栏： [数据库](https://blog.csdn.net/jikefzz1095377498/category_7282867.html)

## 原文地址：https://blog.csdn.net/panyangxu/article/details/77431873

## 什么是事务？

------

**在数据库中,所谓事务是指一组逻辑操作单元即一组sql语句。当这个单元中的一部分操作失败,整个事务回滚，只有全部正确才完成提交。判断事务是否配置成功的关键点在于出现异常时事务是否会回滚**

## 事务四大特性

------

**1. 原子性（Atomicity）** 
*原子性是指事务是一个不可分割的工作单位，事务中的操作要么都发生，要么都不发生*。

**2. 一致性（Consistency）** 
*事务必须使数据库从一个一致性状态变换到另外一个一致性状态。(数据不被破坏*

**3.隔离性（Isolation）** 
*事务的隔离性是指一个事务的执行不能被其他事务干扰.*

**4.持久性（Durability）** 
*持久性是指一个事务一旦被提交，它对数据库中数据的改变就是永久性的.即使系统重启也不会丢失.*

------

结合事务的特点，为什么加在service层就很好解释了。如果我们的事务注解@Transactional加在dao层，那么只要与数据库做增删改，就要提交一次事务，如此做事务的特性就发挥不出来，尤其是事务的一致性，当出现并发问题是，用户从数据库查到的数据都会有所偏差。 
一般的时候，我们的service层可以调用多个dao层，我们只需要在service层加一个事务注解@Transactional，这样我们就可以一个事务处理多个请求，事务的特性也会充分的发挥出来。

也可以这么说：

因为一个Service完成一个服务，但是可能会调用很多个DAO层的功能，如果Transaction放在DAO层的话，做完一个DAO，就会提交一次事务，永久修改数据库，后面在调用另外一个DAO，但是throws Exception，对于整个的Service来说，应该是要完全回滚的，但是只能回滚到当前的DAO

所以这就破坏了事务的ＡＣＩＤ

有一些项目的事务是在Controller层。

