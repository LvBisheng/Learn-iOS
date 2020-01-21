# iOS/Resoure

|序号|文章|知识点|学习时间|备注|
|:--:|:--:|:--|:--:|:--|
|50|[iOS开发技巧 - 崩溃分析](https://www.jianshu.com/p/77660e626874)||2020-01-20|
|49|[iOS App的几种安全防范](https://www.jianshu.com/p/0cfb5859f15f)||2020-01-19|
|48|[React-Native简介与运行原理解析（Eg：ios）](https://www.jianshu.com/p/82a28c8b673b?utm_campaign=hugo&utm_medium=reader_share&utm_content=note&utm_source=weixin-friends)|React Native|2020-01-20|
|47|[【React Native】从源码一步一步解析它的实现原理](https://www.jianshu.com/p/5cc61ec04b39)|React Native|2020-01-10|
|46|[Cocoapods 工作原理和源码分析](https://www.jianshu.com/p/c17cee5e9c7f)||2020-01-08|
|45|[iOS刨根问底-深入理解RunLoop](https://www.cnblogs.com/kenshincui/p/6823841.html)||2019-11-26||
|44|[Woodpecker使用](http://www.woodpeck.cn/cnusage.html)|iOS 开发者开发调试 App 的 Mac 应用|2019-11-13||
|43|[iOS OC内联函数 inline](https://www.jianshu.com/p/d557b0831c6a)|inline内联函数。1.代替宏，避免了宏的缺点：需要预编译，因为inline内联函数也是函数,不需要预编译。2.解决函数调用效率的问题。函数之间调用，是内存地址之间的调用。inline函数避免了普通函数,在汇编时必须调用call的缺点:取消了函数的参数压栈，减少了调用的开销,提高效率.所以执行速度确比一般函数的执行速度要快。3.内联函数只是我们向编译器提供的申请,编译器不一定采取inline形式调用函数，例如函数体过大时的函数。|2019-11-01||
|42|[深入理解 Tagged Pointer](https://www.infoq.cn/article/deep-understanding-of-tagged-pointer/)|Tagged Pointer给 64 位系统带来了内存的节省和运行效率的提高,专门用来存储小的对象，例如NSNumber和NSDate。Tagged Pointer指针的值不再是地址了，而是真正的值。|2019-11-01||
|41|[NSLayoutAnchor详解](https://www.jianshu.com/p/b94b28a8a642)|NSLayoutConstraint、NSLayoutAnchor、NSLayoutAttribute、UILayoutGuide、UILayoutSupport|2019-10-26||
|40|[iOS开发-LayoutGuide的前世今生（从top/bottom LayoutGuide到Safe Area）](https://www.jianshu.com/p/f2cb5f8e747f)|1. iOS7: topLayoutGuide/bottomLayoutGuide其实就是作为虚拟的占坑`view`，用于自动布局的时候帮助开发者避开顶部的状态栏，导航栏以及底部的tabbar等。 2. iOS9: 有了虚拟view的思路，又考虑能不能去除top/bottom概念的局限性，让开发者都可以灵活自定义这个隔离区域，又提供一些更方便简易易懂的API方便进行代码自动布局，于是有了UILayoutGuide这个类。 3. iOS11: 自定义了一个UILayoutGuide，给开发者提供了一个只读属性的safeAreaLayoutGuide，并且提出安全区域的概念。Safe Area，苹果建议在这个安全域内放置UI控件。这个安全域的范围将整个屏幕隔离出状态栏，导航栏，tabbaar，以及iPhoneX顶部刘海，底部虚拟home手势区域的范围。也就是升级版的topLayoutGuide/bottomLayoutGuide。|2019-10-25||
|39|[Xcode 11 初体验](https://juejin.im/post/5d8b0b6951882502c5533e9b?utm_source=gold_browser_extension)||2019-09-30||
|38|[使用Xcode10调试iOS13设备](https://juejin.im/post/5d50176ef265da03ab423f80)|Device Support File里面粘贴对应的文件夹及其内容(13.0)|2019-09-20||
|37|[一行代码解决！iOS二进制重排启动优化](https://new.qq.com/rain/a/20190903A0OKY400)|缺页中断(page fault):当进程访问一个虚拟内存page而对应的物理内存却不存在时，会触发一次缺页中断，加载对应的物理页，建立起虚拟内存和物理内存的映射关系。频繁的page fault会增加指令执行的耗时，增大disk thrashing的风险，从而导致指令的执行时间慢，最终影响启动速度。二进制重排，就是解决这两个问题，将所有启动期间先后执行的函数代码，紧凑的排列在顺序的二进制中，使得pc寄存器的指令跳转幅度大幅降低。让单个物理页能尽可能的加载更多的当前或下一条待执行的函数|2019-09-18||
|36|[抖音研发实践：基于二进制文件重排的解决方案 APP启动速度提升超15%](https://mp.weixin.qq.com/s/Drmmx5JtjG3UtTFksL6Q8Q)||2019-09-18||
|35|[理解Mach-O文件格式(1)](https://www.jianshu.com/p/d43a8279a1c2)|Apple家的系统只支持三种给予可执行权限的格式：1.以``` #! ```开头的脚本文件 2.通用二进制文件 3.Mach-O格式文件。通用二进制文件fat binary其实是多个架构的Mach-O文件的打包体,通过```Magic Number```魔数来区分。Mach-O文件的结构分为Header(有文件类型、目标架构等数据)、Load commands(描述文件在虚拟内存中的逻辑结构、布局)、Raw segment data(在Load commands中定义的Segment的原始数据)|2019-09-18||
|34|[iOS 中的 armv7,armv7s,arm64,i386,x86_64 都是什么](https://www.jianshu.com/p/3fce0bd6f045)|iOS开发中的处理器指令集|2019-08-22||
|33|[iOS - 淡入淡出切换rootViewController](https://www.jianshu.com/p/667467b6b76f)||2019-08-19||
|32|[iOS开发之设备唯一标识UDID、OpenUDID、UUID、IMEI\IMSI、IDFA、IDFV](https://blog.csdn.net/jackjia2015/article/details/84325240)|设备标识 |2019-08-13|
|31|[Xcode中other linker flags的作用](https://blog.csdn.net/iosfengguibin/article/details/52086435)||2019-08-09|
|30|[iOS 多线程：『GCD』详尽总结](https://www.jianshu.com/p/2d57c72016c6)|GCD|2019-07-29|
|29|[CocoaPods 私有仓库的创建（超详细）](https://www.jianshu.com/p/0c640821b36f)|CocoaPods|2019-07-26|
|28|[Git & CocoaPods & 私有化，你不得不知的组件化基础！](https://blog.51cto.com/13533483/2057387)|CocoaPods|2019-07-26|
|27|[CocoaPods 公有仓库的创建（超详细）](https://www.jianshu.com/p/d2d98298b1b8)|CocoaPods|2019-07-26|
|26|[iOS黑魔法Method Swizzling](https://www.jianshu.com/p/05e82fbe7132)|Method Swizzling|2019-07-18|
|25|[iOS 消息发送与转发详解](https://juejin.im/post/5aa79411f265da237a4cb045)|消息发送、消息转发|2019-07-16|
|24|[Xcode工程文件project.pbxproj小结](https://www.jianshu.com/p/e82ec6a56fc2)||2019-07-05|
|23|[iOS 渠道追踪原理与实现](https://www.sensorsdata.cn/blog/analyze-distribution-channel-of-ios-app/)||2019-07-01|
|22|[iOS一个workspace多个project和一个project多个target,并引入cocoapods](https://www.jianshu.com/p/e6408f997c1f)||2019-05-29|
|21|[RxSwift中文文档（非官方）](https://beeth0ven.github.io/RxSwift-Chinese-Documentation/)|||
|20|[RxSwift 使用详解系列](https://www.jianshu.com/p/f61a5a988590)|||
|19|[字符编码的概念（UTF-8、UTF-16、UTF-32都是什么鬼](https://blog.csdn.net/guxiaonuan/article/details/78678043)|字符集、字符编码|2019-05-24||
|18|[UNICODE,GBK,UTF-8区别](https://www.cnblogs.com/gavin-num1/p/5170247.html)||2019-05-24|
|17|[iOS编译与app启动](https://www.jianshu.com/p/65901441903e)||2019-05-23|
|16|[iOS编译过程的原理和应用](https://www.jianshu.com/p/09bd9b468e17)||2019-05-23||
|15|[Cocoapods原理总结](https://juejin.im/entry/59dd94b06fb9a0451463030b)||2019-05-22||
|14|[iOS10推送必看UNNotificationContentExtension](https://www.jianshu.com/p/45933f5450a4)|自定义推送的view|2019-05-16|
|13|[iOS10推送必看UNNotificationAttachment以及UNTimeIntervalNotificationTrigger](https://www.jianshu.com/p/3d602a60ca4f)||2019-05-16|
|12|[iOS开发 iOS10推送必看(基础篇)](https://www.jianshu.com/p/f5337e8f336d)|推送|2019-05-16|
|11|[iOS10推送必看UNNotificationServiceExtension](https://www.jianshu.com/p/f77d070a8812)|推送、UNNotificationServiceExtension|2019-05-16|
|10|[iOS Provisioning Profile(Certificate)与Code Signing详解](https://blog.csdn.net/phunxm/article/details/42685597)||2019-05-15|
|9|[图解公钥与私钥](https://blog.csdn.net/linuxnews/article/details/51119862)|公钥、私钥|2019-05-15||
|8|[iOS如何为NSMutableArray添加KVO](http://liumh.com/2015/08/22/ios-nsmutablearray-kvo/)|KVO、NSMutableArray|2019-05-15||
|7|[iOS 关于MVVM With ReactiveCocoa设计模式的那些事](https://www.jianshu.com/p/a0c22492a620)|MVVM、ReactvieCocoa|2019-05-15|
|6|[iOS 关于MVVM Without ReactiveCocoa设计模式的那些事](https://www.jianshu.com/p/db8400e1d40e)|MVC、MVVM|2019-05-14||
|5|[iOS 关于MVC和MVVM设计模式的那些事](https://www.jianshu.com/p/caaa173071f3)|MVC、MVVM|2019-05-14|
|4|[最快让你上手ReactiveCocoa之进阶篇](https://www.jianshu.com/p/e10e5ca413b7)|ReactvieCocoa|2019-05-14|
|3|[最快让你上手ReactiveCocoa之基础篇](https://www.jianshu.com/p/87ef6720a096)|ReactvieCocoa|2019-05-14|
|2|[iObjective-C isa 指针 与 runtime 机制](https://www.jianshu.com/p/41735c66dccb)|isa、runtime|2019-05-11||
|1|[解剖iOS中KVO的原理](https://www.jianshu.com/p/91c41292b5b9)|KVO|2019-05-11||



