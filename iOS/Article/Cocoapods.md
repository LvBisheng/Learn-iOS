## 什么是CocoaPods
CocoaPods是Swift和Objective-C Cocoa项目的依赖管理器，是用Ruby语言构建的。

## CocoaPods安装过程
1. Ruby环境安装。如果Ruby版本过低，CocoaPods会安装失败
    * maxOS系统默认已安装Ruby环境。查看ruby版本：``` ruby -v ```。
    * 手动安装Ruby环境。可利用homebrew或者RVM工具
2. 更换源(Gem 是一个管理Ruby库和程序的标准包)
    ```
    gem update --system # 更新gem
    gem -v # 查看gem 版本
    gem sources -l # 查看安装的镜像源
    gem sources --remove https://rubygems.org/ # 移除原有的镜像源
    gem sources --add https/gems.ruby-china.com # 添加国内镜像源 
    
    ```
3. CocoaPods安装
    ```
    pod --verson #查看Pod版本
    sudo gem install cocoapods #安装CocoaPods方法一，若失败用方法二
    sudo gem install -n /usr/local/bin CocoaPods #安装方法二
    pod setup #安装Podspec索引到本地（耐心等待） 
         
    ```
    
    pod setup: 在本地建立一个CocoaPods的描述文件主仓库，然后建立远程库索引

## CocoaPods简单使用
1. 编辑创建的Podfile文件，添加或删除第三方库名，然后执行pod install命令。
    ```
    cd 项目路径
    pod init #创建默认的 Podfile（可跳过）
    vim Profile #编辑（没有会创建）Profile配置文件
    pod install #安装或删除第三方库
    pod install --no-repo-update #安装第三方库，不更新本地索引
    pod update #更新到最新版本或指定版本
    
    ```
2. Podfile文件模型
    ```
    source 'https://github.com/CocoaPods/Specs.git' 
    
    platform :ios, '9.0'
    target 'CashLoan_iOS' do
    use_frameworks
    end
    
    ```
    
