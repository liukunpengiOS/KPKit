//
//  uuidStringClass.m
//  TimeCapsuleCompleteEdition
//
//  Created by liukunpeng on 15-4-29.
//  Copyright (c) 2015年 hnchuangzhiyi. All rights reserved.
//

#import "KPUUIDString.h"

@implementation KPUUIDString

+ (NSString*)generateUUIDString {
	
    CFUUIDRef uuidRef = CFUUIDCreate(NULL);
    CFStringRef uuidStringRef = CFUUIDCreateString(NULL, uuidRef);
    CFRelease(uuidRef);
    NSString *uniqueId = (__bridge NSString *)uuidStringRef;
    return uniqueId;
}

@end
