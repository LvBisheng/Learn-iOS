## ruby
* ruby是日本人发明的，是一种简单快捷的面向对象的脚本语言。
* ruby可运行于多种平台，如Windows、macOS和Unix的各种版本。
* 语言的主要特点是：
    * 完全面向对象。在ruby语言中，任何东西都是对象，包括其他语言中的基本数据类型，比如整数。
    * 变量没有类型。ruby的变量可以保存任何类型的数据。
    * 任何都有值。不管是数学或者逻辑表达式还是一个句子，都会有值。
    * ruby语言很优雅，可以做到不需要注释就可以读懂。

## rvm
* rvm 是一个命令行工具，可以提供一个便捷的多版本 Ruby 环境的管理和切换

## gems(RubyGems)和gem
* RubyGems简称gems,它允许您轻松下载，安装和使用系统上的ruby软件包。该软件包称为“gem”，其中包含打包的Ruby应用程序或库。
* 每个软件包gem都有一个名称，版本和平台。例如， Rake gem有一个0.8.7版本（从2009年5月起）。Rake的平台是ruby，这意味着它适用于ruby运行的任何平台。
* 每个gem都遵循相同的代码组织标准结构：
   
    ```
    % tree freewill
    freewill/
    ├── bin/
    │   └── freewill
    ├── lib/
    │   └── freewill.rb
    ├── test/
    │   └── test_freewill.rb
    ├── README
    ├── Rakefile
    └── freewill.gemspec
    ```
    * lib目录包含gem的代码
    * test或spec目录包含供开发者测试的框架
    * Rakefile。ruby程序会使用它来自动化测试，生成代码和执行其他任务。
    * bin目录中的是可执行文件，该文件将在PATH安装gem时加载到用户的文件中 。安装gem时，会自动生成。
    * gemspec，其中包含gem有关的信息，例如版本号、作者、联系邮件等
    
     ```
        % cat freewill.gemspec
        Gem::Specification.new do |s|
        s.name        = 'freewill'
        s.version     = '1.0.0'
        s.summary     = "Freewill!"
        s.description = "I will choose Freewill!"
        s.authors     = ["Nick Quaranto"]
        s.email       = 'nick@quaran.to'
        s.homepage    = 'http://example.com/freewill'
        s.files       = ["lib/freewill.rb", ...]
        end
     ```
 
## bundler
ruby项目依赖于一系列的ruby gems，而bundler是一个很好的管理ruby项目gems的工具。使用bundler可以为你的ruby project提供统一的构建环境。

## gemfile
gemfile是描述gem之间依赖的文件，这个文件定义了从哪个源找到这些gem,使用该gem的什么版本等。
```
source "https://rubygems.org"
gem "my_gem", ">= 0.0"
```

## 总结
* ruby是一个面向对象的脚本语言。
* rvm是不同ruby版本的管理和切换工具。
* gem是ruby写的软件包。
* rubygems是用来打包、下载、安装、使用gem软件包的工具。
* bundler是管理ruby项目一系列gem的工具，就像ios 包管理工具的cocopods一样。bundler会根据gemfile文件定义的约束去管理这些gem。


文章参考：
[rubygems官网](https://guides.rubygems.org/)
[bundler.io](https://bundler.io/)
