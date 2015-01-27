//
//  MasteriPadViewController.h
//  RadioJive
//
//  Created by Valentin Filip on 9/10/12.
//  Copyright (c) 2012 AppDesignVault. All rights reserved.
//

#import <UIKit/UIKit.h>


@class NGTabBar;


@interface MasteriPadViewController : UIViewController {
    
}

@property (nonatomic, strong) NSArray *items;

@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) IBOutlet NGTabBar *tabBar;

@end
