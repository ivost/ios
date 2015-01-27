//
//  SideMenuViewController.m
//  RadioJive
//
//  Created by Valentin Filip on 9/10/12.
//  Copyright (c) 2012 AppDesignVault. All rights reserved.
//

#import "SideMenuViewController.h"
#import "MasteriPadViewController.h"
#import "AlbumsiPadViewController.h"
#import "AppDelegate.h"

#import "DataLoader.h"

@interface SideMenuViewController ()

@property (nonatomic, strong) UIViewController *childVC;

@property (strong, nonatomic) NSArray       *models;

@end

@implementation SideMenuViewController

@synthesize tableView = _tableView;
@synthesize currentlySelectedIndex;
//@synthesize childVC;

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.backgroundColor = [UIColor clearColor];
        
    UINavigationController *nav = ((UINavigationController *)[AppDelegate sharedDelegate].window.rootViewController);
    MasteriPadViewController *masterVC = nav.viewControllers[0];
    self.models = masterVC.data;
    
    UIBlurEffect* blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView* visualEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    self.tableView.backgroundColor = [UIColor clearColor];
    
    visualEffectView.frame = self.tableView.bounds;
    //visualEffectView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.tableView insertSubview:visualEffectView atIndex:0];
    
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    NSIndexPath *firstRow = [NSIndexPath indexPathForRow:0 inSection:0];
    [_tableView selectRowAtIndexPath:firstRow animated:NO scrollPosition:UITableViewScrollPositionTop];
    [self tableView:_tableView didSelectRowAtIndexPath:firstRow];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _models.count;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [[UIView alloc] initWithFrame:(CGRect){0,0,244,56}];
    UILabel *labelTitle = [[UILabel alloc] initWithFrame:(CGRect){10, 0, CGRectGetWidth(headerView.bounds)-20, CGRectGetHeight(headerView.bounds)}];
    labelTitle.backgroundColor = [UIColor clearColor];
    labelTitle.textColor = [UIColor whiteColor];
    labelTitle.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:26];
    labelTitle.text = @"Genre";
    [headerView addSubview:labelTitle];
    UIView *divider = [[UIView alloc] initWithFrame:(CGRect){0, CGRectGetHeight(headerView.bounds)-1, CGRectGetWidth(headerView.bounds), 1}];
    divider.backgroundColor = [UIColor colorWithWhite:1.f alpha:0.33f];
    [headerView addSubview:divider];
    
    return headerView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"GenreCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    cell.backgroundColor = [UIColor clearColor];
    
    cell.textLabel.text = [_models[indexPath.row] lowercaseString];
    cell.textLabel.textColor = [UIColor colorWithWhite:1.f alpha:0.69f];
    cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:22];
    
    return cell;
}



#pragma mark - Table view delegate

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 54;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 27;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UINavigationController *nav = ((UINavigationController *)[AppDelegate sharedDelegate].window.rootViewController);
    MasteriPadViewController *masterVC = nav.viewControllers[0];
    [masterVC dismissSidebar:nil];
    
    AlbumsiPadViewController *detailVC = (AlbumsiPadViewController *)masterVC.detailViewController;
    detailVC.items = [DataLoader albums];
}


@end
