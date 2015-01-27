//
//  Card.m
//  Cards
//
//  Created by Ivo Stoyanov on 1/17/15.
//  Copyright (c) 2015 s1nn. All rights reserved.
//

#import "Card.h"

@interface Card()

@end


@implementation Card

//@synthesize contents = _contents;

- (int) match: (Card *) card
{
    int score = 0;
    if ( [card.contents isEqualToString: [self contents]] )
    {
        score = 1;
    }
    return score;
}

@end
