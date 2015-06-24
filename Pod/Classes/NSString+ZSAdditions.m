//
//  NSString+ZSAdditions.m
//  ZSAdditions
//
//  Created by Stanislav Zhukovskiy on 05.02.14.
//  Copyright (c) 2015 Stas Zhukovskiy. All rights reserved.
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
    [formatter setGroupingSeparator:@" "];
    
    NSString *result    = [formatter stringFromNumber:@(value)];
    // \u20BD is the unicode Ruble character.
    result              = [result stringByAppendingString:[NSString stringWithFormat:@" \u20BD"]];
    
    return result;
}

+ (NSString *)plurableForInteger:(NSInteger)count
         withStringForNumberFive:(NSString *)first
              stringForNumberTwo:(NSString *)second
           andStringForNumberOne:(NSString *)third
             showIntegerInResult:(BOOL)showIntger {
    
    NSString *plurableStr = @"";
    
    int XY  = (int)floor(count) % 100;
    int Y   = (int)floor(count) % 10;
    
    if (Y == 0 || Y > 4 || (XY > 10 && XY < 15)) {
        plurableStr = first;
    }
    
    if (Y > 1 && Y < 5 && (XY < 10 || XY > 20)) {
        plurableStr = second;
    }
    
    if (Y == 1 && XY != 11) {
        plurableStr = third;
    }
    
    NSString *result = @"";
    
    if (showIntger) {
        
        NSNumberFormatter *formatter    = [NSNumberFormatter new];
        [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
        [formatter setGroupingSeparator:@" "];
        NSString *countStr              = [formatter stringFromNumber:@(count)];
        
        result = [NSString stringWithFormat:@"%@ %@", countStr, plurableStr];
    }
    else {
        result = plurableStr;
    }
    
    return result;
}

@end
