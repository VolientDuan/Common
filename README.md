# Common
## iOS开发公共类

> 基本上每个项目都拥有公共类的分组来提供便捷工具

### 如何导入
* 手动下载VDCommon目录下所有文件导入项目
* CocoaPods
```
pod 'VDCommon', '~> 1.0.9'
```

### 目录结构
```
-- VDCommon
    ---Helper
        ---- VDNotiHelper // 通知绑定和回调帮助类
    ---Tool
        ---- VDDateFormatTool //时间格式化工具
        ---- VDFileTool // 文件管理工具
        ---- VDJumpTool // 跳转管理
        ......
    ---Category
        ---- NSString  // 字符串扩展工具
        ---- UIView // 常见试图扩展工具
        ---- UIImage // 图片处理工具
        ....
    ......
```

### 优化和填充中...


