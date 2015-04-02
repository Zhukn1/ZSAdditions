//
//  NSDateFormatter+ZSAdditions.m
//  ZSAdditions
//
//  Created by Stanislav Zhukovskiy on 02.04.15.
//  Copyright (c) 2015 Stas Zhukovskiy. All rights reserved.
//

#import "NSDateFormatter+ZSAdditions.h"

@implementation NSDateFormatter (ZSAdditions)

+ (NSDateFormatter *)httpResponceDateFormatter {
    
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    df.timeZone         = [NSTimeZone timeZoneWithAbbreviation:@"GMT"];
    df.locale           = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
    df.dateFormat       = @"EEE',' dd MMM yyyy HH':'mm':'ss 'GMT'";
    return df;
}

@end
