//
//  Card.h
//  Cards
//
//  Created by Ivo Stoyanov on 1/17/15.
//  Copyright (c) 2015 s1nn. All rights reserved.
//

//#import <Foundation/Foundation.h>

@import Foundation;

@interface Card : NSObject

@property (strong, nonatomic) NSString * contents;

@property (nonatomic, getter=isChosen) BOOL chosen;
@property (nonatomic, getter=isMatched) BOOL matched;

- (int) match: (Card *) card;

@end
