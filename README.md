# LCStatusBarHUD
一个非常简单易用的指示器小框架
## 显示成功信息
```objc
[LCStatusBarHUD showSuccessWithStatus:@"加载成功"];
```

## 显示失败信息
```objc
[LCStatusBarHUD showErrorWithStatus:@"加载失败"];
```

## 显示加载信息
```objc
[LCStatusBarHUD showLoading:@"正在加载"];
```

## 显示普通信息
```objc
[LCStatusBarHUD showMessage:@"只是普通文字,没有图片"];
```

## 隐藏
```objc
[LCStatusBarHUD hide];
```
