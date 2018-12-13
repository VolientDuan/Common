//
//  VDDateFormatTool.m
//  Common
//
//  Created by volientDuan on 2018/12/12.
//  Copyright © 2018 volientDuan. All rights reserved.
//

#import "VDDateFormatTool.h"

@implementation VDDateFormatTool

+ (NSTimeInterval)getTimerInterval:(NSTimeInterval)timeInterval{
    if (timeInterval > 1000000000000) {
        return timeInterval/1000;
    }
    return timeInterval;
}
+ (NSTimeInterval)getNowTimeInterval{
    return [[NSDate date]timeIntervalSince1970];
}

+ (NSString *)formatTimeInterval:(NSTimeInterval)timeInterval format:(NSString *)formatStr{
    if (time < 0)
    {
        return @"";
    }
    NSDateFormatter *formatter;
    formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:formatStr];
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:[self getTimerInterval:timeInterval]];
    return [formatter stringFromDate:date];
}
+ (NSString *)formatDate:(NSDate *)date format:(NSString *)formatStr{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:formatStr];
    return [formatter stringFromDate:date];
}

+ (NSDate *)dateFromTimeTinterval:(NSTimeInterval)timeInterval {
    return [NSDate dateWithTimeIntervalSince1970:[self getTimerInterval:timeInterval]];
}
+ (NSDate *)dateFromStr:(NSString *)dateStr format:(NSString *)formatStr {
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = formatStr;
    return [fmt dateFromString:dateStr];
}

+ (NSTimeInterval)timeIntervalFromDate:(NSDate *)date {
    return [date timeIntervalSince1970];
}
+ (NSTimeInterval)timeIntervalFromStr:(NSString *)dateStr format:(NSString *)formatStr {
    return [self timeIntervalFromDate:[self dateFromStr:dateStr format:formatStr]];
}


+ (NSInteger)getSecCountdownFrom:(NSTimeInterval)from to:(NSTimeInterval)to{
    NSTimeInterval toTime = [self getTimerInterval:to];
    NSTimeInterval fromTime = [self getTimerInterval:from];
    return toTime - fromTime;
}

+ (NSString *)today:(NSString *)format{
    return [self formatTimeInterval:[self getNowTimeInterval] format:format];
}
+ (NSString *)yesterday:(NSString *)format{
    return [self formatTimeInterval:([self getNowTimeInterval]-24*60*60) format:format];
}

@end
