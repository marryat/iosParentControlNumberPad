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
@property (nonatomic, strong) UIView *holdView;

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
    
        _holdButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        _holdButton.frame = totalFrame;
        [_holdButton setTitle:_buttonTitle forState:UIControlStateNormal];
        
        _holdView = [[UIView alloc] initWithFrame:totalFrame];
//        [_holdView setText:_buttonTitle];
        [_holdView setBackgroundColor:[UIColor redColor]];

        [self addSubview:_backgroundView];
//        [self addSubview:_holdButton];
        [self addSubview:_holdView];
        
        _longPressGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressAction:)];
        _longPressGesture.minimumPressDuration = 3.0f;
        _longPressGesture.allowableMovement = 100.0f;
        
        [_holdView addGestureRecognizer:_longPressGesture];
        
    }
    
    return self;
}

- (void)longPressAction:(UILongPressGestureRecognizer *)sender
{
    if (sender.state == UIGestureRecognizerStateBegan) {
        if (_addAccessView == nil) {
            NSArray *views = [[NSBundle  mainBundle] loadNibNamed:@"SimpleAddAccessView" owner:self options:nil];
            _addAccessView = [views firstObject];
            [_addAccessView initialiseQuestion];
            _addAccessView.delegate = self;
            [self.superview addSubview:_addAccessView];
            
            NSLog(@"superview dimensions (%f, %f)", self.superview.frame.size.width, self.superview.frame.size.height);
            NSLog(@"first simpleView (%f, %f, %f, %f)", _addAccessView.frame.origin.x, _addAccessView.frame.origin.y, _addAccessView.frame.size.width, _addAccessView.frame.size.height);
            
            NSDictionary* viewDictionary = NSDictionaryOfVariableBindings(_addAccessView, self.superview);
            
            
            [self.superview addConstraints:[NSLayoutConstraint
                                            constraintsWithVisualFormat:@"H:|-[_addAccessView]-|"
                                            options:0
                                            metrics:nil
                                            views:viewDictionary]];
            [self.superview addConstraints:[NSLayoutConstraint
                                            constraintsWithVisualFormat:@"V:|-[_addAccessView]-|"
                                            options:0
                                            metrics:nil
                                            views:viewDictionary]];
            
            NSLog(@"first simpleView (%f, %f, %f, %f)", _addAccessView.frame.origin.x, _addAccessView.frame.origin.y, _addAccessView.frame.size.width, _addAccessView.frame.size.height);
            ;
           
        }
    }
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
    
    [self.delegate grownUpCheckControlAnsweredCorrectly:self];

}

- (void)answerIsIncorrect:(SimpleAddAccessView *)sender
{
    if ([self.delegate respondsToSelector:@selector(grownUpCheckControlAnsweredIncorrectly:)])
    {
        [self.delegate grownUpCheckControlAnsweredIncorrectly:self];
    }
}

@end
