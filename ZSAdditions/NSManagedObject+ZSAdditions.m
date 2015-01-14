//
//  NSManagedObject+ZSAdditions.m
//
//
//  Created by Stas Zhukovskiy on 12.01.15.
//  Copyright (c) 2015 Stas Zhukovskiy. All rights reserved.
//

#import "NSManagedObject+ZSAdditions.h"

@implementation NSManagedObject (EntityName)

+ (NSString *)entityName {
    return NSStringFromClass(self);
}

+ (instancetype)newInstanceInManagedObjectContext:(NSManagedObjectContext *)context {
    id object = [NSEntityDescription insertNewObjectForEntityForName:[self entityName]
                                              inManagedObjectContext:context];
    return object;
}

+ (instancetype)newAllInstancesFetchRequest {
    id object = [[NSFetchRequest alloc] initWithEntityName:[self entityName]];
    return object;
}

@end
