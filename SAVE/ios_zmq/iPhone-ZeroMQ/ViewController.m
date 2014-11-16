//
//  ViewController.m
//  iPhone-ZeroMQ
//
//  Created by David Black on 12/03/2014.
//  Copyright (c) 2014 David Black. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

//@synthesize textLabel;


-(NSInteger)convertStringToInteger:(const char *) num{
 
   // Convert from string to NSString
 
   NSString *value = [NSString stringWithUTF8String:num];
 
   // Get the length of the NSString
 
   NSUInteger stringLength = [value length];
 
   // Extract the integers from the NSString
 
   NSString *intString = [value substringWithRange:NSMakeRange(8, (stringLength - 8))];
 
   // Convert sub NSString to a number using literals
 
   NSNumber *number = @([intString intValue]);
 
   // Convert NSNumber to NSInteger and return
 
   return [number integerValue];
 
}

ZMQContext *context;
ZMQSocket *sock;

- (void)viewDidLoad
{
    NSLog(@"View Loaded... ");

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        context = [[ZMQContext alloc] initWithIOThreads:1U];
        sock = [context socketWithType:ZMQ_PUB];
        //sock = [context socketWithType:ZMQ_REQ];
        
        if(![sock connectToEndpoint:@"tcp://10.0.1.197:5556"]) {
            NSLog(@"Connect error");
            return;
        }
        NSLog(@"connected");
        // zmq needs small delay to avoid message loss during connection
        sleep(1);

        char msg[100] = "HELLO";
        //NSData * resp;
        for (int i=0; i<10; i++) {
            NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
            NSData *msgd = [NSData dataWithBytes:msg length:strlen(msg)];
            //sleep(1);
            [sock sendData: msgd withFlags:0];
            NSLog(@"message sent");
            
            //resp = [[sock receiveDataWithFlags:0] bytes];
            //NSLog(@"response received %@", resp);
            
            [pool drain];
        }
        
    });
    [super viewDidLoad];
}
    
/***
  self.textLabel.text = @"Hello World";
 
 // Get messages from the server on another thread
 
 __block NSString *stringValue; // value that will returned to the main thread
 
 dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
  
  ZMQContext *context = [[ZMQContext alloc] initWithIOThreads:1U];
  
  ZMQSocket *subscriber = [context socketWithType:ZMQ_SUB];
  
  if(![subscriber connectToEndpoint:@"tcp://127.0.0.1:2001"]) {
   
   NSLog(@"Error subscribing to the End Point");
   
   return;
  }
  
  const char *nameSubscribed = "PRIME";
  
  NSData *filterData = [NSData dataWithBytes:nameSubscribed length:strlen(nameSubscribed)];
  
  [subscriber setData:filterData forOption:ZMQ_SUBSCRIBE];
 
  NSInteger myInteger = [self convertStringToInteger:[[subscriber receiveDataWithFlags:0] bytes]];
  
  // Add the next 14 prime numbers
  
  for (int i = 0; i < 15; i++) {
   
   myInteger = myInteger + [self convertStringToInteger:[[subscriber receiveDataWithFlags:0] bytes]];
   
  }
  
  NSLog(@"Integer = %ld", (long)myInteger);
  
  // Convert NSInteger to NSString ready to display
  
  NSString *string = @(myInteger).stringValue; // Using literals for converstion
  
  stringValue = string;
  
  // Close the connection to the server
  
  [subscriber close];
  
  dispatch_async(dispatch_get_main_queue(), ^{
   
   // Return to the main thread so that tha UILabel text can be updated

   self.textLabel.text = stringValue;

  });
 
});
 [super viewDidLoad];
 }
 **/

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
