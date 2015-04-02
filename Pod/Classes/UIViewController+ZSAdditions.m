//
//  UIViewController+ZSAdditions.m
//  ZSAdditions
//
//  Created by Stas Zhukovskiy on 16.02.15.
//  Copyright (c) 2015 Stas Zhukovskiy. All rights reserved.
//

#import "UIViewController+ZSAdditions.h"

@implementation UIViewController (ZSAdditions)

+ (NSString *)storyBoardIdentifier {
    return NSStringFromClass([self class]);
}

@end
