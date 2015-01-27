//
//  MasteriPadViewController.m
//  RadioJive
//
//  Created by Valentin Filip on 9/10/12.
//  Copyright (c) 2012 AppDesignVault. All rights reserved.
//

#import "MasteriPadViewController.h"
#import "ADVTheme.h"
#import "SongCollectionCell.h"
#import "NGTabBarController.h"

#import "DataLoader.h"

@interface MasteriPadViewController ()

@end



@implementation MasteriPadViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"EVENTS";
    
    self.items = [DataLoader events];
    [self.collectionView reloadData];
    
    _collectionView.backgroundColor = [UIColor clearColor];
    [ADVThemeManager customizeView:self.view];
    
    [self customizeTabs];
}


- (void)customizeTabs {
    _tabBar.backgroundColor = [UIColor clearColor];
    _tabBar.itemHighlightColor = [UIColor colorWithWhite:0.f alpha:0.2f];
    _tabBar.backgroundImage = [[UIImage imageNamed:@"tabBarBackground"] resizableImageWithCapInsets:(UIEdgeInsets){10,10,10,10}];
    _tabBar.position = NGTabBarPositionBottom;
    _tabBar.layoutStrategy = NGTabBarLayoutStrategyCentered;
    
    _tabBar.items = @[[NGTabBarItem itemWithTitle:@"" image:[UIImage imageNamed:@"tabbar-tab1"]],
                          [NGTabBarItem itemWithTitle:@"" image:[UIImage imageNamed:@"tabbar-tab2"]],
                          [NGTabBarItem itemWithTitle:@"" image:[UIImage imageNamed:@"tabbar-tab3"]],
                          [NGTabBarItem itemWithTitle:@"" image:[UIImage imageNamed:@"tabbar-tab4"]],
                          [NGTabBarItem itemWithTitle:@"" image:[UIImage imageNamed:@"tabbar-tab5"]]];
    
    for (NGTabBarItem *item in _tabBar.items) {
        item.selectedImage = item.image;
        [item setSize:(CGSize){65, 42}];
        [item addTarget:self action:@selector(handleItemPressed:) forControlEvents:UIControlEventTouchDown];
    }
}

- (void)handleItemPressed:(id)sender {
    NSInteger index = [self.tabBar.items indexOfObject:sender];
    [self.tabBar selectItemAtIndex:index];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

-(BOOL)shouldAutorotate
{
    return YES;
}

-(NSUInteger)supportedInterfaceOrientations
{
    return (UIInterfaceOrientationMaskAllButUpsideDown);
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    NSString *background = UIInterfaceOrientationIsPortrait(toInterfaceOrientation) ? @"background" : @"background-landscape";
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:background]]];
}



#pragma mark - UICollectionView DataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section {
    return _items.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSString *CellIdentifier = @"EventCell";
    
    SongCollectionCell *cell = [cv dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:0.44f green:0.76f blue:0.44f alpha:1.00f];
    
    cell.model = _items[indexPath.row];
    [cell setNeedsLayout];
    
    return cell;
}




@end
