//
//  DRPageBtn.m
//  Drex
//
//  Created by kunpeng on 16/1/29.
//  Copyright © 2016年 liukunpeng. All rights reserved.
//

#import "KPButton.h"
#import "UILabel+KPSize.h"
#import "UIView+KPExtension.h"

@implementation KPButton

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
    
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.imageView.y            = self.width * 0.16;
    self.imageView.x            = (self.width - self.width * 0.55)/2;
    self.imageView.height       = self.width * 0.55;
    self.imageView.width        = self.imageView.height;
    self.imageView.contentMode  = UIViewContentModeScaleAspectFit;
    
    CGSize size                 = [self.titleLabel boundingRectWithSize:CGSizeMake(0, 0)];
    self.titleLabel.x           = (self.width - size.width)/2;
    self.titleLabel.y           = self.height - (size.height + self.width * 0.035);
    self.titleLabel.width       = size.width;
    self.titleLabel.height      = size.height;
    self.titleLabel.textColor   = [UIColor colorWithRed:120/255.0 green:120/255.0 blue:120/255.0 alpha:1];
}
@end