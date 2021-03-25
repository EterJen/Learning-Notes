1. 在 SPRING 中一共定义了六种事务传播属性
2.  
3. PROPAGATION_REQUIRED -- 支持当前事务，如果当前没有事务，就新建一个事务。这是最常见的选择。 
4. PROPAGATION_SUPPORTS -- 支持当前事务，如果当前没有事务，就以非事务方式执行。 
5. PROPAGATION_MANDATORY -- 支持当前事务，如果当前没有事务，就抛出异常。 
6. PROPAGATION_REQUIRES_NEW -- 新建事务，如果当前存在事务，把当前事务挂起。 
7. PROPAGATION_NOT_SUPPORTED -- 以非事务方式执行操作，如果当前存在事务，就把当前事务挂起。 
8. PROPAGATION_NEVER -- 以非事务方式执行，如果当前存在事务，则抛出异常。 
9. PROPAGATION_NESTED -- 如果当前存在事务，则在嵌套事务内执行。如果当前没有事务，则进行与PROPAGATION_REQUIRED类似的操作。 
10.  
11. 最容易弄混淆的其实是PROPAGATION_REQUIRES_NEW 和 PROPAGATION_NESTED 
12.  
13. PROPAGATION_REQUIRES_NEW 启动一个新的, 不依赖于环境的 "内部" 事务. 这个事务将被完全 
14. commited 或 rolled back 而不依赖于外部事务,它拥有自己的隔离范围, 自己的锁, 等等. 
15. 当内部事务开始执行时, 外部事务将被挂起, 内务事务结束时, 外部事务将继续执行. 
16. PROPAGATION_REQUIRES_NEW常用于日志记录,或者交易失败仍需要留痕
17.  
18. 另一方面, PROPAGATION_NESTED 开始一个 "嵌套的" 事务,  它是已经存在事务的一个真正
19. 的子事务. 潜套事务开始执行时,  它将取得一个 savepoint.
20. 如果这个嵌套事务失败, 我们将回滚到此 savepoint. 潜套事务是外部事务的一部分,
21.  只有外部事务结束后它才会被提交. 
22. 由此可见, PROPAGATION_REQUIRES_NEW 和 PROPAGATION_NESTED 的最大区别在于, 
23. PROPAGATION_REQUIRES_NEW 完全是一个新的事务, 而 PROPAGATION_NESTED 
24. 则是外部事务的子事务, 如果外部事务 commit, 潜套事务也会被 commit,
25.  这个规则同样适用于 roll back. 
26.  
27. 几个例子理解REQUIRED、REQUIRES_NEW、NESTED 的使用注意事项(TRY...CATCH配合使用)
28.  
29. 1、REQUIRED的使用注意项
30.  
31. 1.1 REQUIRED保证其处理过程同一个事务,如果调用的同一个类的配置的REQUIRED的方法,且此方法存在TRY CATCH
32. 代码块, 如果此代码块出现异常,程序可以继续执行。
33.  
34. 1.2 但如果调用的其他类的配置REQUIRED方法,且TRY CATCH住,则全部的提交全部回滚,且报出异常：
35. Transaction rolled back because it has been marked as rollback-only
36. 因为事务报出异常后要全部回滚,包括父类的调用。
37.  
38. 1.3 如果service中包含多个dao的方法,其都属于同一个事务,其中报错全部回滚,try catch住不影响程序代码的继续执行.
39.  
40.  
41. class A{
42.    *//PROPAGATION_REQUIRED*
43. ​	 void methodA() {
44. ​        try{
45. ​          methodB(); *//可以继续执行,因为是同一个类*
46. ​        }catch(Exception ex){
47. ​          ex.printStrace();
48. ​        }
49. ​        
50. ​        try{
51. ​          methodC(); *//报错Transaction rolled back because it has been marked as rollback-only*
52. ​                     *//因为回滚整个事务,不能用try catch住.当然通过不会try catch一个事务的部分代码*
53. ​        }catch(Exception ex){
54. ​          ex.printStrace();
55. ​        }
56.    }
57.    
58.    *//PROPAGATION_REQUIRED*
59.    void methodB() {
60.    
61.    }
62. }
63.  
64. class B{
65.    
66.    *//PROPAGATION_REQUIRED*
67.    void methodC() {
68.    
69.    }
70. }
71.  
72. 2、NESTED的具体用途如下：
73. 在此方法出现异常时,通过TRY CATCH 代码块包含住, 继续往下执行或者执行CATCH中的处理.
74. 此点REUQIRED做不到, REQUIRED_NEW能做到, 但它是单独的事务，不与父类一块提交的。
75.  
76. ServiceA { 
77. **/****
78.  
79. ** 事务属性配置为 PROPAGATION_REQUIRED*
80.  
81. **/*
82.  
83. void methodA() {
84.  
85. try {
86.  
87. *//savepoint*
88.  
89. ServiceB.methodB(); *//PROPAGATION_NESTED 级别*
90.  
91. } catch (SomeException) {
92.  
93. *// 执行其他业务, 如 ServiceC.methodC();*
94. }}}