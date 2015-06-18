//
//  NSManagedObject+ZSAdditions.m
//  ZSAdditions
//
//  Created by Stas Zhukovskiy on 12.01.15.
//  Copyright (c) 2015 Stas Zhukovskiy. All rights reserved.
//

#import "NSManagedObject+ZSAdditions.h"

@implementation NSManagedObject (EntityName)

+ (NSString *)entityName {
    //In Swift the class is returned with the module name prefix so we need to get rid of that.
    NSString *str = NSStringFromClass(self);
    return [[str componentsSeparatedByString:@"."] lastObject];
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
    fetchRequest.resultType 	  = NSManagedObjectIDResultType;
    NSArray *entities  			  = [context executeFetchRequest:fetchRequest
                                               			   error:NULL];
    for (NSManagedObjectID *objID in entities) {
    	NSManagedObject *obj = [context objectWithID:objID];
        [context deleteObject:obj];
    }
    
    [context save:NULL];
}

@end
