//
//  ADVCustomTheme.m
//  
//
//  Created by Valentin Filip on 7/9/12.
//  Copyright (c) 2013 AppDesignVault. All rights reserved.
//

#import "ADVCustomTheme.h"
#import "AppDelegate.h"

@implementation ADVCustomTheme

- (UIStatusBarStyle)statusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (UIColor *)mainColor {
    return [UIColor colorWithWhite:0.3 alpha:1.0];
}

- (UIColor *)secondColor {
    return [UIColor colorWithRed:1.00f green:1.00f blue:1.00f alpha:1.00f];
}

- (UIColor *)navigationTextColor {
    return [UIColor colorWithRed:1.00f green:1.00f blue:1.00f alpha:1.00f];
}

- (UIColor *)highlightColor
{
    return [UIColor colorWithRed:0.63f green:0.71f blue:0.78f alpha:1.00f];
}

- (UIColor *)shadowColor
{
    return nil;
}

- (UIColor *)highlightShadowColor
{
    return [UIColor colorWithRed:0.16f green:0.20f blue:0.38f alpha:1.00f];
}

- (UIColor *)navigationTextShadowColor {
    return [UIColor whiteColor];
}

- (UIFont *)navigationFont {
    return [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone
            ? [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:24.0f]
            : [UIFont fontWithName:@"HelveticaNeue-Light" size:26.0f];
}

- (UIFont *)barButtonFont {
    return [UIFont fontWithName:@"HelveticaNeue-Light" size:15.0f];
}


- (UIFont *)segmentFont {
    return [UIFont fontWithName:@"ProximaNova-Semibold" size:13.0f];
}

- (UIColor *)backgroundColor
{
    return [UIColor colorWithRed:0.33f green:0.34f blue:0.38f alpha:1.00f];
}

- (UIColor *)baseTintColor
{
    return nil;
}

- (UIColor *)accentTintColor
{
    return nil;
}

- (UIColor *)selectedTabbarItemTintColor
{
    return [UIColor colorWithRed:0.50f green:0.84f blue:0.06f alpha:1.00f];
}

- (UIColor *)switchThumbColor
{
    return [UIColor colorWithRed:0.87f green:0.87f blue:0.89f alpha:1.00f];
}

- (UIColor *)switchOnColor
{
    return [UIColor colorWithRed:0.16f green:0.65f blue:0.51f alpha:1.00f];
}

- (UIColor *)switchTintColor
{
    return [UIColor colorWithRed:0.86f green:0.86f blue:0.86f alpha:1.00f];
}

- (UIColor *)segmentedTintColor
{
    return [UIColor whiteColor];
}

- (CGSize)shadowOffset
{
    return CGSizeMake(0, 0);
}

- (UIImage *)topShadow
{
    return nil;
}

- (UIImage *)bottomShadow
{
    return [UIImage imageNamed:@"bottomShadow"];
}

- (UIImage *)navigationBackgroundForBarMetrics:(UIBarMetrics)metrics
{
    NSString *name = @"navigationBackground";
    if (metrics == UIBarMetricsLandscapePhone) {
        name = [name stringByAppendingString:@"Landscape"];
    }
    UIImage *image = [UIImage imageNamed:name];
    image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(10.0, 8.0, 10.0, 8.0)];
    
    CGFloat height = 64;
    CGFloat width = [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone ? 320 : (metrics == UIBarMetricsLandscapePhone ? 1024 : 768);
    UIImage *bottomImage = metrics == UIBarMetricsLandscapePhone ? [self viewBackgroundForOrientation:UIInterfaceOrientationLandscapeLeft] : [self viewBackground];
    
    CGSize newSize = CGSizeMake(width, height);
    UIGraphicsBeginImageContext( newSize );
    
    [bottomImage drawInRect:CGRectMake(0, 0, newSize.width, bottomImage.size.height)];
    
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height) blendMode:kCGBlendModeNormal alpha:1];
    image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
}

