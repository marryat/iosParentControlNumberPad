//
//  SimpleAddAccessView.h
//  iOSParentalControl
//
//  Created by Marryat Stevens on 05/09/2014.
//  Copyright (c) 2014 Spotty Bear. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SimpleAddAccessView;

@protocol SimpleAddAccessViewDelegate <NSObject>

- (void)answerIsCorrect:(SimpleAddAccessView *)sender;
- (void)answerIsIncorrect:(SimpleAddAccessView *)sender;
- (void)cancelPanel:(SimpleAddAccessView *)sender;

@end

@interface SimpleAddAccessView : UIView

extern NSInteger const SIMPLE_ADD_ACCESS_VIEW_WIDTH;
extern NSInteger const SIMPLE_ADD_ACCESS_VIEW_HEIGHT;

@property (weak, nonatomic) IBOutlet UIButton *number1Button;
@property (weak, nonatomic) IBOutlet UIButton *number2Button;
@property (weak, nonatomic) IBOutlet UIButton *number3Button;
@property (weak, nonatomic) IBOutlet UIButton *number4Button;
@property (weak, nonatomic) IBOutlet UIButton *number5Button;
@property (weak, nonatomic) IBOutlet UIButton *number6Button;
@property (weak, nonatomic) IBOutlet UIButton *number7Button;
@property (weak, nonatomic) IBOutlet UIButton *number8Button;
@property (weak, nonatomic) IBOutlet UIButton *number9Button;
@property (weak, nonatomic) IBOutlet UIButton *number0Button;
@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (weak, nonatomic) IBOutlet UIButton *deleteButton;
@property (weak, nonatomic) IBOutlet UIButton *doneButton;

@property (strong, nonatomic) NSString *DesiredAnswer;

@property (weak, nonatomic) id <SimpleAddAccessViewDelegate> delegate;

- (void)initialiseQuestion;



@end
