//
//  UILabel+KPSize.m
//  KPKit
//
//  Created by kunpeng on 16/7/6.
//  Copyright © 2016年 liukunpeng. All rights reserved.
//

#import "UILabel+KPSize.h"
#import <CoreText/CoreText.h>

@implementation UILabel (KPSize)

- (CGSize)setLines:(NSInteger)lines andText:(NSString *)text
       LineSpacing:(CGFloat)lineSpacing limitWidth:(CGFloat)limitWidth{
    
    self.numberOfLines = lines;
    
    CGFloat offset = -(1.0/3 * lineSpacing) - 1.0/3;
    
    CGFloat oneRowHeight = [text sizeWithAttributes:@{NSFontAttributeName:self.font}].height;
    CGSize textSize = [text boundingRectWithSize:CGSizeMake(limitWidth, MAXFLOAT)
                                         options:NSStringDrawingUsesLineFragmentOrigin
                                      attributes:@{NSFontAttributeName:self.font}
                                         context:nil].size;
    
    CGFloat rows = textSize.height / oneRowHeight;
    offset = textSize.height > oneRowHeight ? 0 : offset;
    if (lines != 0) {
        if (rows >= lines) {
            rows = lines;
        }
    }
    CGFloat realHeight = (rows * oneRowHeight) + (rows - 1) * lineSpacing;
    
    //行间距
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = lineSpacing;
    NSRange range = NSMakeRange(0, [text length]);
    
    //字间距
    long number = 0.3;
    CFNumberRef num = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt8Type, &number);
    [attributedString addAttribute:(id)kCTKernAttributeName value:(__bridge id)num range:range];
    CFRelease(num);
    
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:range];
    //设置文本偏移量
    //[attributedString addAttribute:NSBaselineOffsetAttributeName value:@(offset) range:range];
    [self setAttributedText:attributedString];
    return CGSizeMake(textSize.width, realHeight);
}

- (CGSize)boundingRectWithSize:(CGSize)size {
    
    NSDictionary *attribute = @{NSFontAttributeName:self.font};
    CGSize resultSize = [self.text boundingRectWithSize:size
                                                options:NSStringDrawingTruncatesLastVisibleLine|
                                                        NSStringDrawingUsesLineFragmentOrigin|
                                                        NSStringDrawingUsesFontLeading
                                             attributes:attribute
                                                context:nil].size;
    return CGSizeMake(resultSize.width + 1, resultSize.height);
}

@end
