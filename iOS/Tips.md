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

## iOS的消息传递机制
给对象发送消息，实则调用objc_msgSend函数，该函数会依据接受者与选择子的类型来调用适当的方法。为了完成此操作，该方法需要在接收者isa所指的Class中搜寻“方法列表”（list of methords），如果能找到与选择子名称相符的方法，就跳转至其实现代码。若是找不到，那就沿着继承体系继续向上查找，等找到合适的方法之后再跳转。如果最终还是找不到相符的方法，那就执行“消息转发”(message forwarding)操作。另外如果找到了该methord会在类中缓存该方法，方便下次快速查找。

## iOS的消息转发机制
消息转发分为两大阶段。
* 第一阶段：动态方法解析：先征询接收者，所属的类，看是否能动态添加方法，以处理当前这个“未知的选择子”(unknown selector)。这个过程是调用类方法: ``` + (BOOL)resolveInstanceMethod: (SEL)selector ``` （如果需要新增方法，就要在这个方法里面进行处理并返回YES）
* 第二阶段：第一阶段执行完后，接收者自己就无法再以动态新增方法的手段来响应包含该选择子的消息了。这时，运行期系统会请求接收者以其他手段来处理消息相关的方法调用。分为两小步：
    1. 寻找备援接收者。调用```- (id)forwardingTargetForSelector:(SEL)selector```，运行期系统会问它：能不能把这条消息转给其他接收者来处理。在一个对象内部，可能还有一系列其他对象，该对象可经由此方法将能够处理某选择子的相关内部对象返回，这样的话，在外界看来，好像是该对象亲自处理了这些消息似的。
    2. 完整的消息转发。到这一步，系统会调用``` - (void)forwardInvocation: (NSInvocation *)invocation ```,其中invocation对象携带了那条尚未处理的消息有关的全部细节。在这里将消息指派给目标对象，然而这样实现出来的方法与“备援接收者”方案所实现的方法等效，所以比较少用。
    
![消息转发全流程](https://upload-images.jianshu.io/upload_images/1280054-f0689d814beb2c0a.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

## Cocoapods
[具体文章](Article/Cocoapods.md)


## RunLoop
### RunLoop概念
   * 一般来讲，一个线程一次只能执行一个任务，执行完成后线程就会退出。如果我们需要一个机制，让线程能随时处理事件但并不退出，通常的代码逻辑是这样的：
   
    ```
    function loop() {
        initialize();
        do {
            var message = get_next_message();
            process_message(message);
        } while (message != quit);
    }
    ```
      这种模型通常叫做Event Loop。

* Runloop实际上是一个对象，这个对象管理了其需要处理的事件和消息，并提供了一个入口函数来执行Event Loop的逻辑。线程执行了这个函数后，就会一直处于这个函数内部“接收消息->等待->处理”的循环中，知道这个循环结束(比如传人quit的消息），函数返回。
* OSX/iOS系统中，提供了两个这样的对象：NSRunLoop和CFRunLoopRef。
     * CFRunLoopRef 是在 CoreFoundation 框架内的，它提供了纯 C 函数的 API，所有这些 API 都是线程安全的。
     * NSRunLoop 是基于 CFRunLoopRef 的封装，提供了面向对象的 API，但是这些 API 不是线程安全的。

### RunLoop与线程的关系
* CFRunLoop是基于线程对象pthread_t(NSTread是pthread_t的封装)管理的。
* 线程和 RunLoop 之间是一一对应的，其关系是保存在一个全局的 Dictionary 里。线程刚创建时并没有 RunLoop，如果你不主动获取，那它一直都不会有。RunLoop 的创建是发生在第一次获取时，RunLoop 的销毁是发生在线程结束时。你只能在一个线程的内部获取其 RunLoop（主线程除外）。

