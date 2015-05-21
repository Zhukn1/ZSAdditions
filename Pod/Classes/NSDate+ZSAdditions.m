//
//  NSDate+ZSAdditions.m
//  ZSAdditions
//
//  Created by Stanislav Zhukovskiy on 23.01.15.
//  Copyright (c) 2015 Stas Zhukovskiy. All rights reserved.
//

#import "NSDate+ZSAdditions.h"

@implementation NSDate (ZSAdditions)

+ (NSDate *)normalizedDate:(NSDate *)date {
    
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

- (NSDate *)toLocalTime {
    NSTimeZone *timeZone    = [NSTimeZone defaultTimeZone];
    NSInteger seconds       = [timeZone secondsFromGMTForDate:self];
    return [NSDate dateWithTimeInterval:seconds sinceDate:self];
}

- (NSDate *)toGlobalTime {
    NSTimeZone *timeZone    = [NSTimeZone defaultTimeZone];
    NSInteger seconds       = -[timeZone secondsFromGMTForDate:self];
    return [NSDate dateWithTimeInterval:seconds sinceDate:self];
}

- (NSString *)monthInGenetiveCaseForRULocale {
    
    if (!self) {
        return @"";
    }
    NSDateComponents *comps = [[NSCalendar currentCalendar] components:NSCalendarUnitMonth
                                                              fromDate:self];
    switch (comps.month) {
        case 1:     return @"Января";   break;
        case 2:     return @"Февраля";  break;
        case 3:     return @"Марта";    break;
        case 4:     return @"Апреля";   break;
        case 5:     return @"Мая";      break;
        case 6:     return @"Июня";     break;
        case 7:     return @"Июля";     break;
        case 8:     return @"Августа";  break;
        case 9:     return @"Сентября"; break;
        case 10:    return @"Октября";  break;
        case 11:    return @"Ноября";   break;
        case 12:    return @"Декабря";  break;
        default:    return @"";         break;
    }
}

@end
