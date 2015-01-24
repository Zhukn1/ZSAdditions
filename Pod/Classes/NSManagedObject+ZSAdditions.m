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

+ (NSFetchRequest *)newAllInstancesFetchRequest {
    NSFetchRequest *fetchRequset = [[NSFetchRequest alloc] initWithEntityName:[self entityName]];
    return fetchRequset;
}

+ (void)cleanupAllInstancesInManagedObjectContext:(NSManagedObjectContext *)context {
    NSFetchRequest *fetchRequest  = [self newAllInstancesFetchRequest];
    [fetchRequest setIncludesPropertyValues:NO];
    
    NSError *error      = nil;
    NSArray *entities   = [context executeFetchRequest:fetchRequest
                                                 error:&error];
    for (id object in entities) {
        [context deleteObject:object];
    }
    
    NSError *saveError  = nil;
    [context save:&saveError];
}

@end
