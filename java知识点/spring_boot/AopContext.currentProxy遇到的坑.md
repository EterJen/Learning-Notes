- # [AopContext.currentProxy遇到的坑](https://www.cnblogs.com/aligege/p/13632855.html)

  ```
  Spring的切面功能，是通过代理的方式来实现的，实现方式有JDK动态代理方式及Cglib的方式。
  
  有时需要在service层通过AOP做一些日志、权限、监控等功能，但在service中进行自调用时，无法再次走进代理类中，因此会导致漏日志的情况出现。
  
  此时，可通过AopContext.currentProxy()来解决问题。用AopContext.currentProxy().xxxx()的方式代替this.xxxx()的自调用方式。
  AopContext.currentProxy()的本质是使用的ThreadLocal生成本地代理，这样的做法可能影响性能，后续文章对ThreadLocal的内部原理和性能进行进一步深入！
  AopContext.currentProxy()的局限性：
  ```

  　　1）AopContext.currentProxy()调用的方法中，如果此方法再调用其他的service，则此方法必须是public的修饰符。否则会发现通过@Autowired注入的service值为null。

  分类: [Spring](