//
//  GrownUpCheckControl.h
//  iOSParentalControl
//
//  Created by Marryat Stevens on 21/09/2014.
//  Copyright (c) 2014 Spotty Bear. All rights reserved.
//
// Version 1.0.0

#import <UIKit/UIKit.h>
#import "SimpleAddAccessView.h"


@class GrownUpCheckControl;

@protocol GrownUpCheckControlEventDelegate <NSObject>

- (void) grownUpCheckControlAnsweredCorrectly:(GrownUpCheckControl *)sender;
@optional
- (void) grownUpCheckControlAnsweredIncorrectly:(GrownUpCheckControl *)sender;
- (void) grownUpCheckControlCancelled:(GrownUpCheckControl *)sender;

@end

@interface GrownUpCheckControl : UIControl <SimpleAddAccessViewDelegate, UIGestureRecognizerDelegate>

@property (nonatomic) NSString *buttonTitle;
@property (nonatomic) UIFont *buttonFont;
@property (nonatomic, strong) UIColor *buttonFontColor;
@property (nonatomic, strong) UIColor *highlightHoldColor;
@property (nonatomic, strong) UIColor *backgroundButtonColor;
@property (nonatomic, assign) float durationOfHold;
@property (nonatomic) float holdButtonCurvaceousness;
@property (nonatomic, strong) UIColor *buttonBorderColor;
@property (nonatomic, assign) float buttonBorderWidth;


@property (nonatomic) UIColor *backgroundPinPadViewColor;
@property (nonatomic) UIColor *pinPadBorderColor;

@property (nonatomic, weak) id <GrownUpCheckControlEventDelegate> delegate;

@end
