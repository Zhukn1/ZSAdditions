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
    
    NSInteger foundCount    = 0;
    NSRange range           = NSMakeRange(0, text.length);
    range                   = [text rangeOfString:stringToCount
                                          options:NSCaseInsensitiveSearch
                                            range:range
                                           locale:nil];
    while (range.location != NSNotFound) {
        foundCount ++;
        range = NSMakeRange(range.location + range.length, text.length - (range.location + range.length));
        range = [text rangeOfString:stringToCount options:NSCaseInsensitiveSearch range:range locale:nil];
    }
    
    return foundCount;
}

+ (NSString *)convertSecondsToMinutes:(int)totalSeconds {
    
    int seconds         = totalSeconds % 60;
    int minutes         = (totalSeconds / 60) % 60;
    int hours           = totalSeconds / 3600;
    NSString *result    = @"";
    
    if (hours > 0) {
        result = [NSString stringWithFormat:@"%02d:%02d:%02d",hours, minutes, seconds];
    } else {
        result = [NSString stringWithFormat:@"%02d:%02d", minutes, seconds];
    }
    return result;
}

- (NSString *)stringByTrimmingWhitespaceAndNewlineCharacters {
    
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (NSString *)stringByTrimmingWhitespaces {
    
    return [self stringByReplacingOccurrencesOfString:@" " withString:@""];
}

+ (NSString *)formatRubPriceToString:(NSInteger)value {
    
    NSNumberFormatter *formatter = [NSNumberFormatter new];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    [formatter setGroupingSeparator:@" "];
    
    NSString *result    = [formatter stringFromNumber:@(value)];
    // \u20BD is the unicode Ruble character.
    result              = [result stringByAppendingString:[NSString stringWithFormat:@" \u20BD"]];
    
    return result;
}

@end
