//
//  ViewController.m
//  TestZMQiOS
//
//  Created by Ivo Stoyanov on 11/16/14.
//  Copyright (c) 2014 ivo. All rights reserved.
//

#import "ViewController.h"

#import <ZMQiOS/ZMQiOS.h>

@interface ViewController ()

@end

@implementation ViewController

ZMQContext *context;
ZMQSocket *sock;

EventClient * client;

- (void)viewDidLoad {
    [super viewDidLoad];


    NSLog(@"View Loaded... ");
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{

        client = [[EventClient alloc] initWithEndpoint:@"tcp://10.0.1.101:8899"];
    
        [client sendEventWithId:909 data:@"Hello"];
        [client sendEventWithId:909 data:@"Hello 1234567890 1234567890"];
        [client sendEventWithId:909 data:@"Hello 1234567890 1234567890 ******"];
        
//        context = [[ZMQContext alloc] initWithIOThreads:1U];
//        sock = [context socketWithType:ZMQ_PUB];
//        //sock = [context socketWithType:ZMQ_REQ];
//        
//
//        if(![sock connectToEndpoint:@"tcp://10.0.1.101:5556"]) {
//            NSLog(@"Connect error");
//            return;
//        }
//        NSLog(@"connected");
//        // zmq needs small delay to avoid message loss during connection
//        sleep(1);
//        
//        char msg[100] = "HELLO";
//        //NSData * resp;
//        for (int i=0; i<10; i++) {
//            NSData *msgd = [NSData dataWithBytes:msg length:strlen(msg)];
//            //sleep(1);
//            [sock sendData: msgd withFlags:0];
//            NSLog(@"message sent");
//        }
        
    });


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
