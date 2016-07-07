//
//  KPToModelCode.h
//  CreateModel
//
//  Created by kunpeng on 16/3/25.
//  Copyright © 2016年 zhiruiyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KPToModel : NSObject

/**
 *  快速创建Model字段
 *
 *  @param dictionary 源数据
 *
 *  @return 字段的属性定义
 */
+ (NSString *)toModelCodeString:(NSDictionary*)dictionary;

@end
