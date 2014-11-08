//
//  ViewController.m
//  MultiTouch
//
//  Created by Ivo Stoyanov on 11/8/14.
//  Copyright (c) 2014 HOME. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

CGPoint prevVelocity;

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
}

-(void)handlePan:(UIPanGestureRecognizer *)recognizer {
    CGPoint velocity = [recognizer velocityInView: [self view]];
    
    NSLog(@"pan: %ld, vel: %f %f, num: %d",
          recognizer.state, velocity.x, velocity.y, (int) recognizer.numberOfTouches);
    float dotProd = velocity.x * prevVelocity.x + velocity.y * prevVelocity.y;
    if (dotProd < 0) {
        NSLog(@"change in direction");
    }
        
    prevVelocity = velocity;
    //int touches = (int) recognizer.numberOfTouches;
    //NSLog(@"pan: %d finger(s)", touches);
}


@end
