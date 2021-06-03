# PO VO DAO DTO BO TO概念与区别

![img](https://csdnimg.cn/release/blogv2/dist/pc/img/reprint.png)

[liwb94](https://blog.csdn.net/liwb94) 2019-03-18 11:44:06 ![img](https://csdnimg.cn/release/blogv2/dist/pc/img/articleReadEyes.png) 785 ![img](https://csdnimg.cn/release/blogv2/dist/pc/img/tobarCollect.png) 收藏

分类专栏： [Java](https://blog.csdn.net/liwb94/category_7444473.html)

网上很多，只是做个记录

O/R Mapping 是 Object Relational Mapping（对象关系映射）的缩写。通俗点讲，就是将对象与关系数据库绑定，用对象来表示关系数据。在O/R Mapping的世界里，有两个基本的也是重要的东东需要了解，即VO，PO。 
它们的关系应该是相互独立的，一个VO可以只是PO的部分，也可以是多个PO构成，同样也可以等同于一个PO（指的是他们的属性）。这样，PO独立出来，数据持久层也就独立出来了，它不会受到任何业务的干涉，业务逻辑层也独立开来，它不会受到数据持久层的影响，业务层关心的只是业务逻辑的处理，不过，如果我们没有使用数据持久层，或者说没有使用hibernate，那么PO和VO也可以是同一个东西，虽然这并不好。 
VO，值对象(Value Object)，PO，持久对象(Persisent Object)，它们都是由一组属性和属性的get和set方法组成。从结构上看，它们并没有什么不同的地方。但从其意义和本质上来看是完全不同的： 
第一：VO是用new关键字创建，由GC回收的。 PO则是向数据库中添加新数据时创建，删除数据库中数据时削除的。且它只能存活在一个数据库连接中，断开连接即被销毁。 
第二：VO是值对象，精确点讲它是业务对象，是存活在业务层的，是业务逻辑使用的，它存活的目的就是为数据提供一个生存的地方。PO则是有状态的，每个属性代表其当前的状态。它是物理数据的对象表示。使用它，可以使我们的程序与物理数据解耦，并且可以简化对象数据与物理数据之间的转换。 
第三：VO的属性是根据当前业务的不同而不同的，也就是说，它的每一个属性都一一对应当前业务逻辑所需要的数据的名称。PO的属性是跟数据库表的字段一一对应的。 
PO(persistant object) 持久对象，通常对应数据模型(数据库)，本身还有部分业务逻辑的处理。可以看成是与数据库中的表相映射的java对象。最简单的PO就是对应数据库中某个表中的一条记录，多个记录可以用PO的集合。PO中应该不包含任何对数据库的操作。 
VO(value object) 值对象，通常用于业务层之间的数据传递，和PO一样也是仅仅包含数据而已。但应是抽象出的业务对象，可以和表对应，也可以不，这根据业务的需要。个人觉得同DTO(数据传输对象)，在web上传递。 

TO(Transfer Object)，数据传输对象，在应用程序不同关系之间传输的对象。 
BO(business object) 业务对象，从业务模型的角度看，见UML元件领域模型中的领域对象。封装业务逻辑的java对象，通过调用DAO方法，结合PO，VO进行业务操作。 
POJO(plain ordinary java object) 简单无规则java对象纯的传统意义的java对象。就是说在一些Object/Relation Mapping工具中，能够做到维护数据库表记录的persisent object完全是一个符合Java Bean规范的纯Java对象，没有增加别的属性和方法。我的理解就是最基本的Java Bean，只有属性字段及setter和getter方法。 
DAO(data access object) 数据访问对象，最主要是访问数据类，一个DAO对应一个POJO对象，是一个sun的一个标准j2ee设计模式，这个模式中有个接口就是DAO，它负持久层的操作，为业务层提供接口，用于访问数据库，通常和PO结合使用，DAO中包含了各种数据库的操作方法。通过它的方法，结合PO对数据库进行相关的操作。夹在业务逻辑与数据库资源中间。配合VO， 提供数据库的CRUD操作。 
DTO（Data Transfer Object）数据传输对象，很少用，基本放入到DAO中，只是起到过渡的作用。主要用于远程调用等需要大量传输对象的地方。比如我们一张表有100个字段，那么对应的PO就有100个属性。但是我们界面上只要显示10个字段，客户端用WEB service来获取数据，没有必要把整个PO对象传递到客户端，这时我们就可以用只有这10个属性的DTO来传递结果到客户端，这样也不会暴露服务端表结构。到达客户端以后，如果用这个对象来对应界面显示，那此时它的身份就转为VO。 

