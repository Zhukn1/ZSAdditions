//
//  NSString+ZSAdditions.h
//  ZSAdditions
//
//  Created by Stanislav Zhukovskiy on 05.02.14.
//  Copyright (c) 2015 Stas Zhukovskiy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (ZSAdditions)

+ (NSInteger)countOccurencesOfString:(NSString *)stringToCount inString:(NSString *)text;
+ (NSString *)convertSecondsToMinutes:(int)totalSeconds;
- (NSString *)stringByTrimmingWhitespaceAndNewlineCharacters;
- (NSString *)stringByTrimmingWhitespaces;
+ (NSString *)formatRubPriceToString:(NSInteger)value;
+ (NSString *)plurableForInteger:(NSInteger)count
         withStringForNumberFive:(NSString *)first
              stringForNumberTwo:(NSString *)second
           andStringForNumberOne:(NSString *)third;

@end
