//
//  GrownUpCheckControl.m
//  iOSParentalControl
//
//  Created by Marryat Stevens on 21/09/2014.
//  Copyright (c) 2014 Spotty Bear. All rights reserved.
//

#import "GrownUpCheckControl.h"
#import <QuartzCore/QuartzCore.h>
#import "HoldButtonLayer.h"

@interface GrownUpCheckControl ()

@property (nonatomic, strong) UILongPressGestureRecognizer *longPressGesture;

@property (nonatomic, strong) UIView *backgroundView;
@property (nonatomic, strong) UILabel *labelForHoldView;

@property (nonatomic, strong) SimpleAddAccessView *addAccessView;

//used for the timers to animate the background fill;
@property (nonatomic, assign) BOOL gestureInProgress;
@property (nonatomic, assign) BOOL gestureEnded;
@property (nonatomic, strong) CABasicAnimation *layerAnimation;

//Layers within the button that handle the animation
@property (nonatomic, strong) HoldButtonLayer *trackLayer;

@end

@implementation GrownUpCheckControl

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _buttonTitle = @"Grownup's press here";
        _backgroundPinPadViewColor = [UIColor clearColor];
        _pinPadBorderColor = [UIColor grayColor];
        _highlightHoldColor = [UIColor redColor];
        _holdButtonCurvaceousness = 2.0;
        _buttonFont = [UIFont systemFontOfSize:[UIFont smallSystemFontSize]];
        _durationOfHold = 3.0f;
        _backgroundButtonColor = [UIColor greenColor];
        _buttonBorderColor = [UIColor blackColor];
        _buttonBorderWidth = 0.5f;
        _buttonFontColor = [UIColor blackColor];
        
        _trackLayer = [HoldButtonLayer layer];
        _trackLayer.holdButton = self;
        [self.layer addSublayer:_trackLayer];
        _trackLayer.percentageHighlight = 0.0f;
        
        _trackLayer.frame = self.bounds;
        [_trackLayer setNeedsDisplay];
        
        CGRect pressFrame = CGRectMake(0, 0, frame.size.width, frame.size.height);
        
        _labelForHoldView = [[UILabel alloc] initWithFrame:pressFrame];
        _labelForHoldView.text = _buttonTitle;
        
        _labelForHoldView.textAlignment = NSTextAlignmentCenter;
        _labelForHoldView.font = _buttonFont;
        _labelForHoldView.textColor = _buttonFontColor;
        
        [self addSubview:_labelForHoldView];
        
        _longPressGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressAction:)];
        _longPressGesture.minimumPressDuration = _durationOfHold;
        _longPressGesture.allowableMovement = 100.0f;
        
        _longPressGesture.delegate = self;
        _gestureInProgress = false;
        _gestureEnded = false;
        
        
        [self addGestureRecognizer:_longPressGesture];
        
    }
    
    return self;
}

- (void)longPressAction:(UILongPressGestureRecognizer *)sender
{
    if (sender.state == UIGestureRecognizerStateBegan) {
        if (_addAccessView == nil) {
            
            UIView *topView = self.window.rootViewController.view;
            
            _backgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, topView.frame.size.width, topView.frame.size.height)];
            _backgroundView.backgroundColor = _backgroundPinPadViewColor;
            
            [topView addSubview:_backgroundView];
            
            NSArray *views = [[NSBundle  mainBundle] loadNibNamed:@"SimpleAddAccessView" owner:self options:nil];
            _addAccessView = [views firstObject];
            [_addAccessView initialiseQuestion];
            _addAccessView.delegate = self;
            [self.superview addSubview:_addAccessView];
            
            [_addAccessView setTranslatesAutoresizingMaskIntoConstraints:NO];
            
            NSLayoutConstraint *centerXConstraint = [NSLayoutConstraint
                                                     constraintWithItem:_addAccessView
                                                     attribute:NSLayoutAttributeCenterX
                                                     relatedBy:NSLayoutRelationEqual
                                                     toItem:topView
                                                     attribute:NSLayoutAttributeCenterX
                                                     multiplier:1
                                                     constant:0];
            
            NSLayoutConstraint *centerYConstraint = [NSLayoutConstraint
                                                     constraintWithItem:_addAccessView
                                                     attribute:NSLayoutAttributeCenterY
                                                     relatedBy:NSLayoutRelationEqual
                                                     toItem:topView
                                                     attribute:NSLayoutAttributeCenterY
                                                     multiplier:1
                                                     constant:0];
            
            NSLayoutConstraint *widthConstraint = [NSLayoutConstraint
                                                   constraintWithItem:_addAccessView
                                                   attribute:NSLayoutAttributeWidth
                                                   relatedBy:NSLayoutRelationEqual
                                                   toItem:nil
                                                   attribute:NSLayoutAttributeNotAnAttribute
                                                   multiplier:1.0
                                                   constant:SIMPLE_ADD_ACCESS_VIEW_WIDTH];
            
            NSLayoutConstraint *heightConstraint = [NSLayoutConstraint
                                                    constraintWithItem:_addAccessView
                                                    attribute:NSLayoutAttributeHeight
                                                    relatedBy:NSLayoutRelationEqual
                                                    toItem:nil
                                                    attribute:NSLayoutAttributeNotAnAttribute
                                                    multiplier:1.0
                                                    constant:SIMPLE_ADD_ACCESS_VIEW_HEIGHT];
            
            [topView addConstraint:centerXConstraint];
            [topView addConstraint:centerYConstraint];
            [_addAccessView addConstraint:widthConstraint];
            [_addAccessView addConstraint:heightConstraint];
            
            _addAccessView.layer.borderColor = _pinPadBorderColor.CGColor;
            _addAccessView.layer.borderWidth = 1.0f;
            
            [_trackLayer setNeedsDisplay];
           
        }
    }
}

