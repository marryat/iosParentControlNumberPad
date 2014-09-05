//
//  ViewController.m
//  iOSParentalControl
//
//  Created by Marryat Stevens on 04/09/2014.
//  Copyright (c) 2014 Spotty Bear. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "SimpleAddAccessView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *grownupButton;

@end

@implementation ViewController

UIColor *_backgColor;
UIView *_backgroundButtonView;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _backgColor = self.grownupButton.backgroundColor;
    _backgroundButtonView = [[UIView alloc] initWithFrame:_grownupButton.frame];
    [_grownupButton.superview addSubview:_backgroundButtonView];
    [self.view sendSubviewToBack:_backgroundButtonView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)launchSimpleAddAccessView {
    NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"SimpleAddAccessView" owner:self options:nil];
    SimpleAddAccessView *addView = [views firstObject];
    [addView initialiseQuestion];
    [self.view addSubview:addView];
    
}

- (void)setBackgroundGolorForButton:(BOOL)setBackgroundColor {
    _backgroundButtonView.backgroundColor = [UIColor greenColor];
    
    CGRect frame = _backgroundButtonView.frame;
    frame.size.width = 1.0f;
    _backgroundButtonView.frame = frame;
    _backgroundButtonView.hidden = false;
    if (setBackgroundColor) {
        [UIView animateWithDuration:3.0f animations:^{
            CGRect newFrame = _backgroundButtonView.frame;
            newFrame.size.width = self.grownupButton.frame.size.width;
            _backgroundButtonView.frame = newFrame;
            
        } completion:^(BOOL finished) {
            [self launchSimpleAddAccessView];
            //TODO: this is something to do later.
        }];
    } else {
        [_backgroundButtonView.layer removeAllAnimations];
        _backgroundButtonView.hidden = true;
    }
}
- (IBAction)theTouchDragExit:(id)sender {
    [self setBackgroundGolorForButton:false];
}

- (IBAction)theTouchDown:(id)sender {
    [self setBackgroundGolorForButton:true];
}

- (IBAction)theTouchUpInside:(id)sender {
    [self setBackgroundGolorForButton:false];
}

- (IBAction)theTouchUpOutside:(id)sender {
    [self setBackgroundGolorForButton:false];
}
- (IBAction)theTouchDragOutside:(id)sender {
    [self setBackgroundGolorForButton:false];
}

@end
