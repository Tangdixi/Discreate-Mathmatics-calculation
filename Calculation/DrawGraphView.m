//
//  DrawGraphView.m
//  Calculation
//
//  Created by Developer C on 11/29/12.
//  Copyright (c) 2012 Developer C. All rights reserved.
//

#import "DrawGraphView.h"

@implementation DrawGraphView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGContextRef context=UIGraphicsGetCurrentContext();
    CGContextSetLineCap(context, kCGLineCapSquare);
    CGContextSetLineWidth(context, 4);
    CGContextSetRGBStrokeColor(context, 255, 255, 255, 1.0);
    
    //draw first graph
    CGContextMoveToPoint(context, 64.3, 280);
    CGContextAddLineToPoint(context, 64.3, 403);
    CGContextMoveToPoint(context, 25, 319.3);
    CGContextAddLineToPoint(context, 148, 319.3);
    
    //draw second graph
    CGContextMoveToPoint(context, 211.3, 280);
    CGContextAddLineToPoint(context, 211.3, 403);
    CGContextMoveToPoint(context, 172, 319.3);
    CGContextAddLineToPoint(context, 295, 319.3);
    
    CGContextStrokePath(context);
    
    UIFont *font_1=[UIFont fontWithName:@"Marker Felt" size:40.0];
    UIFont *font=[UIFont fontWithName:@"Marker Felt" size:35.0];
    CGContextSetRGBFillColor(context, 255, 255, 255, 1.0);
    
    [@"⊙" drawInRect:CGRectMake(25, 275, 44.3, 44.3) withFont:font_1];
    [@"0" drawInRect:CGRectMake(74.3, 278, 44.3, 44.3) withFont:font];
    [@"1" drawInRect:CGRectMake(113.6, 278, 44.3, 44.3) withFont:font];
    [@"0" drawInRect:CGRectMake(30, 322.3, 44.3, 44.3) withFont:font];
    [@"1" drawInRect:CGRectMake(30, 363.6, 44.3, 44.3) withFont:font];
    
    [@"⊛" drawInRect:CGRectMake(173, 275, 44.3, 44.3) withFont:font_1];
    [@"0" drawInRect:CGRectMake(222.3, 278, 44.3, 44.3) withFont:font];
    [@"1" drawInRect:CGRectMake(261.6, 278, 44.3, 44.3) withFont:font];
    [@"0" drawInRect:CGRectMake(178, 322.3, 44.3, 44.3) withFont:font];
    [@"1" drawInRect:CGRectMake(178, 363.6, 44.3, 44.3) withFont:font];
    // Drawing code
}


@end
