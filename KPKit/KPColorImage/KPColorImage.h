//
//  DRColorImage.h
//  Drex
//
//  Created by kunpeng on 16/3/9.
//  Copyright © 2016年 liukunpeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface KPColorImage : NSObject

/**
 *  根据传入的颜色值绘制图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

@end
