# [LOMBOK @BUILDER注解使用的例子、反编译之后的代码详解](https://www.cnblogs.com/theRhyme/p/10181103.html)

lombok的@Builder实际是[建造者模式](https://www.cnblogs.com/theRhyme/p/10401562.html)的一个变种，所以在创建复杂对象时常使用

这里对lombok的@Builder和@Data组合的使用示例

[![复制代码](https://common.cnblogs.com/images/copycode.gif)](javascript:void(0);)

```
import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class People {
    private String name;
    private String sex;
    private int age;
}
```

[![复制代码](https://common.cnblogs.com/images/copycode.gif)](javascript:void(0);)

 

使用了@Bulider和@Data注解后，就可以使用链式风格优雅地创建对象

[![复制代码](https://common.cnblogs.com/images/copycode.gif)](javascript:void(0);)

```
public class TestLombok {

    @Test
    public void testBuilderAnnotation(){
        People luoTianyan = People.builder()
                .sex("female")
                .age(23)
                .name("LuoTianyan")
                .build();


        System.out.println(luoTianyan.toString());
        //People(name=LuoTianyan, sex=female, age=23)

        People people = new People("LuoTianyan","female",23);
        System.out.println(luoTianyan.equals(people));
        //true
    }

}
```

[![复制代码](https://common.cnblogs.com/images/copycode.gif)](javascript:void(0);)

 

class People加上了@Builder和@Data注解后，多了一个静态内部类PeopleBuilder，People调用静态方法builder生成PeopleBuilder对象，PeopleBuilder对象可以使用".属性名(属性值)"的方式进行属性设置，再调用build()方法就生成了People对象，并且如果两个People对象的属性如果相同，就会认为这两个对象相等，即重写了hashCode和equls方法。

 

可以利用[Javap](https://www.cnblogs.com/theRhyme/p/10192330.html)、[cfr](https://www.cnblogs.com/theRhyme/p/10216316.html)进行反编译该字节码；

这里就直接在Intellij IDEA下，查看反编译的文件People.class；

可以看到，生成的有：

- Getter和Setter方法；
- 访问类型是private无参构造方法，访问类型为default的全部参数的构造方法；
- 重写hashCode、equals、toString方法，则People可以做为Map的key；
- 访问类型为public的静态方法builder，返回的是People.PeopleBuilder对象，非单例；
- 访问类型为public的静态内部类PeopleBuilder，该类主要有build方法，返回类型是People；
- 最后还有个canEqual方法，判断是否与People同类型。

 

[![复制代码](https://common.cnblogs.com/images/copycode.gif)](javascript:void(0);)

```
//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by Fernflower decompiler)
//


public class People {
    private String name;
    private String sex;
    private int age;

    People(String name, String sex, int age) {
        this.name = name;
        this.sex = sex;
        this.age = age;
    }

    public static People.PeopleBuilder builder() {
        return new People.PeopleBuilder();
    }

    private People() {
    }

    public String getName() {
        return this.name;
    }

    public String getSex() {
        return this.sex;
    }

    public int getAge() {
        return this.age;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public boolean equals(Object o) {
        if (o == this) {
            return true;
        } else if (!(o instanceof People)) {
            return false;
        } else {
            People other = (People)o;
            if (!other.canEqual(this)) {
                return false;
            } else {
                label39: {
                    Object this$name = this.getName();
                    Object other$name = other.getName();
                    if (this$name == null) {
                        if (other$name == null) {
                            break label39;
                        }
                    } else if (this$name.equals(other$name)) {
                        break label39;
                    }

                    return false;
                }

                Object this$sex = this.getSex();
                Object other$sex = other.getSex();
                if (this$sex == null) {
                    if (other$sex != null) {
                        return false;
                    }
                } else if (!this$sex.equals(other$sex)) {
                    return false;
                }

                if (this.getAge() != other.getAge()) {
                    return false;
                } else {
                    return true;
                }
            }
        }
    }

    protected boolean canEqual(Object other) {
        return other instanceof People;
    }

    public int hashCode() {
        int PRIME = true;
        int result = 1;
        Object $name = this.getName();
        int result = result * 59 + ($name == null ? 43 : $name.hashCode());
        Object $sex = this.getSex();
        result = result * 59 + ($sex == null ? 43 : $sex.hashCode());
        result = result * 59 + this.getAge();
        return result;
    }

    public String toString() {
        return "People(name=" + this.getName() + ", sex=" + this.getSex() + ", age=" + this.getAge() + ")";
    }

    public static class PeopleBuilder {
        private String name;
        private String sex;
        private int age;

        PeopleBuilder() {
        }

        public People.PeopleBuilder name(String name) {
            this.name = name;
            return this;
        }

        public People.PeopleBuilder sex(String sex) {
            this.sex = sex;
            return this;
        }

        public People.PeopleBuilder age(int age) {
            this.age = age;
            return this;
        }

        public People build() {
            return new People(this.name, this.sex, this.age);
        }

        public String toString() {
            return "People.PeopleBuilder(name=" + this.name + ", sex=" + this.sex + ", age=" + this.age + ")";
        }
    }
}
```

[![复制代码](https://common.cnblogs.com/images/copycode.gif)](javascript:void(0);)

 

自从Java 6起，Javac就支持“JSR 269 Pluggable Annotation Processing API”规范，只要程序实现了该API，就能在javac运行的时候得到调用。

Lombok就是一个实现了"JSR 269 API"的程序。在使用javac的过程中，它产生作用的具体流程如下：

1. Javac对源代码进行分析，生成一棵抽象语法树(AST)
2. Javac编译过程中调用实现了JSR 269的Lombok程序
3. 此时Lombok就对第一步骤得到的AST进行处理，找到Lombok注解所在类对应的语法树(AST)，然后修改该语法树(AST)，增加Lombok注解定义的相应树节点
4. Javac使用修改后的抽象语法树(AST)生成字节码文件

作者：[rhyme](https://www.cnblogs.com/theRhyme/)

出处：https://www.cnblogs.com/theRhyme/p/10181103.html

![img](https://img2020.cnblogs.com/blog/1158841/202105/1158841-20210502102429121-1775367863.png)

分类: [20180730](https://www.cnblogs.com/theRhyme/category/1266165.html), [Java基础](https://www.cnblogs.com/theRhyme/category/1081332.html), [其他](https://www.cnblogs.com/theRhyme/category/1233928.html), [工具](https://www.cnblogs.com/theRhyme/category/1371391.html), [设计模式](https://www.cnblogs.com/theRhyme/category/1398519.html)

标签: [Java基础](https://www.cnblogs.com/theRhyme/tag/Java基础/), [lombok](https://www.cnblogs.com/theRhyme/tag/lombok/), [工具](https://www.cnblogs.com/theRhyme/tag/工具/)