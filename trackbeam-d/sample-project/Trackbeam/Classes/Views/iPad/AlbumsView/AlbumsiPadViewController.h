//
//  AlbumsiPadViewController.h
//
//
//  Created by Valentin Filip on 09/08/2013.
//  Copyright (c) 2013 AppDesignVault. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Album.h"
#import <MapKit/MapKit.h>


@interface AlbumsiPadViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate>

@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) IBOutlet UIImageView *detailBackground;


@property (nonatomic, strong) NSArray* items;


@end