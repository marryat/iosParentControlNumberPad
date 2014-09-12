//
//  SimpleAddAccessView.m
//  iOSParentalControl
//
//  Created by Marryat Stevens on 05/09/2014.
//  Copyright (c) 2014 Spotty Bear. All rights reserved.
//

#import "SimpleAddAccessView.h"
#import <stdlib.h>
#import <QuartzCore/QuartzCore.h>
#import "UIButton+IPCAdditions.h"

@implementation SimpleAddAccessView

NSString *_originalQuestion;
NSString *_expectedAnswer;
NSString *_userAnswer;
NSArray *_numberButtons;


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (void)initialiseQuestion {
    int firstNum = arc4random_uniform(8) + 1;
    int secondNum = arc4random_uniform(8) + 1;
    
    int answer = firstNum + secondNum;
    
    _expectedAnswer = [NSString stringWithFormat:@"%d", answer];
    _userAnswer = @"";
    _originalQuestion = [NSString stringWithFormat:@"%d + %d =", firstNum, secondNum];
    
    [self updateDisplay];
    
}

- (void)updateDisplay {
    self.questionLabel.text = [NSString stringWithFormat:@"%@ %@", _originalQuestion, _userAnswer];
    
    _numberButtons = [[NSArray alloc] initWithObjects:self.number1Button, self.number2Button, self.number3Button, self.number4Button, self.number5Button, self.number6Button, self.number7Button, self.number8Button, self.number9Button, self.number0Button, nil];
    
    for (UIButton *btn in _numberButtons) {
        [btn ipc_ApplyPinButtonStyleAndHighlights];
    }
    
    [self setupDeleteButton:self.deleteButton];
}

- (void)buttonPressedWithNumber:(int)number button:(UIButton*)btn {
    if (!((number == 0 && [_userAnswer isEqualToString:@""]) || _userAnswer.length >= 8)) {
        _userAnswer = [NSString stringWithFormat:@"%@%d", _userAnswer, number];
        [self updateDisplay];
    }
    
    [UIView animateWithDuration:0.5f
                     animations:^{
                         btn.backgroundColor = [UIColor groupTableViewBackgroundColor];
                     }];
    
}

- (void)setupDeleteButton:(UIButton *)btn {
    [btn.layer setBorderWidth:0.5];
}

- (IBAction)button1Action:(id)sender {
    [self buttonPressedWithNumber:1 button:sender];
}
- (IBAction)button2Action:(id)sender {
    [self buttonPressedWithNumber:2 button:sender];
}
- (IBAction)button3Action:(id)sender {
    [self buttonPressedWithNumber:3 button:sender];
}
- (IBAction)button4Action:(id)sender {
    [self buttonPressedWithNumber:4 button:sender];
}
- (IBAction)button5Action:(id)sender {
    [self buttonPressedWithNumber:5 button:sender];
}
- (IBAction)button6Action:(id)sender {
    [self buttonPressedWithNumber:6 button:sender];
}
- (IBAction)button7Action:(id)sender {
    [self buttonPressedWithNumber:7 button:sender];
}
- (IBAction)button8Action:(id)sender {
    [self buttonPressedWithNumber:8 button:sender];
}
- (IBAction)button9Action:(id)sender {
    [self buttonPressedWithNumber:9 button:sender];
}
- (IBAction)button0Action:(id)sender {
    [self buttonPressedWithNumber:0 button:sender];
}


@end
