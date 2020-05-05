<input type="checkbox" class="input" />
  <input type="text" class="input1" value="值" />

  <div class="test">div1</div>
  <div class="test">div2</div>
  <div class="test1">
    <p>子元素</p>
  </div>
  <div class="test2" data-value="wwe">
    <!--注释-->
    <p>子元素1</p>
  </div>
  <div class="test3 test4">
    <p>p1</p>
    <p class="p2">p2</p>
    <p>p3</p>
    <p>p4</p>
    <p>p5</p>
    <span> 
      span1
    </span>
  </div>
  <script>
    //bind() - 为一个元素绑定一个事件处理程序
    //data()-在匹配元素上存储任意相关数据
    //on() - 在选定的元素上绑定一个或多个事件处理函数
    //off() - 移除一个事件处理函数
    //one() - 为元素的事件添加处理函数。处理函数在每个元素上每种事件类型最多执行一次
    //ready()-当DOM准备就绪时，指定一个函数来执行
    //removeData()-在元素上移除绑定的数据
    //triggerHandler() -为一个事件执行附加到元素的所有处理程序
    //unbind() - 从元素上删除一个以前附加事件处理程序

    //addClass()-为每个匹配的元素添加指定的样式类名
    angular.element(document.querySelectorAll(".test")).addClass("asd");
    
    //after()-在匹配元素集合中的每个元素后面插入参数所指定的内容，作为其兄弟节点
    angular.element(document.querySelector(".test")).after("<p>我是通过after()添加进来的</p>");
    
    //append()-在每个匹配元素里面的末尾处插入参数内容
    angular.element(document.querySelector(".test")).append("<p>我是通过append()添加进来的</p>");
    
    //attr() - 获取匹配的元素集合中的第一个元素的属性的值
    console.log(angular.element(document.querySelector(".test")).attr("class"));
    
    //children() - 获得匹配元素集合中每个元素的子元素，选择器选择性筛选
    console.log(angular.element(document.querySelector(".test1")).children());
    
    //clone()-创建一个匹配的元素集合的深度拷贝副本
    angular.element(document.querySelector(".test")).append(angular.element(document.querySelector(".test1")).clone());
    
    //contents()-获得匹配元素集合中每个元素的子元素，包括文字和注释节点
    console.log(angular.element(document.querySelector(".test2")).contents());
    
    //css() - 获取匹配元素集合中的第一个元素的样式属性的值
    console.log(angular.element(document.querySelector(".test3")).css("color"));
    
    //detach()-从DOM中去掉所有匹配的元素
    angular.element(document.querySelector(".test1 p")).detach();
    
    //empty()-从DOM中移除集合中匹配元素的所有子节点
    angular.element(document.querySelector(".test2")).empty();
    
    //eq()-减少匹配元素的集合为指定的索引的哪一个元素
    console.log(angular.element(document.querySelectorAll(".test3 p")).eq(2)[0].innerHTML);
    
    //find() - 通过一个选择器，jQuery对象，或元素过滤，得到当前匹配的元素集合中每个元素的后代
    console.log(angular.element(document.querySelector(".test3")).find("span")[0].innerHTML);
    
    //hasClass()-确定任何一个匹配元素是否有被分配给定的（样式）类
    console.log(angular.element(document.querySelector(".test3")).hasClass("test4"));
    
    //html()-获取集合中第一个匹配元素的HTML内容
    console.log(angular.element(document.querySelector(".test2")).html());
    
    //next() - 取得匹配的元素集合中每一个元素紧邻的后面同辈元素的元素集合。如果提供一个选择器，那么只有紧跟着的兄弟元素满足选择器时，才会返回此元素
    console.log(angular.element(document.querySelector(".test3 .p2")).next()[0].innerHTML);
    
    //parent() - 取得匹配元素集合中，每个元素的父元素，可以提供一个可选的选择器
    console.log(angular.element(document.querySelector("span")).parent());


    //prepend()-将参数内容插入到每个匹配元素的前面（元素内部）
    angular.element(document.querySelector(".test")).prepend("<p>我是通过prepend()添加进来的</p>");
    
    //prop()-获取匹配的元素集中第一个元素的属性（property）值
    angular.element(document.querySelector(".input")).prop("checked", true);
    
    //remove()-将匹配元素集合从DOM中删除。（同时移除元素上的事件及 jQuery 数据。）
    angular.element(document.querySelector(".test2")).remove();
    
    //removeAttr()-为匹配的元素集合中的每个元素中移除一个属性（attribute）
    angular.element(document.querySelector(".test2")).removeAttr("data-value");
    
    //removeClass()-移除集合中每个匹配元素上一个，多个或全部样式
    angular.element(document.querySelector(".test3")).removeClass("test4");
    
    //replaceWith() - 用提供的内容替换集合中所有匹配的元素并且返回被删除元素的集合
    angular.element(document.querySelector(".test1")).replaceWith("<p>replaceWith()替换的内容</p>");
    
    //text()-得到匹配元素集合中每个元素的合并文本，包括他们的后代
    console.log(angular.element(document.querySelector(".test")).text());
    
    //toggleClass()-在匹配的元素集合中的每个元素上添加或删除一个或多个样式类,取决于这个样式类是否存在或值切换属性。即：如果存在（不存在）就删除（添加）一个类
    angular.element(document.querySelector(".test1")).toggleClass("test1");
    angular.element(document.querySelector(".test2")).toggleClass("test1");
    
    //val()-获取匹配的元素集合中第一个元素的当前值
    console.log(angular.element(document.querySelector(".input1")).val());
    
    //wrap() - 在每个匹配的元素外层包上一个html元素
    angular.element(document.querySelector(".test1")).wrap("<div></div>");
  </script>



关键是看你调用这个方法是在哪里的js , iframe 相当于另外一个页面了。

$('#id', window.parent.document).modal('hide');