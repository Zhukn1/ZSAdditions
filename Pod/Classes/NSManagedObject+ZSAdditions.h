//
//  NSManagedObject+ZSAdditions.h
//  
//
//  Created by Stas Zhukovskiy on 12.01.15.
//  Copyright (c) 2015 Stas Zhukovskiy. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface NSManagedObject (EntityName)

+ (NSString *)entityName;
+ (instancetype)newInstanceInManagedObjectContext:(NSManagedObjectContext *)context;
+ (NSFetchRequest *)newAllInstancesFetchRequest;
+ (void)cleanupAllInstancesInManagedObjectContext:(NSManagedObjectContext *)context;

@end
