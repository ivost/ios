//
//  ElementsViewController.m
//  
//
//  Created by Valentin Filip on 17/08/2013.
//  Copyright (c) 2013 AppDesignVault. All rights reserved.
//

#import "ElementsViewController.h"
#import "ADVTheme.h"
#import "RCSwitch.h"
#import "ADVProgressBar.h"
#import "AppDelegate.h"
#import "NMRangeSlider.h"
#import "ADVProgressBar.h"
#import "NGTabBarController.h"


@interface ElementsViewController ()

@property (nonatomic, strong) UIView                *lowerValueView;
@property (nonatomic, strong) UIView                *upperValueView;

@end



@implementation ElementsViewController

@synthesize scrollView;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.scrollView.backgroundColor = [UIColor clearColor];
    [ADVThemeManager customizeView:self.view];
    
    id<ADVTheme> theme = [ADVThemeManager sharedTheme];
    
    self.title = @"Elements";
    
    UIBarButtonItem *closeButton = [[UIBarButtonItem alloc] initWithTitle:@"Close" style:UIBarButtonItemStylePlain target:self action:@selector(actionClose:)];
    self.navigationItem.leftBarButtonItem = closeButton;
    
    
    _rangeSliderView.backgroundColor = [UIColor clearColor];
    _rangeSliderView.trackBackgroundImage = [theme sliderMaxTrackDouble];
    
    _rangeSliderView.trackImage = [theme sliderMinTrackDouble];
    
    _rangeSliderView.lowerHandleImageNormal = [theme sliderThumbForState:UIControlStateNormal];
    _rangeSliderView.upperHandleImageNormal = [theme sliderThumbForState:UIControlStateNormal];
    
    _rangeSliderView.lowerHandleImageHighlighted = [theme sliderThumbForState:UIControlStateNormal];
    _rangeSliderView.upperHandleImageHighlighted = [theme sliderThumbForState:UIControlStateNormal];
    
    _rangeSliderView.minimumValue = 0;
    _rangeSliderView.maximumValue = 100;
    _rangeSliderView.upperValue = 79;
    _rangeSliderView.lowerValue = 22;
    
    self.lowerValueView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@""]];
    
    _progressView.progress = _sliderView.value / 100;
    
    [_onSwitch setOn:YES];    
    [_offSwitch setOn:NO];
    
    self.buttonFirst.titleLabel.font =  [UIFont fontWithName:@"Avenir-Heavy" size:15];
    self.buttonSecond.titleLabel.font =  [UIFont fontWithName:@"Avenir-Heavy" size:15];
    
    CGRect frameSegm = self.segment.frame;
    frameSegm.size.height = 30;
    self.segment.frame = frameSegm;
    self.segment.tintColor = [theme segmentedTintColor];
        
    self.scrollView.contentSize = CGSizeMake(self.scrollView.contentSize.width, CGRectGetMaxY(_offSwitch.frame) + 25);
    
    [self customizeTabs];
}


- (void)customizeTabs {
    id<ADVTheme> theme = [ADVThemeManager sharedTheme];
    _tabBar.backgroundImage = [theme tabBarBackground];
    _tabBar.itemHighlightColor = [UIColor colorWithWhite:0.f alpha:0.26f];
    _tabBar.position = NGTabBarPositionBottom;
    
    self.tabBar.items = @[[NGTabBarItem itemWithTitle:@"" image:[UIImage imageNamed:@"tabbar-tab1"]],
                          [NGTabBarItem itemWithTitle:@"" image:[UIImage imageNamed:@"tabbar-tab2"]],
                          [NGTabBarItem itemWithTitle:@"" image:[UIImage imageNamed:@"tabbar-tab3"]],
                          [NGTabBarItem itemWithTitle:@"" image:[UIImage imageNamed:@"tabbar-tab4"]],
                          [NGTabBarItem itemWithTitle:@"" image:[UIImage imageNamed:@"tabbar-tab5"]]];
    
    for (NGTabBarItem *item in _tabBar.items) {
        item.selectedImage = item.image;
        [item setSize:(CGSize){64, 45}];
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

#pragma mark - Actions

- (IBAction)sliderValueChanged:(id)sender {    
    if([sender isKindOfClass:[UISlider class]]) {
        UISlider *s = (UISlider*)sender;
        CGFloat value = s.value / 100;
        if(value >= 0.0 && value <= 1.0) {
            if (self.progressView) {
                self.progressView.progress = value;
            }
        }
    }
}

- (IBAction)actionClose:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidUnload {
    [self setScrollView:nil];
    [self setButtonFirst:nil];
    [self setButtonSecond:nil];
    [super viewDidUnload];
}

#pragma mark - Utils

- (BOOL)isTall {
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPhone
        && [UIScreen mainScreen].bounds.size.height == 568)
    {
        return YES;
    }
    return NO;
}


#pragma mark - UITapGestureRecognizer delegate

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    return !([touch.view isEqual:_onSwitch] || [touch.view isEqual:_offSwitch]);
}

- (void)didTapScroll:(UIGestureRecognizer *)recognizer {
    
    [self.scrollView endEditing:YES];
}


@end
