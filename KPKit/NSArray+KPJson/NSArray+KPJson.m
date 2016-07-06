//
//  NSArray+KPJson.m
//  Demo
//
//  Created by kunpeng on 16/7/6.
//  Copyright © 2016年 liukunpeng. All rights reserved.
//

#import "NSArray+KPJson.h"

@implementation NSArray (KPJson)

- (NSString *)toJSONString {
    
    NSData *data = [NSJSONSerialization dataWithJSONObject:self
                                                   options:NSJSONReadingMutableLeaves|
                                                           NSJSONReadingAllowFragments
                                                     error:nil];
    if (data == nil) {
        return nil;
    }
    NSString *string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return string;
}

@end
