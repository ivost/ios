//
//  ViewController.m
//  Cards
//
//  Created by Ivo Stoyanov on 1/17/15.
//  Copyright (c) 2015 s1nn. All rights reserved.
//

#import "ViewController.h"

#import "Card.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSLog(@"view did load");
    
    Card * card = [[Card alloc] init];
    
    [card setContents: @"Ace"];
    [card setChosen: YES];
    
    NSLog(@"card: %@", card.contents);
    
    NSLog(@"card: %@, chosen: %d", [card contents], [card isChosen]);
    
    Card * card2 = [[Card alloc] init];
 
    card2.contents = @"King";

    NSLog(@"card2: %@, chosen: %d", card2.contents, card2.isChosen);
    
    Card * card3 = [[Card alloc] init];
    card3.contents = @"Ace";
    
    NSLog(@"%@ matches %@: %d", card.contents, card2.contents, [card match: card2]);

    NSLog(@"%@ matches %@: %d", card.contents, card3.contents, [card match: card3]);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
