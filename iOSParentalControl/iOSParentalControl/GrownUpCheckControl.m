//
//  GrownUpCheckControl.m
//  iOSParentalControl
//
//  Created by Marryat Stevens on 21/09/2014.
//  Copyright (c) 2014 Spotty Bear. All rights reserved.
//

#import "GrownUpCheckControl.h"

@interface GrownUpCheckControl ()

@property (nonatomic, strong) UIButton *holdButton;
@property (nonatomic, strong) UIView *backgroundView;
@property (nonatomic, strong) UILongPressGestureRecognizer *longPressGesture;
@property (nonatomic, strong) SimpleAddAccessView *addAccessView;

@end

@implementation GrownUpCheckControl

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _buttonTitle = @"Grownup's press here";
        _highlightColor = [UIColor greenColor];
        
        CGRect totalFrame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        
        _backgroundView = [[UIView alloc] initWithFrame:totalFrame];
        _holdButton = [[UIButton alloc] initWithFrame:totalFrame];
        [_holdButton setTitle:_buttonTitle forState:UIControlStateNormal];
        
        [self addSubview:_backgroundView];
        [self addSubview:_holdButton];
        
        _longPressGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressAction:)];
        _longPressGesture.minimumPressDuration = 3.0f;
        _longPressGesture.allowableMovement = 100.0f;
        
        [_holdButton addGestureRecognizer:_longPressGesture];
        
    }
    
    return self;
}

- (void)longPressAction:(UILongPressGestureRecognizer *)sender
{
    if (sender.state == UIGestureRecognizerStateBegan) {
        NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"SimpleAddAccessView" owner:self options:nil];
        _addAccessView = [views firstObject];
        [_addAccessView initialiseQuestion];
        _addAccessView.delegate = self;
        [self.superview addSubview:_addAccessView];
    }
    else if (sender.state == UIGestureRecognizerStateEnded)
    {
        NSLog(@"ended Event");
    }
}

- (void)setButtonTitle:(NSString *)buttonTitle
{
    _buttonTitle = buttonTitle;
    [self.holdButton setTitle:_buttonTitle forState:UIControlStateNormal];
}

- (void)setDurationOfHold:(float)durationOfHold
{
    _durationOfHold = durationOfHold;
    _longPressGesture.minimumPressDuration = durationOfHold;
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

#pragma mark - SimpleAddAccessViewDelegate

- (void)answerIsCorrect:(SimpleAddAccessView *)sender
{
    [_addAccessView removeFromSuperview];
    _addAccessView = nil;
    
    //TODO need to implement call back
    NSLog(@"Need to implement something here");
}

@end
