//
//  UITableViewCell+ZSAdditions.m
//	ZSAdditions
//
//  Created by Stanislav Zhukovskiy on 03.02.15.
//  Copyright (c) 2015 Stas Zhukovskiy. All rights reserved.
//

#import "UITableViewCell+ZSAdditions.h"

@implementation UITableViewCell (ZSAdditions)

+ (NSString *)cellIdentifier {
    NSString *str = NSStringFromClass(self);
    return [[str componentsSeparatedByString:@"."] lastObject];
}

@end
