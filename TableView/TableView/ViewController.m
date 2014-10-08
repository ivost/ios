//
//  ViewController.m
//  TableView
//
//  Created by Ivo Stoyanov on 10/8/14.
//  Copyright (c) 2014 HOME. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
int MAX_ITEMS = 100;
NSMutableArray * items;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    items = [[NSMutableArray alloc] init];
    for (int idx = 0; idx < MAX_ITEMS; idx++) {
        NSDictionary * item = @{ @"name": [NSString stringWithFormat:@"Item %d", idx],
                                 @"id": [NSNumber numberWithInt:idx]};
        [items addObject:item];
    }
    NSLog(@"Loaded %ld items", (long) [items count]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

#pragma mark - tableView delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [items count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    NSDictionary * item = [items objectAtIndex:[indexPath row]];
    cell.textLabel.text = [item objectForKey:@"name"];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"Row tapped at %li", (long)[indexPath row]);
}

@end
