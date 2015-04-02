//
//  SKProduct+ZSAdditions.m
//	ZSAdditions
//
//  Created by Stas Zhukovskiy on 14.02.15.
//  Copyright (c) 2015 Stas Zhukovskiy. All rights reserved.
//

#import "SKProduct+ZSAdditions.h"

@implementation SKProduct (ZSAdditions)

- (NSString *)localizedPrice {
    
    NSNumberFormatter *numberFormatter = [NSNumberFormatter new];
    [numberFormatter setFormatterBehavior:NSNumberFormatterBehavior10_4];
    [numberFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    [numberFormatter setLocale:self.priceLocale];
    
    return [numberFormatter stringFromNumber:self.price];
}

@end
