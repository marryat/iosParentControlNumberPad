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
        
    }
    
    return self;
}


- (void)setButtonTitle:(NSString *)buttonTitle
{
    _buttonTitle = buttonTitle;
    [self.holdButton setTitle:_buttonTitle forState:UIControlStateNormal];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
