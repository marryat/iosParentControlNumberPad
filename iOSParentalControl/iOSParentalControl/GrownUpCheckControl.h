//
//  GrownUpCheckControl.h
//  iOSParentalControl
//
//  Created by Marryat Stevens on 21/09/2014.
//  Copyright (c) 2014 Spotty Bear. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SimpleAddAccessView.h"

@class GrownUpCheckControl;

@protocol GrownUpCheckControlEventDelegate <NSObject>

- (void) grownUpCheckControlAnsweredCorrectly:(GrownUpCheckControl *)sender;
@optional
- (void) grownUpCheckControlAnsweredIncorrectly:(GrownUpCheckControl *)sender;
- (void) grownUpCheckControlCancelled:(GrownUpCheckControl *)sender;

@end

@interface GrownUpCheckControl : UIControl <SimpleAddAccessViewDelegate>

@property (nonatomic) NSString *buttonTitle;
@property (nonatomic) UIColor *highlightColor;
@property (nonatomic, assign) float durationOfHold;
@property (nonatomic) UIColor *backgroundPinPadViewColor;

@property (nonatomic, weak) id <GrownUpCheckControlEventDelegate> delegate;

@end
