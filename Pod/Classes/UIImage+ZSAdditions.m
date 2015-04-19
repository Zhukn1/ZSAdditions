//
//  UIImage+ZSAdditions.m
//  ZSAdditions
//
//  Created by Stas Zhukovskiy on 22.01.14.
//  Copyright (c) 2015 Stas Zhukovskiy. All rights reserved.
//

#import "UIImage+ZSAdditions.h"

@implementation UIImage (ZSAdditions)

+ (void)beginImageContextWithSize:(CGSize)size {
   
    if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)]) {
        if ([[UIScreen mainScreen] scale] == 2.0) {
            UIGraphicsBeginImageContextWithOptions(size, YES, 2.0);
        }
        else {
            UIGraphicsBeginImageContext(size);
        }
    }
    else {
        UIGraphicsBeginImageContext(size);
    }
}

+ (void)endImageContext {
    UIGraphicsEndImageContext();
}

+ (UIImage *)imageFromView:(UIView *)view {
   
    [self beginImageContextWithSize:[view bounds].size];
    BOOL hidden = [view isHidden];
    [view setHidden:NO];
    [[view layer] renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    [self endImageContext];
    [view setHidden:hidden];
    return image;
}

+ (UIImage *)imageFromView:(UIView *)view scaledToSize:(CGSize)newSize {
  
    UIImage *image          = [self imageFromView:view];
    BOOL widthIsDifferent   = [view bounds].size.width != newSize.width;
    BOOL heightIsDifferent  = [view bounds].size.height != newSize.height;
    if (widthIsDifferent || heightIsDifferent) {
        image = [self imageWithImage:image scaledToSize:newSize];
    }
    return image;
}

+ (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize {
   
    [self beginImageContextWithSize:newSize];
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    [self endImageContext];
    return newImage;
}

+ (UIImage *)cropBiggestCenteredSquareImageFromImage:(UIImage *)image withSide:(CGFloat)side {
    
    // Get size of current image
    CGSize size         = image.size;
    BOOL isSquare       = size.width == size.height;
    BOOL correctSize    = size.width == side;
    if(isSquare && correctSize) {
        return image;
    }
    
    CGSize newSize = CGSizeMake(side, side);
    double ratio;
    double delta;
    CGPoint offset;
    
    //make a new square size, that is the resized imaged width
    CGSize sz = CGSizeMake(newSize.width, newSize.width);
    
    //figure out if the picture is landscape or portrait, then
    //calculate scale factor and offset
    if (image.size.width > image.size.height) {
        ratio = newSize.height / image.size.height;
        delta = ratio*(image.size.width - image.size.height);
        offset = CGPointMake(delta/2, 0);
    }
    else {
        ratio = newSize.width / image.size.width;
        delta = ratio*(image.size.height - image.size.width);
        offset = CGPointMake(0, delta/2);
    }
    
    //make the final clipping rect based on the calculated values
    CGRect clipRect = CGRectMake(-offset.x, -offset.y,
                                 (ratio * image.size.width),
                                 (ratio * image.size.height));
    
    //start a new context, with scale factor 0.0 so retina displays get
    //high quality image
    if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)])
        UIGraphicsBeginImageContextWithOptions(sz, YES, 0.0);
    else
        UIGraphicsBeginImageContext(sz);
    UIRectClip(clipRect);
    [image drawInRect:clipRect];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

+ (UIImage *)imageWithColor:(UIColor *)color {
    
    //make image opaque for speed optimization if color has alpha = 1.
    const CGFloat alpha     = CGColorGetAlpha(color.CGColor);
    const BOOL opaque       = alpha == 1;

    CGRect rect             = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContextWithOptions(rect.size, opaque, 0);
    CGContextRef context    = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image          = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
