//
//  Model.m
//  
//
//  Created by Valentin Filip on 25/08/2013.
//  Copyright (c) 2013 AppDesignVault. All rights reserved.
//

#import "Album.h"
#import "Song.h"

@implementation Album

+ (id)albumWithDict:(NSDictionary *)dict {
    Album *item = [[Album alloc] init];
    item.title = dict[@"title"];
    item.artist = dict[@"artist"];
    item.genre = dict[@"genre"];
    item.releaseDate = dict[@"releaseDate"];
    item.cover = dict[@"cover"];
    
    NSMutableArray *songs = [NSMutableArray arrayWithCapacity:[dict[@"songs"] count]];
    for (NSDictionary *song in dict[@"songs"]) {
        [songs addObject:[Song songWithDict:song]];
    }
    item.songs = songs;
    
    return item;
}


@end
