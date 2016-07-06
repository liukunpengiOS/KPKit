//
//  DateToTime.h
//  Drex
//
//  Created by kunpeng on 16/4/7.
//  Copyright © 2016年 liukunpeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KPTimeState : NSObject

/**
 *  根据提供的日期进行比较输出状态字样（‘刚刚’，‘几小时前’等）
 *
 *  @param compareDate 提供的日期
 */
+ (NSString *)timeStateForCurrentDateDistanceToProvideDate:(NSDate*)provideDate;

@end
