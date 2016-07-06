//
//  DateToTime.m
//  Drex
//
//  Created by kunpeng on 16/4/7.
//  Copyright © 2016年 liukunpeng. All rights reserved.
//

#import "KPTimeState.h"

@implementation KPTimeState

+ (NSString *)timeStateForCurrentDateDistanceToProvideDate:(NSDate*)provideDate {
    //计算相差的秒数
    NSTimeInterval timeInterval = [provideDate timeIntervalSinceNow];
    timeInterval = -timeInterval;
    long temp = 0;
    NSString *result;
    if (timeInterval < 60) {
        
        result = [NSString stringWithFormat:@"刚刚"];
    }else if((temp = timeInterval/60) < 60){
        
        result = [NSString stringWithFormat:@"%ld分前",temp];
    }else if((temp = temp/60) < 24){
        
        result = [NSString stringWithFormat:@"%ld小前",temp];
    }else if((temp = temp/24) < 30){
        
        result = [NSString stringWithFormat:@"%ld天前",temp];
    }else if((temp = temp/30) < 12){
        
        result = [NSString stringWithFormat:@"%ld月前",temp];
    }else{
        
        temp = temp/12;
        result = [NSString stringWithFormat:@"%ld年前",temp];
    }
    return  result;
}
@end