- (void)setDurationOfHold:(float)durationOfHold
{
    _durationOfHold = durationOfHold;
    _longPressGesture.minimumPressDuration = durationOfHold;
}

- (void)setBackgroundPinPadViewColor:(UIColor *)backgroundPinPadViewColor
{
    _backgroundPinPadViewColor = backgroundPinPadViewColor;
    if (_backgroundView != nil)
    {
        _backgroundView.backgroundColor = backgroundPinPadViewColor;
    }
}

- (void)setButtonTitle:(NSString *)buttonTitle
{
    _buttonTitle = buttonTitle;
    _labelForHoldView.text = buttonTitle;
}

- (void)setPinPadBorderColor:(UIColor *)pinPadBorderColor
{
    _pinPadBorderColor = pinPadBorderColor;
    if (_addAccessView != nil) {
        _addAccessView.layer.borderColor = _pinPadBorderColor.CGColor;
    }
}

- (void)setButtonFont:(UIFont *)holdButtonFont
{
    _buttonFont = holdButtonFont;
    _labelForHoldView.font = _buttonFont;
}

- (void)setButtonFontColor:(UIColor *)buttonFontColor
{
    _buttonFontColor = buttonFontColor;
    _labelForHoldView.textColor = buttonFontColor;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)hideUiElementsOnCompletion
{
    [_addAccessView removeFromSuperview];
    _addAccessView = nil;
    [_backgroundView removeFromSuperview];
    _backgroundView = nil;
}

#pragma mark - SimpleAddAccessViewDelegate

- (void)answerIsCorrect:(SimpleAddAccessView *)sender
{
    [self hideUiElementsOnCompletion];
    
    [self.delegate grownUpCheckControlAnsweredCorrectly:self];

}

- (void)cancelPanel:(SimpleAddAccessView *)sender
{
    [self hideUiElementsOnCompletion];

    if ([self.delegate respondsToSelector:@selector(grownUpCheckControlCancelled:)])
    {
        [self.delegate grownUpCheckControlCancelled:self];
    }
}

- (void)answerIsIncorrect:(SimpleAddAccessView *)sender
{
    if ([self.delegate respondsToSelector:@selector(grownUpCheckControlAnsweredIncorrectly:)])
    {
        [self.delegate grownUpCheckControlAnsweredIncorrectly:self];
    }
}

#pragma mark - UIGestureRecognizerDelegate

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    [_trackLayer removeAnimationForKey:@"percentageHighlight"];
    
    [[self trackLayer] setPercentageHighlight:0.0f];
    
    CABasicAnimation *layerAnimation = [CABasicAnimation animationWithKeyPath:@"percentageHighlight"];
    layerAnimation.duration = _durationOfHold;
    layerAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
    layerAnimation.toValue = [NSNumber numberWithFloat:100.0f];
    layerAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    
    [_trackLayer addAnimation:layerAnimation forKey:@"percentageHighlight"];
    
    [self setLayerAnimation:layerAnimation];

}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_trackLayer removeAnimationForKey:@"percentageHighlight"];
    
    [_trackLayer setPercentageHighlight:0.0f];
    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{

    float currentHighlight = [(HoldButtonLayer *)_trackLayer.presentationLayer percentageHighlight];
    
    [_trackLayer removeAnimationForKey:@"percentageHighlight"];
    
    CABasicAnimation *layerAnimation = [CABasicAnimation animationWithKeyPath:@"percentageHighlight"];
    layerAnimation.duration = _durationOfHold / 10;
    layerAnimation.fromValue = [NSNumber numberWithFloat:currentHighlight];
    layerAnimation.toValue = [NSNumber numberWithFloat:0.0f];
    layerAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    
    [_trackLayer addAnimation:layerAnimation forKey:@"percentageHighlight"];
    
    [self setLayerAnimation:layerAnimation];
}

@end
