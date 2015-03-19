//
//  NSDate+ZSAdditions.m
//
//
//  Created by Stanislav Zhukovskiy on 23.01.15.
//  Copyright (c) 2015 Stas Zhukovskiy. All rights reserved.
//

#import "NSDate+ZSAdditions.h"

@implementation NSDate (ZSAdditions)

- (NSDate *)normalizedDate:(NSDate *)date {
    
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    [gregorian setTimeZone:[NSTimeZone localTimeZone]];
    
    unsigned unitFlags = NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear | NSCalendarUnitWeekday | kCFCalendarUnitWeekdayOrdinal;
    NSDateComponents *components = [[NSCalendar currentCalendar] components:unitFlags fromDate:date];
    
    NSDateComponents *normalized = [NSDateComponents new];
    [normalized setWeekday: [components weekday]];
    [normalized setWeekdayOrdinal:[components weekdayOrdinal]];
    [normalized setMonth:[components month]];
    [normalized setYear:[components year]];
    
    return [gregorian dateFromComponents:normalized];
}

- (NSDate *)toLocalTime:(NSDate *)someDate {
    NSTimeZone *timeZone    = [NSTimeZone defaultTimeZone];
    NSInteger seconds       = [timeZone secondsFromGMTForDate:someDate];
    return [NSDate dateWithTimeInterval:seconds sinceDate:someDate];
}

- (NSDate *)toGlobalTime:(NSDate *)someDate {
    NSTimeZone *timeZone    = [NSTimeZone defaultTimeZone];
    NSInteger seconds       = -[timeZone secondsFromGMTForDate:someDate];
    return [NSDate dateWithTimeInterval:seconds sinceDate:someDate];
}

@end
