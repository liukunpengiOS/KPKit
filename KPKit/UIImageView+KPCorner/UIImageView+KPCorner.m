//
//  UIImageView+KPCorner.m
//  Demo
//
//  Created by kunpeng on 16/7/6.
//  Copyright © 2016年 liukunpeng. All rights reserved.
//

#import "UIImageView+KPCorner.h"

@implementation UIImageView (KPCorner)

+ (UIImageView*)cornerImageView:(CGRect)frame {
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:frame];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:imageView.bounds
                                                   byRoundingCorners:UIRectCornerAllCorners
                                                         cornerRadii:imageView.bounds.size];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc]init];
    maskLayer.frame = imageView.bounds;
    maskLayer.path = maskPath.CGPath;
    imageView.layer.mask = maskLayer;
    return imageView;
}

@end
