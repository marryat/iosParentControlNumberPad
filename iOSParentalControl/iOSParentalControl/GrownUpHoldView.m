//
//  GrownUpHoldView.m
//  iOSParentalControl
//
//  Created by Marryat Stevens on 21/09/2014.
//  Copyright (c) 2014 Spotty Bear. All rights reserved.
//

#import "GrownUpHoldView.h"
#import "SimpleAddAccessView.h"

@interface GrownUpHoldView ()

@property (strong, nonatomic) UILongPressGestureRecognizer *longPressGesture;
@property (strong, nonatomic) UITapGestureRecognizer *tapGesture;
@property (weak, nonatomic) UIButton *holdButton;
@property (weak, nonatomic) UIView *topParentView;


@end

@implementation GrownUpHoldView

UIView *_backgroundButtonView;
UIColor *_backgroundColor;

+ (id)initialiseWithButton:(UIButton *)button andTopView:(UIView *)topView {
    GrownUpHoldView *grownHoldView = [[GrownUpHoldView alloc] init];
    
    [grownHoldView initialiseWithButton:button andTopView:topView];
    
    return grownHoldView;
    
}

- (void)initialiseWithButton:(UIButton *)button andTopView:(UIView *)topView {
    
    self.holdButton = button;
    self.topParentView = topView;
    
    _backgroundButtonView = [[UIView alloc] initWithFrame:_holdButton.frame];
    _backgroundColor = self.holdButton.backgroundColor;
    [_holdButton.superview addSubview:_backgroundButtonView];
    
    self.tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(holdPressResponder:)];
    [_holdButton addGestureRecognizer:self.tapGesture];
    
}

- (void)holdPressResponder:(UILongPressGestureRecognizer *)sender {
    [self launchSimpleAddAccessView];
}

- (void)launchSimpleAddAccessView {
    NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"SimpleAddAccessView" owner:self options:nil];
    SimpleAddAccessView *addView = [views firstObject];
    [addView initialiseQuestion];
    [self.topParentView addSubview:addView];
    
    
}

@end
