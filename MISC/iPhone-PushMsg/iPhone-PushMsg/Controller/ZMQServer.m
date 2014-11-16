//
//  ZMQServer.m
//  iPhone-InsulinPump
//
//  Created by David Black on 07/04/2014.
//  Copyright (c) 2014 David Black. All rights reserved.
//

#import "ZMQServer.h"

@implementation ZMQServer

@synthesize delegate;

@synthesize testContext;
@synthesize testPull;

- (void) openZMQ {
 
    self.testContext = [[ZMQContext alloc] initWithIOThreads:1U];
 
    self.testPull = [self.testContext socketWithType:ZMQ_PULL];
 
    if(![self.testPull connectToEndpoint:@"tcp://127.0.0.1:3001"]) {
  
      NSLog(@"Error connecting to the End Point");
  
      return;
  
     }
 
}

- (void)waitForMessage {
 
 __block NSString *stringMsg;
 
 dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0),
   ^{
    
    stringMsg = [NSString stringWithFormat:@"%s",[[self.testPull receiveDataWithFlags:0] bytes]];
    
    dispatch_async(dispatch_get_main_queue(), ^{
     
         [delegate recievedMessage:stringMsg];
     
    });
    
   });
 
}

- (void) closeZMQ {
 
       [testPull close];
 
}

@end
