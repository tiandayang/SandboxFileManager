# SandboxFileManager
有时候需要查看本地文件，每次通过xcode导出安装包是不是特别麻烦呢，这个工具帮你解决这个顾虑
## 使用方式
```
pod 'SandboxFileManager', '~> 1.1.0'
```
或者直接拖动项目中的source到工程中
## 示例代码
```objectivec
 let VC = WXXFileListViewController()
        let nav = UINavigationController.init(rootViewController: VC)
        nav.navigationBar.isTranslucent = false
        self.present(nav, animated: true, completion: nil)
```
![Image text](https://github.com/a254711559/SandboxFileManager/blob/master/ExampleImage/IMG_0902.PNG);

![Image text](https://github.com/a254711559/SandboxFileManager/blob/master/ExampleImage/IMG_0903.PNG);

![Image text](https://github.com/a254711559/SandboxFileManager/blob/master/ExampleImage/IMG_0904.PNG);

## Tip
项目依赖的唯一布局框架是 snapkit哦~~
