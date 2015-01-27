//
//  DataLoader.m
//  
//
//  Created by Valentin Filip on 25/08/2013.
//  Copyright (c) 2013 AppDesignVault. All rights reserved.
//

#import "DataLoader.h"
#import "Album.h"

@implementation DataLoader


+ (NSArray *)albums {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Albums" ofType:@"plist"];
    NSArray *rawItems = [[NSArray alloc] initWithContentsOfFile:path];
    NSMutableArray *items = [NSMutableArray arrayWithCapacity:rawItems.count];
    
    for (NSDictionary *item in rawItems) {
        [items addObject:[Album albumWithDict:item]];
    }
    
    return items;
}


+ (NSArray *)genres {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Genres" ofType:@"plist"];
    NSArray *items = [[NSArray alloc] initWithContentsOfFile:path];
    
    return items;
}

@end
