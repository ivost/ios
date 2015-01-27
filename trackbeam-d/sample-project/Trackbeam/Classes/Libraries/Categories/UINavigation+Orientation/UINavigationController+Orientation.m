//
//  UINavigationController+Orientation.m
//  cardio_new
//
//  Created by Valentin Filip on 11/14/12.
//
//

#import "UINavigationController+Orientation.h"

@implementation UINavigationController (Orientation)

-(BOOL)shouldAutorotate
{
    return [[self.viewControllers lastObject] shouldAutorotate];
}

-(NSUInteger)supportedInterfaceOrientations
{
    return [[self.viewControllers lastObject] supportedInterfaceOrientations];
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    UIInterfaceOrientation childOrientation  = [[self.viewControllers lastObject] preferredInterfaceOrientationForPresentation];
    return childOrientation ? childOrientation : UIInterfaceOrientationPortrait;
}

@end
