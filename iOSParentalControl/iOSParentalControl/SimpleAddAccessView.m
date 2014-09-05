//
//  SimpleAddAccessView.m
//  iOSParentalControl
//
//  Created by Marryat Stevens on 05/09/2014.
//  Copyright (c) 2014 Spotty Bear. All rights reserved.
//

#import "SimpleAddAccessView.h"
#import <stdlib.h>

@implementation SimpleAddAccessView

NSString *_originalQuestion;
NSString *_expectedAnswer;
NSString *_userAnswer;


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
}

- (void)buttonPressedWithNumber:(int)number {
    if (!(number == 0 && [_userAnswer isEqualToString:@""])) {
        _userAnswer = [NSString stringWithFormat:@"%@%d", _userAnswer, number];
        [self updateDisplay];
    }
}

- (IBAction)button1Action:(id)sender {
    [self buttonPressedWithNumber:1];
}
- (IBAction)button2Action:(id)sender {
    [self buttonPressedWithNumber:2];
}
- (IBAction)button3Action:(id)sender {
    [self buttonPressedWithNumber:3];
}
- (IBAction)button4Action:(id)sender {
    [self buttonPressedWithNumber:4];
}
- (IBAction)button5Action:(id)sender {
    [self buttonPressedWithNumber:5];
}
- (IBAction)button6Action:(id)sender {
    [self buttonPressedWithNumber:6];
}
- (IBAction)button7Action:(id)sender {
    [self buttonPressedWithNumber:7];
}
- (IBAction)button8Action:(id)sender {
    [self buttonPressedWithNumber:8];
}
- (IBAction)button9Action:(id)sender {
    [self buttonPressedWithNumber:9];
}
- (IBAction)button0Action:(id)sender {
    [self buttonPressedWithNumber:0];
}


@end
