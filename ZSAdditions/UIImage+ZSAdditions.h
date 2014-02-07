//
//  UIImage+ZSAdditions.m
//
//
//  Created by Stas Zhukovskiy on 22.01.14.
//  Copyright (c) 2014 Stas Zhukovskiy.
//

#import <UIKit/UIKit.h>

@interface UIImage (ZSAdditions)

+ (UIImage *)imageFromView:(UIView *)view;
+ (UIImage *)imageFromView:(UIView *)view scaledToSize:(CGSize)newSize;
+ (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize;
+ (UIImage *)cropBiggestCenteredSquareImageFromImage:(UIImage *)image withSide:(CGFloat)side;
+ (void)beginImageContextWithSize:(CGSize)size;

@end
