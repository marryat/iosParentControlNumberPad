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
    
    [self setupButtons];
    
    [self updateDisplay];
    
}

- (void)setupButtons {
    _numberButtons = [[NSArray alloc] initWithObjects:self.number1Button, self.number2Button, self.number3Button, self.number4Button, self.number5Button, self.number6Button, self.number7Button, self.number8Button, self.number9Button, self.number0Button, nil];
    
    for (UIButton *btn in _numberButtons) {
        [btn ipc_ApplyPinButtonStyleAndHighlights];
    }
    
    [self.deleteButton ipc_ApplyPinButtonStyleAndHighlights];
    [self.doneButton ipc_ApplyPinButtonStyleAndHighlights];
}

- (void)updateDisplay {
    self.questionLabel.text = [NSString stringWithFormat:@"%@ %@", _originalQuestion, _userAnswer];
    
    self.questionLabel.textColor = [UIColor darkTextColor];
    
}

- (void)buttonPressedWithNumber:(int)number button:(UIButton*)btn {
    if (!((number == 0 && [_userAnswer isEqualToString:@""]) || _userAnswer.length >= 8)) {
        _userAnswer = [NSString stringWithFormat:@"%@%d", _userAnswer, number];
        [self updateDisplay];
    }
    
}



- (IBAction)button1Action:(UIButton *)sender {
    [self buttonPressedWithNumber:1 button:sender];
}
- (IBAction)button2Action:(UIButton *)sender {
    [self buttonPressedWithNumber:2 button:sender];
}
- (IBAction)button3Action:(UIButton *)sender {
    [self buttonPressedWithNumber:3 button:sender];
}
- (IBAction)button4Action:(UIButton *)sender {
    [self buttonPressedWithNumber:4 button:sender];
}
- (IBAction)button5Action:(UIButton *)sender {
    [self buttonPressedWithNumber:5 button:sender];
}
- (IBAction)button6Action:(UIButton *)sender {
    [self buttonPressedWithNumber:6 button:sender];
}
- (IBAction)button7Action:(UIButton *)sender {
    [self buttonPressedWithNumber:7 button:sender];
}
- (IBAction)button8Action:(UIButton *)sender {
    [self buttonPressedWithNumber:8 button:sender];
}
- (IBAction)button9Action:(UIButton *)sender {
    [self buttonPressedWithNumber:9 button:sender];
}
- (IBAction)button0Action:(UIButton *)sender {
    [self buttonPressedWithNumber:0 button:sender];
}
-(IBAction)deleteButtonAction:(UIButton*)sender {
    if ([_userAnswer length] > 0) {
        _userAnswer = [_userAnswer substringToIndex:[_userAnswer length] - 1];
    }

    [self updateDisplay];
}
-(IBAction)doneButtonAction:(UIButton*)sender {
    if ([_userAnswer length] > 0) {
        if ([_userAnswer isEqualToString:_expectedAnswer]) {
            //TODO implement call back work.
        } else {
            self.questionLabel.textColor = [UIColor redColor];
        }
    }
}


@end
