//
//  CachedLinearInterp.m
//  FingerPaint
//
//  Created by Ivo Stoyanov on 11/8/14.
//  Copyright (c) 2014 HOME. All rights reserved.
//

#import "CachedLinearInterp.h"

@implementation CachedLinearInterp {
    UIBezierPath *path;
    // offscreen image buffer
    UIImage * image;
}

- (id) initWithCoder:(NSCoder *)aDecoder {
    NSLog(@"INIT 1.0");

    if (self = [super initWithCoder: aDecoder]) {
        [self setMultipleTouchEnabled:NO];
        [self setBackgroundColor: [UIColor whiteColor]];
        path = [UIBezierPath bezierPath];
        [path setLineWidth: 2.0];
    }
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc]
                                          initWithTarget: self action:@selector(doSingleTap:)];
    singleTap.numberOfTapsRequired = 1;
    [self addGestureRecognizer:singleTap];
    
    // clear on double tap
    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc]
                                          initWithTarget: self action:@selector(doDoubleTap:)];
    doubleTap.numberOfTapsRequired = 2;
    [self addGestureRecognizer:doubleTap];
    
    
    return self;
}

-(void)doSingleTap:(UITapGestureRecognizer *)tapGestureRecognizer{
    //NSLog(@"single tap");
}

// clear on double tap
-(void)doDoubleTap:(UITapGestureRecognizer *)tapGestureRecognizer{
    //NSLog(@"Clear image");
    [path removeAllPoints];
    image = nil;
    [self drawBitmap];
    [self setNeedsDisplay];
}


- (void) drawRect:(CGRect)rect {
    [image drawInRect: rect];
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
    UITouch *touch = [touches anyObject];
    CGPoint p = [touch locationInView:self];
    //NSLog(@"ended");
    [path addLineToPoint:p]; // (4)
    [self drawBitmap];
    [self setNeedsDisplay];
    [path removeAllPoints];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    //NSLog(@"cancel");
    //[self touchesEnded:touches withEvent:event];
    [self drawBitmap];
    [self setNeedsDisplay];
    [path removeAllPoints];
}

- (void)drawBitmap // (3)
{
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, YES, 0.0);
    [[UIColor blackColor] setStroke];
    if (!image) // first draw; paint background white by ...
    {
        // enclosing bitmap by a rectangle defined by another UIBezierPath object
        UIBezierPath *rectpath = [UIBezierPath bezierPathWithRect:self.bounds];
        [[UIColor whiteColor] setFill];
        [rectpath fill]; // filling it with white
    }
    [image drawAtPoint:CGPointZero];
    [path stroke];
    image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
}

@end