- (UIImage *)navigationBackgroundForIPadAndOrientation:(UIInterfaceOrientation)orientation {
    NSString *name = @"navigationBackgroundRight";
    if (UIInterfaceOrientationIsLandscape(orientation)) {
        name = [name stringByAppendingString:@"Landscape"];
    }
    UIImage *image = [UIImage imageNamed:name];
    image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(0.0, 8.0, 0.0, 8.0)];
    return image;
}

- (UIImage *)barButtonBackgroundForState:(UIControlState)state style:(UIBarButtonItemStyle)style barMetrics:(UIBarMetrics)barMetrics
{
    NSString *name = @"barButton";
    if (style == UIBarButtonItemStyleDone) {
        name = [name stringByAppendingString:@"Done"];
    }
    if (barMetrics == UIBarMetricsLandscapePhone) {
        name = [name stringByAppendingString:@"Landscape"];
    }
    if (state == UIControlStateHighlighted) {
        name = [name stringByAppendingString:@"Highlighted"];
    }
    UIImage *image = [UIImage imageNamed:name];
    image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(0.0, 5.0, 0.0, 5.0)];
    return image;
}

- (UIImage *)backBackgroundForState:(UIControlState)state barMetrics:(UIBarMetrics)barMetrics
{
    NSString *name = @"backButton";
    if (barMetrics == UIBarMetricsLandscapePhone) {
        name = [name stringByAppendingString:@"Landscape"];
    }
    if (state == UIControlStateHighlighted) {
        name = [name stringByAppendingString:@"Highlighted"];
    }
    UIImage *image = [UIImage imageNamed:name];
    image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(0.0, 17.0, 0.0, 5.0)];
    return image;
}

- (UIImage *)toolbarBackgroundForBarMetrics:(UIBarMetrics)metrics
{
    NSString *name = @"toolbarBackground";
    if (metrics == UIBarMetricsLandscapePhone) {
        name = [name stringByAppendingString:@"Landscape"];
    }
    UIImage *image = [UIImage imageNamed:name];
    image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(0.0, 8.0, 0.0, 8.0)];
    return image;
}

- (UIImage *)searchBackground
{
    return [UIImage imageNamed:@"searchBackground"];
}


- (UIImage *)searchScopeBackground
{
    UIImage *scopeBg = [UIImage imageNamed:@"searchScopeBackground"];
    return scopeBg ? scopeBg : [self searchBackground];
}

- (UIImage *)searchFieldImage
{
    UIImage *image = [UIImage imageNamed:@"searchField"];
    image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(0.0, 16.0, 0.0, 16.0)];
    return image;
}

- (UIImage *)searchScopeButtonBackgroundForState:(UIControlState)state
{
    NSString *name = @"searchScopeButton";
    if (state == UIControlStateSelected) {
        name = [name stringByAppendingString:@"Selected"];
    }
    UIImage *image = [UIImage imageNamed:name];
    image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(6.0, 6.0, 6.0, 6.0)];
    return image;
}

- (UIImage *)searchScopeButtonDivider
{
    return [UIImage imageNamed:@"searchScopeButtonDivider"];
}

- (UIImage *)searchImageForIcon:(UISearchBarIcon)icon state:(UIControlState)state
{
    NSString *name;
    if (icon == UISearchBarIconSearch) {
        name = @"searchIconSearch";
    } else if (icon == UISearchBarIconClear) {
        name = @"searchIconClear";
        if (state == UIControlStateHighlighted) {
            name = [name stringByAppendingString:@"Highlighted"];
        }
    }
    return (name ? [UIImage imageNamed:name] : nil);
}

- (UIImage *)segmentedBackgroundForState:(UIControlState)state barMetrics:(UIBarMetrics)barMetrics;
{
    return nil;
}

- (UIImage *)segmentedDividerForBarMetrics:(UIBarMetrics)barMetrics
{
    return nil;
}

