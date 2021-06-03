##              [     Ionic 日期时间插件        ](https://www.cnblogs.com/linsu/p/5727976.html)         

1.插件安装 日期插件 时间插件

![img](https://images2015.cnblogs.com/blog/203353/201608/203353-20160802083829372-1387797101.png)

![img](https://images2015.cnblogs.com/blog/203353/201608/203353-20160802083909231-866157038.png)

备注： 具体 查看 https://github.com/rajeshwarpatlolla/ionic-datepicker   https://github.com/rajeshwarpatlolla/ionic-timepicker  

2.配置示例：

```
config 中配置
```

[![复制代码](https://common.cnblogs.com/images/copycode.gif)](javascript:void(0);)

```
 1 .config(['ionicTimePickerProvider','ionicDatePickerProvider',
 2     function(ionicTimePickerProvider,ionicDatePickerProvider) {
 3 
 4     var timePickerObj = {
 5         inputTime: (((new Date()).getHours() * 60 * 60) + ((new Date()).getMinutes() * 60)),
 6         format: 12,
 7         step: 15,
 8         setLabel: '选择',
 9         closeLabel: '关闭'
10       };
11     var datePickerObj = {
12       inputDate: new Date(),
13       setLabel: '选择',
14       todayLabel: '今天',
15       closeLabel: '关闭',
16       mondayFirst: false,
17       weeksList: ["日", "一", "二", "三", "四", "五", "六"],//["S", "M", "T", "W", "T", "F", "S"],
18       monthsList: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],//["Jan", "Feb", "March", "April", "May", "June", "July", "Aug", "Sept", "Oct", "Nov", "Dec"]
19       templateType: 'popup',
20       from: new Date(2012, 1, 1),
21       to: new Date(2020, 1, 1),
22       showTodayButton: true,
23       dateFormat: 'yyyy-MM-dd',
24       closeOnSelect: false
25       //disableWeekdays: [6]
26     };
27     ionicDatePickerProvider.configDatePicker(datePickerObj);
28     ionicTimePickerProvider.configTimePicker(timePickerObj);
29 }])
```

[![复制代码](https://common.cnblogs.com/images/copycode.gif)](javascript:void(0);)

3.controller

[![复制代码](https://common.cnblogs.com/images/copycode.gif)](javascript:void(0);)

```
.controller("consumeCtrl",["ionicDatePicker","ionicTimePicker", function (ionicDatePicker,ionicTimePicker) {
    var ipObj1 = {
      callback: function (val) { 
        console.log('点击事件返回值 : ' + val, new Date(val));
      },
      /***
      disabledDates: [
        new Date(2016, 2, 16),
        new Date(2015, 3, 16),
        new Date(2015, 4, 16),
        new Date(2015, 5, 16),
        new Date('Wednesday, August 12, 2015'),
        new Date("08-16-2016"),
        new Date(1439676000000)
      ],***/
      from: new Date(2012, 1, 1),
      to: new Date(2016, 10, 30),
      inputDate: new Date(),
      mondayFirst: false,
     // disableWeekdays: [],
      closeOnSelect: false,
      templateType: 'popup'
    };
    $scope.openDatePicker = function(){
      ionicDatePicker.openDatePicker(ipObj1);
    };
    var ipOb2 = {
      callback: function (val) {
        if (typeof (val) === 'undefined') {
          console.log('Time not selected');
        } else {
          var selectedTime = new Date(val * 1000);
          console.log('点击事件返回值 : ', val, 'and the time is ', selectedTime.getUTCHours(), 'H :', selectedTime.getUTCMinutes(), 'M');
        }
      },
      inputTime: 50400,
      format: 12,
      step: 15,
    };
    $scope.openTimePicker = function(){
      ionicTimePicker.openTimePicker(ipOb2);
    };

  }])
```

[![复制代码](https://common.cnblogs.com/images/copycode.gif)](javascript:void(0);)

4.html 及效果

[![复制代码](https://common.cnblogs.com/images/copycode.gif)](javascript:void(0);)

```
1 <ion-view view-title="消费记录"  >
2   <ion-content>
3     <button  ng-click="openDatePicker()">日期</button>
4     <button  ng-click="openTimePicker()">时间</button>
5 
6   </ion-content>
7   </ion-view>
```

[![复制代码](https://common.cnblogs.com/images/copycode.gif)](javascript:void(0);)

备注：记得index.html 引用

```
<!--日期控件-->
<script src="lib/ionic-datepicker/dist/ionic-datepicker.bundle.min.js"></script>
<!--时间控件-->
<script src="lib/ionic-timepicker/dist/ionic-timepicker.bundle.min.js"></script>
```

![img](https://images2015.cnblogs.com/blog/203353/201608/203353-20160802085339434-1601183168.png)![img](https://images2015.cnblogs.com/blog/203353/201608/203353-20160802085355497-1948481828.png)

```

```

 

