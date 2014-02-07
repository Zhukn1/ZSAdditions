//
//  NSString+ZSAdditions.m
//
//
//  Created by Stanislav Zhukovskiy on 05.02.14.
//  Copyright (c) 2014 Stas Zhukovskiy. All rights reserved.
//

#import "NSString+ZSAdditions.h"

@implementation NSString (ZSAdditions)

+ (NSInteger)countOccurencesOfString:(NSString *)stringToCount inString:(NSString *)text {
    NSInteger foundCount = 0;
    NSRange range = NSMakeRange(0, text.length);
    range = [text rangeOfString:stringToCount options:NSCaseInsensitiveSearch range:range locale:nil];
    while (range.location != NSNotFound) {
        foundCount ++;
        range = NSMakeRange(range.location + range.length, text.length - (range.location + range.length));
        range = [text rangeOfString:stringToCount options:NSCaseInsensitiveSearch range:range locale:nil];
    }
    
    return foundCount;
}

@end
