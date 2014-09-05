//
//  SimpleAddAccessView.h
//  iOSParentalControl
//
//  Created by Marryat Stevens on 05/09/2014.
//  Copyright (c) 2014 Spotty Bear. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SimpleAddAccessView : UIView

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

@property (strong, nonatomic) NSString *DesiredAnswer;

- (void)initialiseQuestion;

@end
