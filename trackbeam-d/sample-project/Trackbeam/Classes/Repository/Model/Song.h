//
//  Song.h
//  
//
//  Created by Valentin Filip on 9/2/13.
//
//

#import <Foundation/Foundation.h>

@interface Song : NSObject

@property (nonatomic, copy) NSString    *title;
@property (nonatomic, copy) NSString    *cover;
@property (nonatomic, assign) NSTimeInterval  duration;

+ (id)songWithDict:(NSDictionary *)dict;

@end
