//
//  ViewController.m
//  DayEleven
//
//  Created by Chris Risner on 11/4/12.
//  Copyright (c) 2012 Chris Risner. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tappedSaveData:(id)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setValue:@"My saved Data" forKey:@"infoString"];
    [defaults synchronize];
}

- (IBAction)tappedLoadData:(id)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.lblInfo.text = [defaults objectForKey:@"infoString"];
}
@end
