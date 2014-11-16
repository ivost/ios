//
//  ViewController.h
//  iPhone-PushMsg
//
//  Created by David Black on 01/07/2014.
//  Copyright (c) 2014 David Black. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "ZMQServer.h"

@interface ViewController : UIViewController <ZMQServerDelegate>

@property(weak, nonatomic)IBOutlet UILabel *textLabel;
@property(strong, nonatomic) ZMQServer *testServer;

@end
