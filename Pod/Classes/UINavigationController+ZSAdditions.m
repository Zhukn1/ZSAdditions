//
//  UINavigationController+ZSAdditions.m
//  
//
//  Created by Stas Zhukovskiy on 16.02.15.
//  Copyright (c) 2015 Stas Zhukovskiy. All rights reserved.
//

#import "UINavigationController+ZSAdditions.h"
#import <QuartzCore/QuartzCore.h>

@implementation UINavigationController (ZSAdditions)

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated completion:(void (^)(void))completion {
    
    [CATransaction begin];
    [CATransaction setCompletionBlock:completion];
    [self pushViewController:viewController animated:animated];
    [CATransaction commit];
}

@end
