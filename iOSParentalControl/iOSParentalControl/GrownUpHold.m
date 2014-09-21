//
//  GrownUpHold.m
//  iOSParentalControl
//
//  Created by Marryat Stevens on 21/09/2014.
//  Copyright (c) 2014 Spotty Bear. All rights reserved.
//

#import "GrownUpHold.h"
#import "SimpleAddAccessView.h"

@interface GrownUpHold ()

@property (strong, nonatomic) UILongPressGestureRecognizer *longPressGesture;
@property (strong, nonatomic) UITapGestureRecognizer *tapGesture;

@end

@implementation GrownUpHold

UIButton *_holdButton;
UIView *_backgroundButtonView;
UIColor *_backgroundColor;
UIView *_topView;

- (id)initWithButton:(UIButton *)btn andParentView:(UIView *)topView {
    if ((self = [super init])) {
        _holdButton = btn;
        _topView = topView;
        
        _backgroundButtonView = [[UIView alloc] initWithFrame:_holdButton.frame];
        _backgroundColor = btn.backgroundColor;
        [_holdButton.superview addSubview:_backgroundButtonView];
        
        self.tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(holdPressResponder:)];
        [_holdButton addGestureRecognizer:self.tapGesture];
        
//        self.longPressGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(holdPressResponder:)];
//        self.longPressGesture.minimumPressDuration = 3.0f;
//        self.longPressGesture.allowableMovement = 100.0f;
//        
//        [_holdButton addGestureRecognizer:self.longPressGesture];
        
        
    }
    return self;
}

- (void)holdPressResponder:(UILongPressGestureRecognizer *)sender {
    [self launchSimpleAddAccessView];
}

- (void)launchSimpleAddAccessView {
    NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"SimpleAddAccessView" owner:self options:nil];
    SimpleAddAccessView *addView = [views firstObject];
    [addView initialiseQuestion];
    [_topView addSubview:addView];
    
}


@end
