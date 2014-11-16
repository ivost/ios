//
//  ZMQServer.h
//  iPhone-InsulinPump
//
//  Created by David Black on 07/04/2014.
//  Copyright (c) 2014 David Black. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UniversaliOS/zmq.h>
#import "ZMQObjC.h"

@class ZMQServer;

@protocol ZMQServerDelegate <NSObject>

- (void) recievedMessage:(NSString *)msg;

@end

@interface ZMQServer : NSObject

@property(assign, nonatomic)id<ZMQServerDelegate>delegate;
@property(strong, nonatomic) __block ZMQContext *testContext;
@property(strong, nonatomic) __block ZMQSocket *testPull;

- (void) openZMQ;
- (void) waitForMessage;
- (void) closeZMQ;

@end
