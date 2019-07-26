### 工作原理相关概念
* <font color=red>代码库</font>：Git上的代码仓库，可以集成使用,例如Github上的Alamofire、AFNworking等。
* <font color=red>索引库</font>：能通过Pod安装的库都在里面，存放的是每个库的Podspec,例如[官方索引库](https://github.com/CocoaPods/Specs)。
* <font color=red>本地索引库</font>：在安装Pod时，会把官方索引库拉取到本地。通过``` pod repo ```查看索引库信息。
* <font color=red>Podspec</font>：库的描述文件，里面记录着库的描述，版本，地址，依赖库等信息。

### 工作流程
* 安装Cocoapods后，本地会拉取关方的索引库，生成本地索引表。
* 使用Pod install时，默认情况下，会去更新本地索引库，可以在后面添加``` --no-repo-update ```忽略更新。
* pod会根据```Podfile```文件查找索引列表，找到库所对应的Podspec文件，获取库的真实地址。
* 下载三方库到本地

[流程关系图](img/Tips_Cocoapods流程关系图.jpg)
