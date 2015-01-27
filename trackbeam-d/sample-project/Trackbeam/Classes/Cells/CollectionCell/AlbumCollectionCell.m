//
//  AlbumCollectionCell.m
//  
//
//  Created by Valentin Filip on 25/08/2013.
//  Copyright (c) 2013 AppDesignVault. All rights reserved.
//

#import "AlbumCollectionCell.h"
#import "Album.h"
#import "AppDelegate.h"

#import <QuartzCore/QuartzCore.h>

@implementation AlbumCollectionCell

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat fontEnlarge = [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad ? 4 : 0;
    
    _coverImage.image = [UIImage imageNamed:_model.cover];
    
    _titleLabel.text = [_model.title uppercaseString];
    _titleLabel.textColor = [UIColor whiteColor];
    _titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:13 + fontEnlarge];
    
    _artistLabel.text = _model.artist;
    _artistLabel.textColor = [UIColor colorWithRed:0.54f green:0.98f blue:0.85f alpha:1.00f];
    _artistLabel.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:10 + fontEnlarge];
    
    self.frame = CGRectIntegral(self.frame);
}

@end
