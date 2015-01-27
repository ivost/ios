//
//  DetailThemeController.m
//  
//
//  Created by Valentin Filip on 25/08/2013.
//  Copyright (c) 2013 AppDesignVault. All rights reserved.
//

#import "DetailViewController.h"
#import "AppDelegate.h"
#import "ADVTheme.h"

#import "Song.h"


@interface DetailViewController ()

@property (nonatomic, strong) NSIndexPath *currentIndex;

@end





@implementation DetailViewController


#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    id<ADVTheme> theme = [ADVThemeManager sharedTheme];
    _backgroundImageV.image = [theme viewBackgroundForOrientation:self.interfaceOrientation];
    _coverImageV.image = [UIImage imageNamed:[_model.cover stringByReplacingOccurrencesOfString:@"list" withString:@"details"]];
    
    UIBlurEffect* blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView* visualEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    self.blurView.backgroundColor = [UIColor clearColor];
    
    visualEffectView.frame = self.blurView.bounds;
    visualEffectView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.blurView insertSubview:visualEffectView atIndex:0];
    
    
    NSLayoutConstraint* top = [NSLayoutConstraint constraintWithItem:self.blurView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:visualEffectView attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
    
    NSLayoutConstraint* bottom = [NSLayoutConstraint constraintWithItem:self.blurView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:visualEffectView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
    
    NSLayoutConstraint* left = [NSLayoutConstraint constraintWithItem:self.blurView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:visualEffectView attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0];
    
    NSLayoutConstraint*  right = [NSLayoutConstraint constraintWithItem:self.blurView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:visualEffectView attribute:NSLayoutAttributeRight multiplier:1.0 constant:0];
    
    [self.blurView addConstraints:@[top, bottom, left
                                             , right]];

    
    [self setNavigationBackground:self.interfaceOrientation];
    
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    _titleLabel.text = [NSString stringWithFormat:@"%@ - %@", _model.artist, _model.title];
    _titleLabel.textColor = [UIColor colorWithRed:0.42f green:0.99f blue:0.84f alpha:1.00f];
    _titleLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:11];
    
    self.title = [NSString stringWithFormat:@"%@ - %@", _model.artist, _model.title];
    
    Song *song = _model.songs[_currentIndex.row];
    _songNameLabel.text = song.title;
    _songNameLabel.textColor = [UIColor whiteColor];
    _songNameLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:19];
    
    [_songSlider setMinimumTrackImage:[[UIImage imageNamed:@"details-item-song-min"] resizableImageWithCapInsets:(UIEdgeInsets){0,10,0,10}] forState:UIControlStateNormal];
    [_songSlider setMaximumTrackImage:[[UIImage imageNamed:@"details-item-song-max"] resizableImageWithCapInsets:(UIEdgeInsets){0,10,0,10}] forState:UIControlStateNormal];
    
    [_volumeSlider setMinimumTrackImage:[[UIImage imageNamed:@"details-item-volume-min"] resizableImageWithCapInsets:(UIEdgeInsets){0,10,0,10}] forState:UIControlStateNormal];
    [_volumeSlider setMaximumTrackImage:[[UIImage imageNamed:@"details-item-volume-max"] resizableImageWithCapInsets:(UIEdgeInsets){0,10,0,10}] forState:UIControlStateNormal];
    
    [_songSlider setThumbImage:[UIImage imageNamed:@"details-item-slider-handle"] forState:UIControlStateNormal];
    [_volumeSlider setThumbImage:[UIImage imageNamed:@"details-item-slider-handle"] forState:UIControlStateNormal];
    
    [_tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:NO scrollPosition:UITableViewScrollPositionNone];
    [self tableView:_tableView didSelectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    id<ADVTheme> theme = [ADVThemeManager sharedTheme];
    
    UIButton *btnBack = [UIButton buttonWithType:UIButtonTypeCustom];
    btnBack.frame = (CGRect){0,0,70,30};
    btnBack.titleLabel.font = [theme barButtonFont];
    [btnBack setTitle:@"Back" forState:UIControlStateNormal];
    [btnBack setBackgroundImage:[[UIImage imageNamed:@"backButton"] resizableImageWithCapInsets:(UIEdgeInsets){0, 20, 0, 10}] forState:UIControlStateNormal];
    [btnBack addTarget:self  action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btnBack];
}


- (void)viewDidUnload {
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    
    id<ADVTheme> theme = [ADVThemeManager sharedTheme];
    _backgroundImageV.image = [theme viewBackgroundForOrientation:toInterfaceOrientation];
    
    [self setNavigationBackground:toInterfaceOrientation];
}


- (void)setNavigationBackground:(UIInterfaceOrientation)orientation {
    id<ADVTheme> theme = [ADVThemeManager sharedTheme];
    
    UIImage *backgroundImage = UIInterfaceOrientationIsPortrait(orientation) ? [theme navigationBackgroundForBarMetrics:UIBarMetricsDefault] : [theme navigationBackgroundForBarMetrics:UIBarMetricsLandscapePhone];
    [self.navigationController.navigationBar setBackgroundImage:backgroundImage forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setBackgroundImage:backgroundImage forBarMetrics:UIBarMetricsLandscapePhone];
}


#pragma mark - Actions

- (void)goBack {
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark - UITableView Datasource 

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _model.songs.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SongCell"];
    
    cell.backgroundColor = indexPath.row % 2 == 0 ? [UIColor colorWithWhite:0.f alpha:0.12f] : [UIColor clearColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    Song *song = _model.songs[indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld. %@", indexPath.row+1, song.title];
    cell.textLabel.textColor = [UIColor colorWithWhite:1.f alpha:1.f];
    cell.textLabel.highlightedTextColor = [UIColor colorWithRed:0.42f green:0.99f blue:0.84f alpha:1.00f];
    cell.textLabel.backgroundColor = [UIColor clearColor];
    
    return cell;
}


#pragma mark - UITableView Delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 32;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:_currentIndex];
    cell.accessoryView = nil;
    cell.textLabel.highlighted = NO;
    
    _currentIndex = indexPath;
    cell = [tableView cellForRowAtIndexPath:_currentIndex];
    cell.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"details-item-playing"]];
    cell.textLabel.highlighted = YES;
    
}

@end
