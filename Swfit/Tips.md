# Swift/Tips
## Swift中有运行时吗?
runtime简称运行时，OC就是运行时机制：编译的时候不能决定真正调用哪个函数，只有在运行时才根据函数的名称找到对应的函数来调用。而纯Swift类的话已经不是OC的运行时发消息的机制了，跟C类似，在编译阶段就确定了调用哪一个函数了，所以我们没有办法通过运行时去获取到它的属性和方法。
Swift对于继承自OC的类，为了兼容OC，都是保留了它的特性，包括runtime的时候获取属性和方法。至于纯Swift类的话可以给属性和方法添加dynamic关键字来使用runtime特性。
[参考文章](https://www.cnblogs.com/taoxu/p/7975984.html)
## 访问级别中open和public有什么区别？
open和public访问，都是允许实体被定义模块中的任意源文件访问，同样可以被另一模块的源文件通过导入该定义模块来访问。在指定框架的公共接口时，通常使用 open 或 public 访问。
open 访问仅适用于类和类成员，它与 public 访问区别如下：
* public 访问，或任何更严格的访问级别的类，只能在其定义模块中被继承。
* public 访问，或任何更严格访问级别的类成员，只能被其定义模块的子类重写。
* open 类可以在其定义模块中被继承，也可在任何导入定义模块的其他模块中被继承。
* open 类成员可以被其定义模块的子类重写，也可以被导入其定义模块的任何模块重写。

[参考文章](https://www.cnswift.org/access-control)
## 对元类型的理解
* 元类型就是类型的类型，语法形式为： 类型.Type 或者 类型.Protocol。例如Int.Type就是Int的元类型，两者的关系如同Int与5的关系。.Type是元类型，类型.self是元类型.Type的值。
```
let intMetatype: Int.Type = Int.self
```
* AnyClass 其实也是一个元类型，可以从其定义得知,AnyClass就是任意类型元类型的别名
```
public typealias AnyClass = AnyObject.Type
```
* type(of:)和.self都可以获得元类型的值，区别在于.self取到的是静态的元类型，声明的时候是什么类型就是什么类型。type(of:)取的是运行时候的类型，也就是这个实例的类型。

## Swift和Objective-C中nil的区别
Swift 的 nil 和 Objective-C 中的 nil 并不一样。在 Objective-C 中，nil 是一个指向不存在对象的指针。在 Swift 中，nil 不是指针——它是一个确定的值，用来表示值缺失。任何类型的可选状态都可以被设置为 nil，不只是对象类型。

