//
//  Model.h
//  
//
//  Created by Valentin Filip on 25/08/2013.
//  Copyright (c) 2013 AppDesignVault. All rights reserved.
//



@interface Album : NSObject

@property (nonatomic, copy) NSString    *title;
@property (nonatomic, copy) NSString    *artist;
@property (nonatomic, copy) NSString    *genre;
@property (nonatomic, copy) NSDate      *releaseDate;
@property (nonatomic, copy) NSString    *cover;
@property (nonatomic, copy) NSArray     *songs;

+ (id)albumWithDict:(NSDictionary *)dict;

@end
