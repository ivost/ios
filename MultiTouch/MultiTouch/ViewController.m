//
//  ViewController.m
//  MultiTouch
//
//  Created by Ivo Stoyanov on 11/8/14.
//  Copyright (c) 2014 HOME. All rights reserved.
//

#import "ViewController.h"

#import <S1Msg/EventClient.h>

@interface ViewController ()
- (void) sendUserInputWithJson: (NSString *) json;
@end

@implementation ViewController

EventClient * eventProxy;
CGPoint prevVelocity;

- (void) sendUserInputWithJson: (NSString *) json {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        [eventProxy sendEventWithId:909 data:json];
    });
}

- (void)viewDidLoad {
    [super viewDidLoad];
 
//    for (int i=0; i<5; i++) {
//        UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc]
//                                           initWithTarget:self action:@selector(handleSwipe:)];
//        [swipe setDirection:UISwipeGestureRecognizerDirectionLeft];
//        [swipe setDelaysTouchesBegan:YES];
//        swipe.numberOfTouchesRequired = i;
//        [[self view] addGestureRecognizer:swipe];
//    }

        eventProxy = [[EventClient alloc] initWithEndpoint:@"tcp://10.0.1.101:8899"];
    
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]
                                           initWithTarget:self action:@selector(handlePan:)];
        //[pan setDirection:UISwipeGestureRecognizerDirectionLeft];
        [pan setDelaysTouchesBegan:YES];
        //pan.numberOfTouchesRequired = i;
        [[self view] addGestureRecognizer:pan];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)handleSwipe:(UISwipeGestureRecognizer *)recognizer {
    int touches = (int) recognizer.numberOfTouches;
    NSLog(@"swipe: %d finger(s)", touches);
    [self sendUserInputWithJson: @"{\"type\": \"swipe\"}"];
    
}

-(void)handlePan:(UIPanGestureRecognizer *)recognizer {
    CGPoint velocity = [recognizer velocityInView: [self view]];
    
    NSLog(@"pan: %ld, vel: %f %f, num: %d",
          recognizer.state, velocity.x, velocity.y, (int) recognizer.numberOfTouches);

    [self sendUserInputWithJson: @"{\"type\": \"pan\"}"];

    float dotProd = velocity.x * prevVelocity.x + velocity.y * prevVelocity.y;
    if (dotProd < 0) {
        NSLog(@"change in direction");
    }
        
    prevVelocity = velocity;
    //int touches = (int) recognizer.numberOfTouches;
    //NSLog(@"pan: %d finger(s)", touches);
}


@end
