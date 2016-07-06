//
//  DRColorImage.m
//  Drex
//
//  Created by kunpeng on 16/3/9.
//  Copyright © 2016年 liukunpeng. All rights reserved.
//

#import "KPColorImage.h"

@implementation KPColorImage

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {

    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    // 开启位图上下文
    UIGraphicsBeginImageContext(rect.size);
    // 获取位图上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 使用color演示填充上下文
    CGContextSetFillColorWithColor(context, [color CGColor]);
    // 渲染上下文
    CGContextFillRect(context, rect);
    // 从上下文中获取图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    // 结束上下文
    UIGraphicsEndImageContext();
    
    return image;
}

@end
