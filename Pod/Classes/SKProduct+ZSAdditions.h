//
//  SKProduct+ZSAdditions.h
//	ZSAdditions
//
//  Created by Stas Zhukovskiy on 14.02.15.
//  Copyright (c) 2015 Stas Zhukovskiy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <StoreKit/StoreKit.h>

@interface SKProduct (ZSAdditions)

@property (nonatomic, readonly) NSString *localizedPrice;

@end
