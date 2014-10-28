//
//  HoldButtonLayer.m
//  iOSParentalControl
//
//  Created by Marryat Stevens on 30/09/2014.
//  Copyright (c) 2014 Spotty Bear. All rights reserved.
//

#import "HoldButtonLayer.h"
#import "GrownUpCheckControl.h"

@implementation HoldButtonLayer

- (void)drawInContext:(CGContextRef)ctx
{
    
//www.raywenderlich.com/36288/how-to-make-a-custom-control
    //create curved track
    float cornerRadius = self.bounds.size.height * self.holdButton.curvaceousness / 2.0;
    UIBezierPath *switchOutline = [UIBezierPath
                                   bezierPathWithRoundedRect:self.bounds
                                   cornerRadius:cornerRadius];
    
    CGContextAddPath(ctx, switchOutline.CGPath);
    CGContextClip(ctx);
    
    //Sets the background colour
    CGContextSetFillColorWithColor(ctx, self.holdButton.backgroundHoldColor.CGColor);
    CGContextFillRect(ctx, CGRectMake(0, 0,
                                      (self.bounds.size.width * self.holdButton.highlightComplete),
                                      self.bounds.size.height));
    //Applies to highlight using alpha white on top half of the background
    CGRect highlight = CGRectMake(0, self.bounds.size.height/2,
                                  self.bounds.size.width, self.bounds.size.height/2);
    UIBezierPath *highlightPath = [UIBezierPath bezierPathWithRoundedRect:highlight
                                                             cornerRadius:highlight.size.height * self.holdButton.curvaceousness / 2.0];
    CGContextAddPath(ctx, highlightPath.CGPath);
    CGContextSetFillColorWithColor(ctx, [UIColor colorWithWhite:1.0 alpha:0.4].CGColor);
    CGContextFillPath(ctx);
    
    
    //Adds shadow to the inside of the track
    CGContextSetShadowWithColor(ctx, CGSizeMake(0, 2.0), 3.0, [UIColor grayColor].CGColor);
    CGContextAddPath(ctx, switchOutline.CGPath);
    CGContextSetStrokeColorWithColor(ctx, [UIColor grayColor].CGColor);
    CGContextStrokePath(ctx);
    
    // outline the track
    CGContextAddPath(ctx, switchOutline.CGPath);
    CGContextSetStrokeColorWithColor(ctx, [UIColor blackColor].CGColor);
    CGContextSetLineWidth(ctx, 0.5);
    CGContextStrokePath(ctx);
    
}


@end
