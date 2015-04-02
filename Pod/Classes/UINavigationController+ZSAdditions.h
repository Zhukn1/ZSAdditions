//
//  UINavigationController+ZSAdditions.h
//  ZSAdditions
//
//  Created by Stas Zhukovskiy on 16.02.15.
//  Copyright (c) 2015 Stas Zhukovskiy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (ZSAdditions)

- (void)pushViewController:(UIViewController *)viewController
                  animated:(BOOL)animated
                completion:(void (^)(void))completion;

@end
