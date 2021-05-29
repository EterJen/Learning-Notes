对于一款前端框架，提起事件，很容易让人联想到DOM事件，比如说鼠标点击以及页面滚动等。但是我们这里说的angular中的事件和DOM事件并不是一个东西。

### 事件的发布

我们可以通过$emit()以及$broadcast()来发布事件

$emit(name, args)

name发布的事件名称

args会作为对象传递到事件的监听器中

$emit()发布的事件，会从子作用域冒泡到父作用域，产生事件的作用域之上的所有作用域都会收到这个事件的通知。



$broadcast(name, args)

同$emit的参数一直，name作为事件的名字，args作为监听器接受 的参数。使用该方法事件的传播方向是从上至下，即从父作用域到子作用域。

### 事件的监听

事件发布了，我们要注册监听事件的服务，才会对事件进行响应

可以通过$on()方法来注册事件监听事件。

$scope.$on(name, listenerFn)

当以name为事件名的事件被促发之后，listenerFn事件就会被执行。

$on()返回一个反注册函数，可以用其来取消监听器。

### 事件对象

所有的事件监听器第一个参数都代表了事件对象，该对象有以下属性：

targetScope作用域对象，发送事件的作用域

currentScope:当前处理事件的作用域

name:当前事件的事件的名称

stopPropagation:取消$emit触发的事件进一步的传播

preventDefaul：把defaultPreevented标志设置为true，告诉子作用域可以无需处理该事件。

defaultPreevented：布尔值

### angular内置事件

$includeContentLoaded（$emit事件）

ngInclude内容重新加载的时候，从ngInclude指令触发



$includeContentRequested（$emit事件）

从调用ngInclude的作用域上发送，每次ngInclude的内容被请求的时候，都会发布该事件



$viewContentLoaded（$emit事件）

当ngView内容被重新加载时，从ngView作用域上发布



$locationChangeStart($broadcast事件)

通过$location服务对浏览器的地址更新时会触发$locationChangeStart事件



$locationChangeSuccess($broadcast事件)

当浏览器的地址成功变更时触发



$routeChangeStart($broadcast事件)

在路由变更发生之前，该事件从$rootScope发布