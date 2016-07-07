//
//  KPToModelCode.m
//  CreateModel
//
//  Created by kunpeng on 16/3/25.
//  Copyright © 2016年 zhiruiyun. All rights reserved.
//

#import "KPToModel.h"

@implementation KPToModel

+ (NSString *)toModelCodeString:(NSDictionary*)dictionary {
    
    NSMutableString *strCode = [NSMutableString string];
    for (NSString *strKey in dictionary.allKeys) {
        id value = dictionary[strKey];
        NSString *strFlag = @"strong";
        NSString *strType = @"NSObject *";
        if (value) {
            
            if ([value isKindOfClass:[NSDictionary class]]) {
                strType = @"NSDictionary *";
            }else if ([value isKindOfClass:[NSArray class]]) {
                strType = @"NSArray *";
            }else if ([value isKindOfClass:[NSString class]]) {
                strType = @"NSString *";
            }else {
                if ([value isKindOfClass:[NSNumber class]]) {
                    strFlag = @"assign";
                    NSNumber *number = value;
                    if (strcmp(number.objCType, @encode(int))) {
                        strType = @"NSInteger ";
                    }else{
                        if (strcmp(number.objCType, @encode(BOOL))) {
                            strType = @"BOOL ";
                        }else {
                            if (strcmp(number.objCType, @encode(float))) {
                                strType = @"float ";
                            }else {
                                if (strcmp(number.objCType, @encode(double))) {
                                    strType = @"double ";
                                }
                            }
                        }
                    }
                }
            }
        }
        [strCode appendFormat:@"@property (nonatomic,%@) %@%@; \n",strFlag,strType,strKey];
    }
    
    NSLog(@"_______________\n%@",strCode);
    return strCode;
}

@end
