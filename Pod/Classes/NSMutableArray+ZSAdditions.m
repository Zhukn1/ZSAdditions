//
//  NSMutableArray+ZSAdditions.m
//  
//
//  Created by Stanislav Zhukovskiy on 17.02.14.
//  Copyright (c) 2014 Stas Zhukovskiy. All rights reserved.
//

#import "NSMutableArray+ZSAdditions.h"

@implementation NSMutableArray (ZSAdditions)

- (NSMutableArray *)reverseArray {
    return (NSMutableArray *)[[self reverseObjectEnumerator] allObjects];
}

- (void)shuffleArray {
    for (int i = ((int)self.count - 1); i >= 1; --i) {
        int j = arc4random() % i;
        id tempObject = self[j];
        [self replaceObjectAtIndex:j withObject:self[i]];
        [self replaceObjectAtIndex:i withObject:tempObject];
    }
}

@end
