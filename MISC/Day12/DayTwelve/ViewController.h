//
//  ViewController.h
//  DayTwelve
//
//  Created by Chris Risner on 11/5/12.
//  Copyright (c) 2012 Chris Risner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>

//@property (nonatomic,strong) NSManagedObjectContext* managedObjectContext;

@property (weak, nonatomic) IBOutlet UITextField *txtName;
@property (weak, nonatomic) IBOutlet UITextField *txtInfo;
@property (weak, nonatomic) IBOutlet UITextField *txtNumber;
@property (weak, nonatomic) IBOutlet UILabel *lblCreateDate;
@property (weak, nonatomic) IBOutlet UILabel *lblUpdateDate;
- (IBAction)tappedSaveAsNew:(id)sender;
- (IBAction)tappedLoadData:(id)sender;
- (IBAction)tappedNext:(id)sender;
- (IBAction)tappedPrevious:(id)sender;

@end