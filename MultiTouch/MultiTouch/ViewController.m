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
- (void) sendUserInputWithJson: (NSData *) json;
@end

@implementation ViewController

EventClient * eventProxy;
CGPoint prevVelocity;

- (void) sendUserInputWithJson: (NSData *) json {
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
/*
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[@"type"] = @"Swipe";
    [dict setObject: [NSNumber numberWithInteger: recognizer.numberOfTouches] forKey:@"count" ];
    
    NSError *error;
    NSData *json = [NSJSONSerialization dataWithJSONObject: dict
                                            options: 0
                                            error: &error];
    
    [self sendUserInputWithJson: json];
 */
 //[self sendUserInputWithJson: @"{\"type\": \"swipe\"}"];
}

-(void)handlePan:(UIPanGestureRecognizer *)recognizer {
    CGPoint velocity = [recognizer velocityInView: [self view]];
    
    NSLog(@"pan: %ld, vel: %f %f, num: %d",
          recognizer.state, velocity.x, velocity.y, (int) recognizer.numberOfTouches);

    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[@"type"] = @"Pan";
    //[dict setObject: [NSNumber numberWithInteger: recognizer.numberOfTouches] forKey:@"count" ];
    dict[@"count"] = [NSNumber numberWithInteger: recognizer.numberOfTouches];
    
    NSError *error;
    NSData *json = [NSJSONSerialization dataWithJSONObject: dict
                                                   options: 0
                                                     error: &error];
    
//    NSString *s = [[NSString alloc] initWithData:json encoding:NSUTF8StringEncoding];
//    NSLog(@"json: %@", s);
    
    [self sendUserInputWithJson: json];
    //[self sendUserInputWithJson: @"{\"type\": \"pan\"}"];

    float dotProd = velocity.x * prevVelocity.x + velocity.y * prevVelocity.y;
    if (dotProd < 0) {
        NSLog(@"change in direction");
    }
        
    prevVelocity = velocity;
    //int touches = (int) recognizer.numberOfTouches;
    //NSLog(@"pan: %d finger(s)", touches);
}


@end