- (UIImage *)tableBackground
{
    
    UIImage *image = [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone ? [UIImage imageNamed:@"background-568h"] : [UIImage imageNamed:@"background"];
    
    image = [image resizableImageWithCapInsets:UIEdgeInsetsZero];
    return image;
}

- (UIImage *)tableSectionHeaderBackground {
    UIImage *image = [UIImage imageNamed:@"list-section-header-bg"];
    image = [image resizableImageWithCapInsets:UIEdgeInsetsZero];
    return image;
}


- (UIImage *)tableFooterBackground {
    UIImage *image = [UIImage imageNamed:@"list-footer-bg"];
    image = [image resizableImageWithCapInsets:UIEdgeInsetsZero];
    return image;
}

- (UIImage *)viewBackground
{
    UIImage *image = [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone ? [UIImage imageNamed:@"background-568h"] : [UIImage imageNamed:@"background"];
 
    image = [image resizableImageWithCapInsets:UIEdgeInsetsZero];
    return image;
}


- (UIImage *)viewBackgroundForOrientation:(UIInterfaceOrientation)orientation
{
    UIImage *image;
    if (UIInterfaceOrientationIsPortrait(orientation)) {
        image = [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone ? [UIImage imageNamed:@"background-568h"] : [UIImage imageNamed:@"background"];
    } else {
        image = [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone ? [UIImage imageNamed:@"backgroundLandscape-568h"] : [UIImage imageNamed:@"backgroundLandscape"];
    }
    
    image = [image resizableImageWithCapInsets:UIEdgeInsetsZero];
    return image;
}

- (UIImage *)viewBackgroundPattern
{
    UIImage *image = [UIImage imageNamed:@"backgroundMenu"];
    image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10)];
    return image;
}


- (UIImage *)viewBackgroundTimeline
{
    UIImage *image = [UIImage imageNamed:@"background-timeline"];
    image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(10, 30, 10, 10)];
    return image;
}

- (UIImage *)switchOnImage
{
    return [[UIImage imageNamed:@"switchOnBackground"]
            resizableImageWithCapInsets:UIEdgeInsetsMake(0, 20, 0, 20)];
}

- (UIImage *)switchOffImage
{
    return [[UIImage imageNamed:@"switchOffBackground"]
            resizableImageWithCapInsets:UIEdgeInsetsMake(5, 20, 5, 20)];
}

- (UIImage *)switchOnIcon
{
    return [UIImage imageNamed:@"switchOnIcon"];
}

- (UIImage *)switchOffIcon
{
    return [UIImage imageNamed:@"switchOffIcon"];
}

- (UIImage *)switchTrack
{
    return [UIImage imageNamed:@"switchTrack"];
}

- (UIImage *)switchThumbForState:(UIControlState)state {
    NSString *name = @"switchHandle";
    if (state == UIControlStateHighlighted) {
        name = [name stringByAppendingString:@"Highlighted"];
    }
    return [UIImage imageNamed:name];
}

- (UIImage *)sliderThumbForState:(UIControlState)state
{
    NSString *name = @"sliderThumb";
    if (state == UIControlStateHighlighted) {
        name = [name stringByAppendingString:@"Highlighted"];
    } else if (state == UIControlStateReserved) {
        name = [name stringByAppendingString:@"-small"];
    }
    return [UIImage imageNamed:name];
}

- (UIImage *)sliderMinTrack
{
    UIImage *image = [UIImage imageNamed:@"sliderMinTrack"];
    image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(0.0, 5, 0.0, 5)];
    return image;
}

- (UIImage *)sliderMaxTrack
{
    UIImage *image = [UIImage imageNamed:@"sliderMaxTrack"];
    image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(0.0, 5, 0.0, 5)];
    return image;
}

- (UIImage *)sliderMinTrackDouble
{
    UIImage *image = [UIImage imageNamed:@"sliderMinTrack"];
    image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(0.0, 5, 0.0, 5)];
    return image;
}

- (UIImage *)sliderMaxTrackDouble
{
    UIImage *image = [UIImage imageNamed:@"sliderMaxTrack"];
    image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(0.0, 5, 0.0, 5)];
    return image;
}

- (UIImage *)progressTrackImage
{
    UIImage *image = [UIImage imageNamed:@"progress-segmented-track"];
    return image;
}

