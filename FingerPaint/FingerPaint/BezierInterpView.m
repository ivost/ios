//
//  BezierInterpView.m
//  FingerPaint
//
//  Created by Ivo Stoyanov on 11/8/14.
//  Copyright (c) 2014 HOME. All rights reserved.
//

#import "BezierInterpView.h"

@implementation BezierInterpView {
    UIBezierPath *path;
    // offscreen image buffer
    UIImage * image;
    // keep track of the four points of our Bezier segment
    // + control point of next segment
    CGPoint point[5];
    uint pointIndex;
}

- (id) initWithCoder:(NSCoder *)aDecoder {
    NSLog(@"BEZIER INIT 1.0");
    
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
    pointIndex = 0;
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
    pointIndex = 0;
    point[0] = [touch locationInView:self];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint p = [touch locationInView:self];
    pointIndex++;
    point[pointIndex] = p;
    if (pointIndex == 4) {
        // move the endpoint to the middle of the line joining the second control point
        // of the first Bezier segment and the first control point of the second Bezier segment
        //point[3] = CGPointMake((point[2].x + point[4].x)/2.0, (point[2].y + point[4].y)/2.0);
        
        // double the line between 3 and 4 and create a point there
        CGPoint pt = CGPointMake((2*point[3].x - point[4].x), (2*point[3].y - point[4].y));
        // find the middle of the new point and point 2 to use that as the second control point
        CGPoint controlPt2 = CGPointMake((pt.x + point[2].x)/2.0, (pt.y + point[2].y)/2.0);

        [path moveToPoint:point[0]];
        // add a cubic Bezier from pt[0] to pt[3], with control points pt[1] and pt[2]
        //[path addCurveToPoint:point[3] controlPoint1:point[1] controlPoint2:point[2]];
        [path addCurveToPoint:point[3] controlPoint1:point[1] controlPoint2: controlPt2];
        
        
        [self setNeedsDisplay];
        // shift points and get ready to handle the next segment
        point[0] = point[3];
        point[1] = point[4];
        pointIndex = 1;
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    //NSLog(@"ended");
    [self drawBitmap];
    [self setNeedsDisplay];
    if ([path isEmpty]) {
        return;
    }
    // let the second endpoint of the current Bezier segment be the first one for the next Bezier segment
    point[0] = [path currentPoint];
    [path removeAllPoints];
    pointIndex = 0;
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    //NSLog(@"cancel");
    [self touchesEnded:touches withEvent:event];
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
