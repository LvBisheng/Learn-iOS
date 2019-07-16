# iOS
## KVO原理
比如一个Person类调用-(void)observeValueForKeyPath:ofObject:change:change context:时，监听name的属性。运行时做了这么一些事情：
1. 动态创建一个NSKVONotifying_Person类，这个类是Person的子类
2. 动态修改person对象的isa指针指向的类对象为NSKVONotifying_Person类,使得调用方法时调的是派生类的方法。
3. 派生类NSKVONotifying_Person重写setName方法，在这个方法调用父类的set方法，然后通知观察者调用-observeValueForKeyPath: ofObject: change: context:方法

[参考文章](https://www.jianshu.com/p/91c41292b5b9)

## 强类型、弱类型、静态、动态语言
* 强类型，指的是变量不允许隐式类型转换。Swift是强类型语言，定义变量a, var a = 1,就不能赋String的值，a = "A"是编译不过的。JavaSricpt是弱类型语言。
* 弱类型和强类型相反,可以隐式类型转换。
* 动态语言（Dynamic programming Language），指数据类型的检查是在运行时做的。例如Objective-C
* 静态类型语言，是指数据类型的检查是在运行前（如编译阶段）做的。

## iOS中的对象、类、元类、isa的关系
* 每一个对象本质上是一个类的实例。其中类定义了成员变量和成员方法的列表。对象通过对象的isa指针指向类。
* 每一个类本质上都是一个对象，类其实是元类(meteClass)的实例。元类定义了类方法的列表。类通过类的isa指针指向元类。
* 所有的元类最终继承一个根元类，根元类isa指针指向本身，形成一个封闭的内循环。
* 实例对象调用方法的大概逻辑：
```
MyClass *myClass = [[MyClass alloc] init];
[myClass printLog];
```

     1. 先被编译成``` ((void (*)(id, SEL))(void *) objc_msgSend)(myClass, @selector(printLog)); ```
     2. 沿着入参myClass的isa指针，找到myClass的类对象(Class)，也就是MyClass
     3. 接着在Myclass的方法列表methodLists中，找到对应的Method
     4. 最后找到Method中的IMP指针，执行具体实现


[参考文章1](https://www.jianshu.com/p/41735c66dccb) [参考文章2](https://juejin.im/post/5aa79411f265da237a4cb045)

