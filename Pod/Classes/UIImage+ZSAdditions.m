//
//  UIImage+ZSAdditions.m
//
//
//  Created by Stas Zhukovskiy on 22.01.14.
//  Copyright (c) 2014 Stas Zhukovskiy.
//

#import "UIImage+ZSAdditions.h"

@implementation UIImage (ZSAdditions)

+ (void)beginImageContextWithSize:(CGSize)size {
    if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)]) {
        if ([[UIScreen mainScreen] scale] == 2.0)
            UIGraphicsBeginImageContextWithOptions(size, YES, 2.0);
        else
            UIGraphicsBeginImageContext(size);
    } else
        UIGraphicsBeginImageContext(size);
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
    UIImage *image = [self imageFromView:view];
    if ([view bounds].size.width != newSize.width || [view bounds].size.height != newSize.height)
        image = [self imageWithImage:image scaledToSize:newSize];
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
    CGSize size = image.size;
    if(size.width == size.height && size.width == side)
        return image;
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
    } else {
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

@end
