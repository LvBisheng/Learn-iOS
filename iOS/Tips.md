# iOS
## KVO原理
比如一个Person类调用-(void)observeValueForKeyPath:ofObject:change:change context:时，监听name的属性。运行时做了这么一些事情：
1. 动态创建一个NSKVONotifying_Person类，这个类是Person的子类
2. 动态修改person对象的isa指针指向的类对象为NSKVONotifying_Person类,使得调用方法时调的是派生类的方法。
3. 派生类NSKVONotifying_Person重写setName方法，在这个方法调用父类的set方法，然后通知观察者调用-observeValueForKeyPath: ofObject: change: context:方法

[参考文章](https://www.jianshu.com/p/91c41292b5b9)

