//
//  DetailThemeController.h
//  
//
//  Created by Valentin Filip on 25/08/2013.
//  Copyright (c) 2013 AppDesignVault. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "Album.h"

@interface DetailViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, retain) Album* model;

@property (strong, nonatomic) IBOutlet UIImageView *backgroundImageV;
@property (strong, nonatomic) IBOutlet UIImageView *coverImageV;
@property (strong, nonatomic) IBOutlet UIImageView *blurredImageV;
@property (strong, nonatomic) IBOutlet UIView *blurView;

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *songNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *playedSecsLabel;
@property (strong, nonatomic) IBOutlet UILabel *remainingSecsLabel;

@property (strong, nonatomic) IBOutlet UISlider *songSlider;
@property (strong, nonatomic) IBOutlet UISlider *volumeSlider;


@end
