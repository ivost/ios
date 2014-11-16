//
//  ViewController.m
//  Day12
//
//  Created by Ivo Stoyanov on 10/7/14.
//  Copyright (c) 2014 HOME. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()

@end

@implementation ViewController

NSArray *fetchedObjects;
NSManagedObject *selectedObject;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib
    self.Name.delegate = self;
    self.Email.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// dismiss keyboard when Enter is pressed
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

-(void)displayManagedObject:(NSManagedObject *)obj {
    self.Name.text = [obj valueForKey:@"name"];
    self.Email.text = [obj valueForKey:@"email"];
    //self.txtNumber.text = [(NSNumber *)[obj valueForKey:@"number"] stringValue];
//    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
//    self.Created.text = [dateFormatter stringFromDate:[obj valueForKey:@"created"]];
//    self.Updated.text = [dateFormatter stringFromDate:[obj valueForKey:@"updated"]];
}

- (IBAction)onCreate:(id)sender {
    AppDelegate * delegate = [UIApplication sharedApplication].delegate;
    NSManagedObjectContext * context = [delegate managedObjectContext];
    NSManagedObject * dataRecord = [NSEntityDescription
                                   insertNewObjectForEntityForName:@"DataRecord"
                                   inManagedObjectContext:context];

    [dataRecord setValue:self.Name.text forKey:@"name"];
    [dataRecord setValue:self.Email.text forKey:@"email"];
    //[dataRecord setValue:[NSNumber numberWithInteger:[self.txtNumber.text integerValue]] forKey:@"number"];
    [dataRecord setValue:[NSDate date] forKey:@"created"];
    [dataRecord setValue:[NSDate date] forKey:@"updated"];
    NSError *error;
    if (![context save:&error]) {
        NSLog(@"Error:%@", error);
    }
    /*
     */
    NSLog(@"Data saved");
}

- (IBAction)onUpdate:(id)sender {
}

- (IBAction)onLoad:(id)sender {
    AppDelegate * delegate = [UIApplication sharedApplication].delegate;
    NSManagedObjectContext * context = [delegate managedObjectContext];
    NSFetchRequest * req = [[NSFetchRequest alloc] init];
    NSEntityDescription * ent = [NSEntityDescription entityForName:@"DataRecord" inManagedObjectContext: context];
    [req setEntity:ent];
    NSError * error;
    fetchedObjects = [context executeFetchRequest:req error:&error];
    if (error) {
        NSLog(@"Error:%@", error);
        return;
    }
    if ([fetchedObjects count] > 0) {
        for (NSManagedObject * obj in fetchedObjects) {
            NSLog(@"Name: %@", [obj valueForKey:@"name"]);
        }
        NSManagedObject *obj = [fetchedObjects objectAtIndex:0];
        [self displayManagedObject:obj];
        selectedObject = obj;
    }
}
@end
