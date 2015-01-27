//
//  SongsViewController.m
//
//
//  Created by Valentin Filip on 18/08/2013.
//  Copyright (c) 2013 AppDesignVault. All rights reserved.
//

#import "AlbumsViewController.h"

#import "AppDelegate.h"
#import "ADVTheme.h"
#import "DetailViewController.h"
#import "AlbumCollectionCell.h"

#import "DataLoader.h"
#import "Album.h"

#import "ADVAnimationController.h"
#import "DropAnimationController.h"
#import "ZoomAnimationController.h"

@interface AlbumsViewController ()

@property (nonatomic, strong) id<ADVAnimationController> animationController;
@property (nonatomic, strong) NSIndexPath *currentIndex;

@end



@implementation AlbumsViewController


#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [_collectionView setBackgroundColor:[UIColor clearColor]];
    [ADVThemeManager customizeView:self.view];
    
    self.title = @"Albums";
    
    UIBarButtonItem *elemButton = [[UIBarButtonItem alloc] initWithTitle:@"Elements" style:UIBarButtonItemStylePlain target:self action:@selector(actionShowElem:)];
    self.navigationItem.leftBarButtonItem = elemButton;
    
    self.segment.tintColor = [UIColor colorWithWhite:1.0f alpha:0.32f];
    NSDictionary *titleTextAttributesH = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
    [self.segment setTitleTextAttributes:titleTextAttributesH forState:UIControlStateSelected];
    
    self.items = [DataLoader albums];
    
    //self.animationController = [[ZoomAnimationController alloc] init];
    self.animationController = [[DropAnimationController alloc] init];
}

- (void)viewDidUnload {
    [super viewDidUnload];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}


#pragma mark - Actions

- (void)actionShowElem:(id)sender {
    UINavigationController *nav = [self.storyboard instantiateViewControllerWithIdentifier:@"ElemNav"];
    nav.transitioningDelegate = self;
    
    [self presentViewController:nav animated:YES completion:nil];
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
    self.currentIndex = indexPath;
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}


#pragma mark - Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showDetail"]) {
        DetailViewController *controller = segue.destinationViewController;
        
        controller.model = _items[_currentIndex.row];
    }
}



#pragma mark - UIViewControllerTransitioningDelegate

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                  presentingController:(UIViewController *)presenting
                                                                      sourceController:(UIViewController *)source
{
    self.animationController.isPresenting = YES;
    
    return self.animationController;
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    self.animationController.isPresenting = NO;
    
    return self.animationController;
}

@end
