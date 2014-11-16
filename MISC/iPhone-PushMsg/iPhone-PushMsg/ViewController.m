//
//  ViewController.m
//  iPhone-PushMsg
//
//  Created by David Black on 01/07/2014.
//  Copyright (c) 2014 David Black. All rights reserved.
//


#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize textLabel;


- (void)viewDidLoad
{
 [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
 
 self.textLabel.text = @"App: Hello World";
 
 self.testServer = [[ZMQServer alloc] init];
 
 self.testServer.delegate = self;
 
 [self.testServer openZMQ];
 
 [self.testServer waitForMessage];
 
 
}

- (void)didReceiveMemoryWarning
{
 [super didReceiveMemoryWarning];
 // Dispose of any resources that can be recreated.
}

#pragma mark - ZMQServer

- (void)recievedMessage:(NSString *)msg{
 
 NSLog(@"Returned to the app %@", msg);
 
 self.textLabel.text = msg;
 
 [self.testServer waitForMessage];  // return to background and wait for the next message
 
 
}

@end
