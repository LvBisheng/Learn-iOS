## 沙盒目录结构

## 概况
**AppName.app**: 包含APP及其所有资源。不可写。不被iTunes备份。
**Documents/**: 包含用户生成的数据。可读写。会被iTunes备份。
**Documents/Inbox**: 可被外部程序访问的文件。APP可读、可删除，但不能创建和修改。会被iTunes备份。
**Library/**: 所有非用户数据文件的根目录。会被iTunes备份。
**tmp/**:存储临时数据。你的APP应当在不需要的时候，清除这些零时数据。系统也可能在你的APP没有运行的时候，清除这些零时数据。不被iTunes备份。

## 存储指南
1. 将用户数据保存在Documents目录下。
2. 将APP创建的支持文件保存在Library目录的下Application support子目录下。
3. Documents目录和.Application support目录默认都会被备份。但可以调用-[NSURL setResourceValue:forKey:error:] 方法，指定 NSURLIsExcludedFromBackupKey关键字来排除体积过大的文件，如媒体文件。
4. 将临时数据存储在 tmp/目录下.
5. 将缓存数据存放在Library/Caches/目录下。

## [参考官方文档](https://developer.apple.com/library/archive/documentation/FileManagement/Conceptual/FileSystemProgrammingGuide/FileSystemOverview/FileSystemOverview.html)


