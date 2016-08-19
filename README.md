# ZZImageCompress
图片压缩


使用方法：

```
[ZZImageCompress compressImage:[UIImage imageNamed:@"1.jpg"] maxKB:100 finishHandler:^(UIImage *image, NSData *imageData) {
	// ...        
}];
```