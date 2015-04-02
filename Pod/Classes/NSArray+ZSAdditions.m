//
//  NSArray+ZSAdditions.m
//  ZSAdditions
//
//  Created by Stanislav Zhukovskiy on 17.02.14.
//  Copyright (c) 2015 Stas Zhukovskiy. All rights reserved.
//

#import "NSArray+ZSAdditions.h"

@implementation NSArray (ZSAdditions)

- (id)randomObject {
	if (self.count == 0)
	    return nil;
	
	return self[arc4random_uniform((int)self.count)];
}

@end
