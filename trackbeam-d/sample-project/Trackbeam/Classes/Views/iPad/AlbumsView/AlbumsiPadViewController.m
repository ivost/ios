//
//  AlbumsiPadViewController.m
//  
//
//  Created by Valentin Filip on 09/08/2013.
//  Copyright (c) 2013 AppDesignVault. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

#import "AlbumsiPadViewController.h"
#import "MasteriPadViewController.h"
#import "DetailViewController.h"

#import "AppDelegate.h"
#import "DataLoader.h"

#import "ADVTheme.h"

#import "MasterCell.h"
#import "AlbumCollectionCell.h"


@interface AlbumsiPadViewController ()

@property (nonatomic, strong) NSIndexPath *currentIndex;


@end




@implementation AlbumsiPadViewController


#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _collectionView.backgroundColor = [UIColor clearColor];
    
}

- (void)viewDidUnload {
    [super viewDidUnload];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    id<ADVTheme> theme = [ADVThemeManager sharedTheme];
    _detailBackground.image = [theme viewBackgroundForOrientation:self.interfaceOrientation];
    [self arrangeCollectionView];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	return YES;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return UIInterfaceOrientationLandscapeLeft;
}


- (void)arrangeCollectionView {
    UICollectionViewFlowLayout *flowLayout = (UICollectionViewFlowLayout *)self.collectionView.collectionViewLayout;
    if (UIInterfaceOrientationIsPortrait(self.interfaceOrientation)) {
        flowLayout.scrollDirection =  UICollectionViewScrollDirectionVertical;
        flowLayout.sectionInset = (UIEdgeInsets){30, 211, 30, 211};
    } else {
        flowLayout.scrollDirection =  UICollectionViewScrollDirectionHorizontal;
        flowLayout.sectionInset = (UIEdgeInsets){211, 30, 211, 30};
    }
    self.collectionView.collectionViewLayout = flowLayout;
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    
    id<ADVTheme> theme = [ADVThemeManager sharedTheme];
    _detailBackground.image = [theme viewBackgroundForOrientation:toInterfaceOrientation];
    
    [self arrangeCollectionView];
}


#pragma mark - Accessors

- (void)setItems:(NSArray *)items {
    if ([_items isEqual:items]) {
        return;
    }
    
    _items = items;
    [self loadDataIntoView:items];
}




#pragma mark - Visual stuff


- (void)loadDataIntoView:(NSArray *)items {
    
    [_collectionView reloadData];
}

#pragma mark - UICollectionView DataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section {
    return _items.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSString *CellIdentifier = @"SongCell";
    
    AlbumCollectionCell *cell = [cv dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithWhite:0.f alpha:0.18f];
    
    cell.model = _items[indexPath.row];
    [cell setNeedsLayout];
    
    return cell;
}

#pragma mark - UICollectionView Delegate

-(void)collectionView:(UICollectionView *)cv didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    UINavigationController *nav = ((UINavigationController *)[AppDelegate sharedDelegate].window.rootViewController);
    MasteriPadViewController *masterVC = nav.viewControllers[0];
    [masterVC showDetailForAlbum:_items[indexPath.row]];
}


@end
