//
//  ViewController.h
//  Day7
//
//  Created by Chris Risner on 10/18/12.
//  Copyright (c) 2012 Chris Risner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <NSURLConnectionDelegate> {
    NSMutableData* _receivedData;
}
@property (weak, nonatomic) IBOutlet UITextField *txtName;
@property (weak, nonatomic) IBOutlet UILabel *lblData;

- (IBAction)btnFetchData1:(id)sender;
- (IBAction)txtFetchData2:(id)sender;

@end

