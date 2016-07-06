//
//  UIImage+KPTint.m
//  Demo
//
//  Created by kunpeng on 16/7/6.
//  Copyright © 2016年 liukunpeng. All rights reserved.
//

#import "UIImage+KPTint.h"

@implementation UIImage (KPTint)

- (UIImage*)imageWithTintColor:(UIColor *)tintColor {
    
    return  [self imageWithTintColor:tintColor
                           blendMode:kCGBlendModeDestinationIn];
}

- (UIImage*)imageWithGradientTintColor:(UIColor *)tintColor{
    
    return [self imageWithTintColor:tintColor
                          blendMode:kCGBlendModeOverlay];
}

- (UIImage*)imageWithTintColor:(UIColor*)tintColor
                     blendMode:(CGBlendMode)blendMode{
    
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0f);
    [tintColor setFill];
    CGRect bounds = CGRectMake(0, 0, self.size.width, self.size.height);
    UIRectFill(bounds);
    
    [self drawInRect:bounds blendMode:blendMode alpha:1.0f];
    if (blendMode != kCGBlendModeDestinationIn) {
        [self drawInRect:bounds blendMode:kCGBlendModeDestinationIn alpha:1.0f];
    }
    
    UIImage *tintedImage = UIGraphicsGetImageFromCurrentImageContext();
    return tintedImage;
}

@end
