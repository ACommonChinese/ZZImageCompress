//
//  ViewController.m
//  ZZImageCompress
//
//  Created by 刘威振 on 8/2/16.
//  Copyright © 2016 刘威振. All rights reserved.
//

#import "ViewController.h"
#import "ZZImageCompress.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [ZZImageCompress compressImage:[UIImage imageNamed:@"1.jpg"] maxKB:100 finishHandler:^(UIImage *image, NSData *imageData) {
        self.view.backgroundColor = [UIColor colorWithPatternImage:image];
    }];
}

@end
