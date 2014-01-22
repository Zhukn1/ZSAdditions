//
//  UIImage+ZHAdditions.m
//
//
//  Created by Stas Zhukovskiy on 22.01.14.
//  Copyright (c) 2014 Stas Zhukovskiy.
//

#import <UIKit/UIKit.h>

@interface UIImage (ZHAdditions)

+ (UIImage*)imageFromView:(UIView*)view;
+ (UIImage*)imageFromView:(UIView*)view scaledToSize:(CGSize)newSize;
+ (UIImage*)imageWithImage:(UIImage*)image scaledToSize:(CGSize)newSize;
+ (void)beginImageContextWithSize:(CGSize)size;

@end
