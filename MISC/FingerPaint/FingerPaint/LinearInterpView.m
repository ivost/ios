//
//  LinearInterpView.m
//  FingerPaint
//
//  Created by Ivo Stoyanov on 11/8/14.
//  Copyright (c) 2014 HOME. All rights reserved.
//

#import "LinearInterpView.h"

@implementation LinearInterpView {
    UIBezierPath *path;
}

- (id) initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder: aDecoder]) {
        [self setMultipleTouchEnabled:NO];
        [self setBackgroundColor: [UIColor grayColor]];
        path = [UIBezierPath bezierPath];
        [path setLineWidth: 2.0];
    }
    return self;
}


- (void) drawRect:(CGRect)rect {
    // Drawing code
    [[UIColor blueColor] setStroke];
    [path stroke];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint p = [touch locationInView:self];
    [path moveToPoint:p];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint p = [touch locationInView:self];
    [path addLineToPoint:p]; // (4)
    [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self touchesMoved:touches withEvent:event];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self touchesEnded:touches withEvent:event];
}

@end
