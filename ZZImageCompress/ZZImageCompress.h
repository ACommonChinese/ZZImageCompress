//
//  ZZImageCompress.h
//  ZZImageCompress
//
//  Created by 刘威振 on 8/2/16.
//  Copyright © 2016 刘威振. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ZZImageCompress : NSObject

+ (void)compressImage:(UIImage *)image maxKB:(NSUInteger)maxKB finishHandler:(void (^)(UIImage *image, NSData *imageData))finishHandler;

@end
