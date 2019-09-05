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

## GCD多线程
GCD是纯C的API。两个核心概念：任务和队列。
* **任务**：就是执行操作的意思，换句话说就是你在线程中执行的那段代码。分为：**同步执行(sync)**和**异步执行(async)**。
    * **同步执行(sync)**:
        1. 同步添加任务到指定的队列中，在添加的任务执行结束之前，会一直等待，直到队列里面的任务完成之后再继续执行。
        2. 只能在当前线程中执行任务，不具备开启新线程的能力。
    * **异步执行(async)**
        3. 异步添加任务到指定的队列中，它不会做任何等待，可以继续执行任务。
        4. 可以在新的线程中执行任务，具备开启新线程的能力。
* **队列**: 这里的队列指执行任务的等待队列，即用来存放任务的队列。队列是一种特殊的线性表，采用 FIFO（先进先出）的原则，即新任务总是被插入到队列的末尾，而读取任务的时候总是从队列的头部开始读取。分为：**串行队列（Serial Dispatch Queue）**和**并发队列（Concurrent Dispatch Queue）**。
    1. 串行队列（Serial Dispatch Queue）: 每次只有一个任务被执行。让任务一个接着一个地执行。（只开启一个线程，一个任务执行完毕后，再执行下一个任务）
    2. 并发队列（Concurrent Dispatch Queue）: 可以让多个任务并发（同时）执行。（可以开启多个线程，并且同时执行任务）
        ```
        注意：并发队列的并发功能只有在异步（dispatch_async）函数下才有效
        ```
* 队列和任务的组合（主队列比较特殊）：
    
    |区别|并发队列|串行队列|主队列|
    |:--:|:--:|:--:|:--:|
    |同步(sync)|没有开启新线程，串行执行任务|没有开启新线程，串行执行任务|1.主线程调用：死锁卡住不执行 2.其他线程调用：没有开启新线程，串行执行任务|
    |异步(async)|有开启新线程，并发执行任务|有开启新线程(1条)，串行执行任务|没有开启新线程，串行执行任务|
[参考文章](https://www.jianshu.com/p/2d57c72016c6)

## GCD信号量: dispatch_semaphore
GCD中的信号量是指``` Dispatch Semaphore ```, 是持有计数的信号。
* ```dispatch_semaphore_create```: 创建一个Semaphore并初始化信号的总量
* ``` dispatch_semaphore_signal ```: 发送一个信号，让信号总量+1
* ``` dispatch_semaphore_wait ```: 可以使总信号量-1，减完后信号总量小于0时就会一直等待（阻塞所在线程），否则就可以正常执行。

#### 实际开发应用：
1. 保持线程同步，将异步执行任务转换为同步执行任务。
    ```
     NSLog(@"currentThread---%@",[NSThread currentThread]);      
     NSLog(@"semaphore---begin");
    
    dispatch_queue_t queue = 
    dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);     
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0); // 1. 当前计数总数为0
    
    __block int number = 0;
    dispatch_async(queue, ^{
        // 追加任务1
        [NSThread sleepForTimeInterval:2];              
        NSLog(@"1---%@",[NSThread currentThread]);      
        
        number = 100;
        
        dispatch_semaphore_signal(semaphore); // 3. 发送信号，计数总数为0，停止等待
    });
    
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER); // 2.执行到这里时计数总数为-1，进行等待
    NSLog(@"semaphore---end,number = %zd",number); // 4. 停止等待，执行到这里
    
    ```
2. 保证线程安全，为线程加锁。

#### iOS设备标识
![设备标识](https://mygithub.oss-cn-shenzhen.aliyuncs.com/img/WechatIMG230.jpeg
)
