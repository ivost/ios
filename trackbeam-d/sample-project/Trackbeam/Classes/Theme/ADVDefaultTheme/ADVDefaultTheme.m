//
//  ADVDefaultTheme.m
//  RadioJive
//
//  Created by Valentin Filip on 7/9/12.
//  Copyright (c) 2013 AppDesignVault. All rights reserved.
//

#import "ADVDefaultTheme.h"

@implementation ADVDefaultTheme

- (UIStatusBarStyle)statusBarStyle {
    return UIStatusBarStyleDefault;
}

- (UIColor *)mainColor
{
    return nil;
}

- (UIColor *)secondColor {
    return nil;
}

- (UIColor *)navigationTextColor {
    return nil;
}

- (UIColor *)highlightColor
{
    return nil;
}

- (UIColor *)shadowColor
{
    return nil;
}


- (UIColor *)highlightShadowColor
{
    return nil;
}

- (UIColor *)navigationTextShadowColor {
    return nil;
}

- (UIFont *)navigationFont {
    return nil;
}

- (UIFont *)barButtonFont {
    return nil;
}

- (UIFont *)segmentFont {
    return nil;
}

- (UIColor *)backgroundColor
{
    return nil;
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
    return nil;
}

- (UIColor *)switchThumbColor
{
    return nil;
}

- (UIColor *)switchOnColor
{
    return nil;
}

- (UIColor *)switchTintColor
{
    return nil;
}

- (UIColor *)segmentedTintColor
{
    return nil;
}

- (CGSize)shadowOffset
{
    return CGSizeZero;
}

- (UIImage *)topShadow
{
    return nil;
}

- (UIImage *)bottomShadow
{
    return nil;
}

- (UIImage *)navigationBackgroundForBarMetrics:(UIBarMetrics)metrics
{
    return nil;
}

- (UIImage *)navigationBackgroundForIPadAndOrientation:(UIInterfaceOrientation)orientation {
    return nil;
}

- (UIImage *)barButtonBackgroundForState:(UIControlState)state style:(UIBarButtonItemStyle)style barMetrics:(UIBarMetrics)barMetrics
{
    return nil;
}

- (UIImage *)backBackgroundForState:(UIControlState)state barMetrics:(UIBarMetrics)barMetrics
{
    return nil;
}

- (UIImage *)toolbarBackgroundForBarMetrics:(UIBarMetrics)metrics
{
    return nil;
}

- (UIImage *)searchBackground
{
    return nil;
}

- (UIImage *)searchScopeBackground
{
    return nil;
}

- (UIImage *)searchFieldImage
{
    return nil;
}

- (UIImage *)searchImageForIcon:(UISearchBarIcon)icon state:(UIControlState)state
{
    return nil;
}

- (UIImage *)searchScopeButtonBackgroundForState:(UIControlState)state
{
    return nil;
}

- (UIImage *)searchScopeButtonDivider
{
    return nil;
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
    return nil;
}


- (UIImage *)tableSectionHeaderBackground {
    return nil;
}


- (UIImage *)tableFooterBackground {
    return nil;
}

- (UIImage *)viewBackground
{
    return nil;
}

- (UIImage *)viewBackgroundForOrientation:(UIInterfaceOrientation)orientation
{
    return nil;
}

- (UIImage *)viewBackgroundPattern
{
    return nil;
}

- (UIImage *)viewBackgroundTimeline
{
    return nil;
}

- (UIImage *)switchOnImage
{
    return nil;
}

- (UIImage *)switchOffImage
{
    return nil;
}

- (UIImage *)switchOnIcon
{
    return nil;
}

- (UIImage *)switchOffIcon
{
    return nil;
}

- (UIImage *)switchTrack
{
    return nil;
}

- (UIImage *)switchThumbForState:(UIControlState)state {
    return nil;
}

- (UIImage *)sliderThumbForState:(UIControlState)state
{
    return nil;
}

- (UIImage *)sliderMinTrack
{
    return nil;
}

- (UIImage *)sliderMaxTrack
{
    return nil;
}

- (UIImage *)sliderMinTrackDouble
{
    return nil;
}

- (UIImage *)sliderMaxTrackDouble
{
    return nil;
}

- (UIImage *)progressTrackImage
{
    return nil;
}

- (UIImage *)progressProgressImage
{
    return nil;
}

- (UIImage *)progressPercentTrackImage
{
    return nil;
}

- (UIImage *)progressPercentProgressImage
{
    return nil;
}

- (UIImage *)progressPercentProgressValueImage {
    return nil;
}

- (UIImage *)stepperBackgroundForState:(UIControlState)state
{
    return nil;
}

- (UIImage *)stepperDividerForState:(UIControlState)state
{
    return nil;
}

- (UIImage *)stepperIncrementImage
{
    return nil;
}

- (UIImage *)stepperDecrementImage
{
    return nil;
}

- (UIImage *)buttonBackgroundForState:(UIControlState)state
{
    return nil;
}

- (UIImage *)tabBarBackground
{
    return nil;
}

- (UIImage *)tabBarSelectionIndicator
{
    return nil;
}

- (UIImage *)imageForTab:(SSThemeTab)tab
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
    return (name ? [UIImage imageNamed:name] : nil);
}

- (UIImage *)finishedImageForTab:(SSThemeTab)tab selected:(BOOL)selected
{
    return nil;
}

@end
