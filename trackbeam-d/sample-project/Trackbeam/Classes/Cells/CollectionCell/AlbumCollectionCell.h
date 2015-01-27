//
//  AlbumCollectionCell.h
//  
//
//  Created by Valentin Filip on 25/08/2013.
//  Copyright (c) 2013 AppDesignVault. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Album;



@interface AlbumCollectionCell : UICollectionViewCell


@property (nonatomic, strong) Album *model;

@property (strong, nonatomic) IBOutlet UIImageView *coverImage;

@property (nonatomic, strong) IBOutlet UILabel* titleLabel;
@property (nonatomic, strong) IBOutlet UILabel* artistLabel;


@end
