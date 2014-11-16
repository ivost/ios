//
//  ViewController.h
//  Day12
//
//  Created by Ivo Stoyanov on 10/7/14.
//  Copyright (c) 2014 HOME. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>

//@property (strong, nonatomic) NSManagedObjectContext * context;

@property (weak, nonatomic) IBOutlet UITextField *Name;
@property (weak, nonatomic) IBOutlet UITextField *Email;

- (IBAction)onCreate:(id)sender;
- (IBAction)onUpdate:(id)sender;
- (IBAction)onLoad:(id)sender;

@end

