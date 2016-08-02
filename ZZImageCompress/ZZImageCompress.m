//
//  ZZImageCompress.m
//  ZZImageCompress
//
//  Created by 刘威振 on 8/2/16.
//  Copyright © 2016 刘威振. All rights reserved.
//

#import "ZZImageCompress.h"

@implementation ZZImageCompress

+ (void)compressImage:(UIImage *)image maxKB:(NSUInteger)maxKB finishHandler:(void (^)(UIImage *image, NSData *imageData))finishHandler {
    if (!image) {
        return;
    }
    NSData *imageData = UIImagePNGRepresentation(image);
    CGSize imageSize = image.size; // In iOS 4.0 and later, this is measured in points. In 3.x and earlier, measured in pixels
    CGFloat maxBytes = maxKB * 1024;
    if (imageData.length <= maxBytes) {
        finishHandler(image, imageData);
        return;
    }
    dispatch_async(dispatch_queue_create("CompressImage", DISPATCH_QUEUE_SERIAL), ^{
        CGFloat area = imageSize.width * imageSize.height * (maxBytes / imageData.length);
        CGFloat scale = imageSize.width / imageSize.height;
        CGSize size = CGSizeZero;
        size.height = sqrtf(area / scale);
        size.width  = scale * size.height;
        UIGraphicsBeginImageContext(size);
        [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
        UIImage *compressImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        // http://stackoverflow.com/questions/17475392/when-should-i-use-uiimagejpegrepresentation-and-uiimagepngrepresentation-for-upl
        // NSData *compressData = UIImageJPEGRepresentation(compressImage, 1.0);
        NSData *compressData = UIImagePNGRepresentation(compressImage);
        if (compressData.length > maxBytes) {
            compressData = UIImageJPEGRepresentation(compressImage, 1);
        }
        
        NSLog(@"图片已压缩成%fKB", compressData.length/1024.0);
        dispatch_sync(dispatch_get_main_queue(), ^{
            finishHandler(compressImage, compressData);
        });
    });
}

@end
