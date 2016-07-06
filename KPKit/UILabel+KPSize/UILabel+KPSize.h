//
//  UILabel+KPSize.h
//  KPKit
//
//  Created by kunpeng on 16/7/6.
//  Copyright © 2016年 liukunpeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (KPSize)

/**
 *  指定显示行数
 *
 *  @param lines       指定行数
 *  @param text        文本
 *  @param lineSpacing 行间距
 *  @param limitWidth  指定宽度
 *
 *  @return Label的size
 */
- (CGSize)setLines:(NSInteger)lines
           andText:(NSString *)text
       LineSpacing:(CGFloat)lineSpacing
        limitWidth:(CGFloat)limitWidth;

/**
 *  只计算，不指定行数
 */
- (CGSize)boundingRectWithSize:(CGSize)size;

@end
