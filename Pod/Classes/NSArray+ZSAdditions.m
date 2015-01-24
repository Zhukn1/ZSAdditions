//
//  NSArray+ZSAdditions.m
//  
//
//  Created by Stanislav Zhukovskiy on 17.02.14.
//  Copyright (c) 2014 Stas Zhukovskiy. All rights reserved.
//

#import "NSArray+ZSAdditions.h"

@implementation NSArray (ZSAdditions)

- (id)randomObject {
	if (self.count == 0)
	    return nil;
	
	return self[arc4random_uniform(self.count)];
}

@end
