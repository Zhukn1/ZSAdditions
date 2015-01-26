//
//  NSString+ZSAdditions.h
//  
//
//  Created by Stanislav Zhukovskiy on 05.02.14.
//  Copyright (c) 2014 Stas Zhukovskiy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (ZSAdditions)

+ (NSInteger)countOccurencesOfString:(NSString *)stringToCount inString:(NSString *)text;
+ (NSString *)convertSecondsToMinutes:(int)totalSeconds;
+ (NSString *)stringByTrimmingWhitespaceAndNewlineCharacters;

@end
