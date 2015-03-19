//
//  NSDate+ZSAdditions.h
//  
//
//  Created by Stanislav Zhukovskiy on 23.01.15.
//  Copyright (c) 2015 Stas Zhukovskiy. All rights reserved.
//

@interface NSDate (ZSAdditions)

- (NSDate *)normalizedDate:(NSDate *)date;
- (NSDate *)toLocalTime;
- (NSDate *)toGlobalTime;

@end