- (UIImage *)progressProgressImage
{
    UIImage *image = [UIImage imageNamed:@"progress-segmented-fill"];
    image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(0, 10, 0, 10)];
    return image;
}

- (UIImage *)progressPercentTrackImage
{
    UIImage *image = [UIImage imageNamed:@"progressTrack"];
    image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(0.0, 5, 0.0, 5)];
    return image;
}

- (UIImage *)progressPercentProgressImage
{
    UIImage *image = [UIImage imageNamed:@"progressProgress"];
    image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(0.0, 5, 0.0, 5)];
    return image;
}

- (UIImage *)progressPercentProgressValueImage {
    UIImage *image = [UIImage imageNamed:@"progressValue"];
    return image;
}

- (UIImage *)stepperBackgroundForState:(UIControlState)state
{
    NSString *name = @"stepperBackground";
    if (state == UIControlStateHighlighted) {
        name = [name stringByAppendingString:@"Highlighted"];
    } else if (state == UIControlStateDisabled) {
        name = [name stringByAppendingString:@"Disabled"];
    }
    UIImage *image = [UIImage imageNamed:name];
    image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(0.0, 13.0, 0.0, 13.0)];
    return image;
}

- (UIImage *)stepperDividerForState:(UIControlState)state
{
    NSString *name = @"stepperDivider";
    if (state == UIControlStateHighlighted) {
        name = [name stringByAppendingString:@"Highlighted"];
    }
    return [UIImage imageNamed:name];
}

- (UIImage *)stepperIncrementImage
{
    return [UIImage imageNamed:@"stepperIncrement"];
}

- (UIImage *)stepperDecrementImage
{
    return [UIImage imageNamed:@"stepperDecrement"];
}

- (UIImage *)buttonBackgroundForState:(UIControlState)state
{
    NSString *name = @"button";
    if (state == UIControlStateHighlighted) {
        name = [name stringByAppendingString:@"Highlighted"];
    } else if (state == UIControlStateDisabled) {
        name = [name stringByAppendingString:@"Disabled"];
    }
    UIImage *image = [UIImage imageNamed:name];
    image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(0.0, 16.0, 0.0, 16.0)];
    return image;
}

- (UIImage *)tabBarBackground
{
    
    UIImage *bottomImage = [self viewBackground];
    UIImage *image       = [[UIImage imageNamed:@"tabBarBackground"] resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10)];
    
    CGSize newSize = CGSizeMake(320, 45);
    UIGraphicsBeginImageContext( newSize );
    
    UIWindow *window = [AppDelegate sharedDelegate].window;
    CGFloat padding;
    if(UIInterfaceOrientationIsLandscape(window.rootViewController.interfaceOrientation)) {
        padding = bottomImage.size.height - (bottomImage.size.height - CGRectGetMaxX(window.frame) + 45);
    } else {
        padding = bottomImage.size.height - (CGRectGetMaxY(window.frame) - bottomImage.size.height + 45);
    }
    [bottomImage drawInRect:CGRectMake(0, -padding, newSize.width, bottomImage.size.height)];
    
    
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height) blendMode:kCGBlendModeNormal alpha:1];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newImage;
}

- (UIImage *)tabBarSelectionIndicator
{
    return [UIImage imageNamed:@"tabBarSelectionIndicator"];
}

- (UIImage *)imageForTab:(SSThemeTab)tab
{
    return nil;
}

- (UIImage *)finishedImageForTab:(SSThemeTab)tab selected:(BOOL)selected
{
    NSString *name = nil;
    if (tab == SSThemeTabSecure) {
        name = @"tabbar-tab1";
    } else if (tab == SSThemeTabDocs) {
        name = @"tabbar-tab2";
    } else if (tab == SSThemeTabBugs) {
        name = @"tabbar-tab3";
    } else if (tab == SSThemeTabBook) {
        name = @"tabbar-tab4";
    } else if (tab == SSThemeTabOptions) {
        name = @"tabbar-tab5";
    }
//    if (selected) {
//        name = [name stringByAppendingString:@"-selected"];
//    }
    return (name ? [UIImage imageNamed:name] : nil);
}


@end
