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
@property (strong, nonatomic) UILongPressGestureRecognizer *parentButtonRecognizer;

@end

@implementation ViewController {

    GrownUpCheckControl *_grownUpCheckControl;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CGRect grownUpFrame = CGRectMake(20, 20, 200, 30);
    _grownUpCheckControl = [[GrownUpCheckControl alloc] initWithFrame:grownUpFrame];
    _grownUpCheckControl.delegate = self;
    _grownUpCheckControl.backgroundButtonColor = [UIColor blackColor];
    _grownUpCheckControl.buttonBorderColor = [UIColor whiteColor];
    _grownUpCheckControl.buttonBorderWidth = 3.0f;
    _grownUpCheckControl.holdButtonCurvaceousness = 0.5f;
    _grownUpCheckControl.buttonFontColor = [UIColor whiteColor];
    _grownUpCheckControl.buttonWhiteHighlight = false;
    _grownUpCheckControl.buttonShadow = false;
    
    [self.view addSubview:_grownUpCheckControl];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - GrownUpCheckControlEventDelegate

- (void) grownUpCheckControlAnsweredCorrectly:(GrownUpCheckControl *)sender
{
    self.view.backgroundColor = [UIColor blackColor];
}

@end
