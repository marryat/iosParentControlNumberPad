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
#import "GrownUpCheckControl.h"


@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *grownupButton;
@property (strong, nonatomic) UILongPressGestureRecognizer *parentButtonRecognizer;

@end

@implementation ViewController {

    UIColor *_backgColor;
    UIView *_backgroundButtonView;
    GrownUpCheckControl *_grownUpCheckControl;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CGRect grownUpFrame = CGRectMake(20, 20, 200, 30);
    _grownUpCheckControl = [[GrownUpCheckControl alloc] initWithFrame:grownUpFrame];
    _grownUpCheckControl.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:_grownUpCheckControl];
    
    _backgColor = self.grownupButton.backgroundColor;
    _backgroundButtonView = [[UIView alloc] initWithFrame:_grownupButton.frame];
    [_grownupButton.superview addSubview:_backgroundButtonView];
    [self.view sendSubviewToBack:_backgroundButtonView];

    
    self.parentButtonRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(grownupHoldPress:)];
    
    self.parentButtonRecognizer.minimumPressDuration = 3.0f;
    self.parentButtonRecognizer.allowableMovement = 100.0f;
    
    [self.grownupButton addGestureRecognizer:self.parentButtonRecognizer];
    
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

- (void)grownupHoldPress:(UILongPressGestureRecognizer *)sender {
    [self launchSimpleAddAccessView];
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

}

- (IBAction)theTouchUpInside:(id)sender {
    [self setBackgroundGolorForButton:false];
    NSLog(@"Should cancel gesture");
}

- (IBAction)theTouchUpOutside:(id)sender {
    [self setBackgroundGolorForButton:false];
    NSLog(@"Should cancel gesture");
}
- (IBAction)theTouchDragOutside:(id)sender {
    [self setBackgroundGolorForButton:false];
    NSLog(@"Should cancel gesture");
}

@end