## 工作原理相关概念
* <font color=red>代码库</font>：Git上的代码仓库，可以集成使用,例如Github上的Alamofire、AFNworking等。
* <font color=red>索引库(git仓库)</font>：能通过Pod安装的库都在里面，存放的是每个库的Podspec,例如[官方索引库](https://github.com/CocoaPods/Specs)。
* <font color=red>本地索引库</font>：在安装Pod时，会把官方索引库拉取到本地。通过``` pod repo ```查看索引库信息。
* <font color=red>Podspec</font>：库的描述文件，里面记录着库的描述，版本，地址，依赖库等信息。


## 工作流程
* 安装CocoaPods后，本地会拉取关方的索引库，生成本地索引表。
* 使用Pod install时，默认情况下，会去更新本地索引库，可以在后面添加``` --no-repo-update ```忽略更新。
* pod会根据```Podfile```文件查找索引列表，找到库所对应的Podspec文件，获取库的真实地址。
* 下载三方库到本地
![Image text](http://pv8mnetxz.bkt.clouddn.com/Tips_Cocoapods%E6%B5%81%E7%A8%8B%E5%85%B3%E7%B3%BB%E5%9B%BE.jpg)

## CocoaPods公有库的创建
1. 注册CocoaPods账号：``` pod trunk register [GitHub_email] [user_name] --verbose ```
    
    * 接着终端会出现文字:``` 
        [!]Please verify the session by cliking the link in the     verification email that has been sent to you_email@163.com       
         ```
    
    * CocoaPods会发一个确认邮件到邮箱，登陆邮箱确认
2. 确认后查看注册信息：``` pod trunk me ```
3. 创建GitHub代码仓库：
    * 项目中的文件、目录结构：
        * LICENSE：开源许可证
        * README.md：仓库文件
        * 你的代码（需要共享的代码目录）
        * xxx.podspec：CocoaPods的描述文件
        * 代码使用样例：不是必须的
        ![image text](http://pv8mnetxz.bkt.clouddn.com/%E5%88%9B%E5%BB%BA%E5%85%AC%E6%9C%89%E4%BB%93%E5%BA%93%E6%96%87%E4%BB%B6%E7%BB%93%E6%9E%84.png)
    * 创建.podspec: ``` pod spec create [文件名称] ```。 文件参考格式：
        ``` 
              Pod::Spec.new do |s|
              s.name         = "BYPhoneNumTF" # 项目名称
              s.version      = "1.0.0"        # 版本号 与 你仓库的 标签号 对应
              s.license      = "MIT"          # 开源证书
              s.summary      = "A delightful TextField of PhoneNumber" # 项目简介
            
              s.homepage     = "https://github.com/qiubaiying/BYPhoneNumTF" # 你的主页
              s.source       = { :git => "https://github.com/qiubaiying/BYPhoneNumTF.git", :tag => "#{s.version}" }#你的仓库地址，不能用SSH地址
              s.source_files = "BYPhoneNumTF/*.{h,m}" # 你代码的位置， BYPhoneNumTF/*.{h,m} 表示 BYPhoneNumTF 文件夹下所有的.h和.m文件
              s.requires_arc = true # 是否启用ARC
              s.platform     = :ios, "7.0" #平台及支持的最低版本
              s.frameworks   = "UIKit", "Foundation" #支持的框架
              # s.dependency   = "AFNetworking" # 依赖库
              
              # User
              s.author             = { "BY" => "qiubaiyingios@163.com" } # 作者信息
              s.social_media_url   = "http://qiubaiying.github.io" # 个人主页
            
        end
        ```
1. 验证```.podspec```文件格式是否正确: ``` pod lib lint ``` (如果需要忽略警告就用命令:``` pod lib lint --allow-warnings ```)
2. 将仓库代码提交到远程，打上tag也推送到远程。``` 注意标签号与你在.podspec文件的s.version版本号保持一致 ```。

    ```
    创建标签
    git tag -a 1.0.0 -m "标签说明"
    推送到远程
    git push origin --tags
    ```
6. 发布``` .podspec ```： 仓库目录下执行``` pod trunk push xxx.podspec ```。
    其中包含了一些列操作：
    * 更新本地pods库 ``` ~/.cocoapods.repo/master ``` 
    * 验证``` .podspe ```格式是否正确
    * 将``` .podspec ```文件转为JSON格式
    * 对``` master ```仓库进行合并、提交[master仓库地址](https://github.com/CocoaPods/Specs)

## CocoaPods的公有库维护
1. 更新github代码库的代码推送远程
2. 更新```xxx.podspec```中的版本号
3. 打上标签推送远程
4. ``` pod trunk push xxxx.podspec ```推送到pods仓库

## CocoaPods私有库创建（大部分和CocoPods公有库的创建相似）
1. 创建私有版本库。创建一个像[master](https://github.com/CocoaPods/Specs)一样存放版本描述文件的git仓库
2. 将远程的私有版本仓库添加到本地(在Finder目录``` ~/.cocopods/repos ```)，``` repo ```就是repository储存库的缩写。
    ```
    pod repo add LBSRepo https://git.oschina.net/lvbisheng/LBSRepo.git
    ```
3. 创建私人代码库，创建时添加```MIT License```和```README```。
4. 将仓库克隆到本地，添加你的代码文件、仓库名.podspec、LICENSE：开源许可证、README.md、你的代码（需要共享的代码目录）、代码使用样例：不是必须的
5. 验证仓库配置：``` pod lib lint ```
    用oschina创建私人仓库，在验证时可能会找不到MIT LICENSE证书，需要修改一些配置文件
    ```
    
    s.license = "MIT"
    修改为,指定文件
    s.license = { :type => "MIT", :file => "LICENSE"}
    
    ```
1. 将项目打上标签推到远程仓库
2. 将描述文件推送到版本库：``` pod repo push  LBSRepo MyAdditons.podspec``` 
    此过程：
    1. 验证MyAdditions.podspec文件
    2. 拉取远程版本库LBSRepo
    3. 添加MyAddions.podspex到版本库中
    4. push到仓库
3. 使用私有库：需要在``` Podfile ```中添加这句话：
    
    ```
        source 'https://git.oschina.net/lvbisheng/LBSRepo.git'
     
    ```

## 相关命令
* 查看本地Pod索引库：``` pod repo list ```
* mac显示隐藏文件：``` defaults write com.apple.finder AppleShowAllFiles YES ```
