//
//  UIImage+KPTint.h
//  Demo
//
//  Created by kunpeng on 16/7/6.
//  Copyright © 2016年 liukunpeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (KPTint)

- (UIImage*)imageWithTintColor:(UIColor*)tintColor;
- (UIImage*)imageWithGradientTintColor:(UIColor *)tintColor;
@end
