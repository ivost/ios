//
//  Song.m
//
//
//  Created by Valentin Filip on 9/2/13.
//
//

#import "Song.h"

@implementation Song

+ (id)songWithDict:(NSDictionary *)dict {
    Song *item = [[Song alloc] init];
    item.title = dict[@"title"];
    item.cover = dict[@"cover"];
    item.duration = [dict[@"duration"] integerValue];
    
    return item;
}


@end
