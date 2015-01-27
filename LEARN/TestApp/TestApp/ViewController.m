//
//  ViewController.m
//  TestApp
//
//  Created by Ivo Stoyanov on 1/27/15.
//  Copyright (c) 2015 s1nn. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (IBAction)onCLick:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ViewController

int clickCount = 0;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onCLick:(id)sender {
    clickCount++;
    self.label.text = [NSString stringWithFormat: @"Clicked: %d times", clickCount];
    [self.label sizeToFit];
}
@end
