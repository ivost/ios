//
//  ViewController.h
//  DayEleven
//
//  Created by Chris Risner on 11/4/12.
//  Copyright (c) 2012 Chris Risner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
- (IBAction)tappedSaveData:(id)sender;
- (IBAction)tappedLoadData:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *lblInfo;

@end
