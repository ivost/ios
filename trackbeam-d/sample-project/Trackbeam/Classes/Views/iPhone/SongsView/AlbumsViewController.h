//
//  SongsViewController.h
//
//
//  Created by Valentin Filip on 18/08/2013.
//  Copyright (c) 2013 AppDesignVault. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlbumsViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource, UIViewControllerTransitioningDelegate>

@property (nonatomic, retain) NSArray* items;

@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) IBOutlet UISegmentedControl *segment;


@end
