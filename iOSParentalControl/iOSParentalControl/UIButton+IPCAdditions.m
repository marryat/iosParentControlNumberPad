//
//  UIButton+IPC_buttonViewPinFormatCategory.m
//  iOSParentalControl
//
//  Created by Marryat Stevens on 06/09/2014.
//  Copyright (c) 2014 Spotty Bear. All rights reserved.
//

#import "UIButton+IPCAdditions.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIButton (IPCAdditions)

- (void)ipc_ApplyPinButtonStyleAndHighlights {
    [self.layer setBorderWidth:0.5f];
    [self.layer setBorderColor:[[UIColor blackColor] CGColor]];
    
    self.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    [self addTarget:self action:@selector(buttonHighlight:) forControlEvents:UIControlEventTouchDown];
    [self addTarget:self action:@selector(buttonRemoveHighlight:) forControlEvents:UIControlEventTouchUpOutside];
    [self addTarget:self action:@selector(buttonRemoveHighlight:) forControlEvents:UIControlEventTouchDragOutside];
    [self addTarget:self action:@selector(buttonHighlight:) forControlEvents:UIControlEventTouchDragEnter];
    [self addTarget:self action:@selector(buttonFadeOut:) forControlEvents:UIControlEventTouchUpInside];
}

- (IBAction)buttonHighlight:(id)sender {
    UIButton *btn = (UIButton *)sender;
    btn.backgroundColor = [UIColor grayColor];
}

- (IBAction)buttonFadeOut:(id)sender {
    UIButton *btn = (UIButton *)sender;
    btn.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    [UIView animateWithDuration:0.5f
                     animations:^{
                         btn.backgroundColor = [UIColor groupTableViewBackgroundColor];
                     }];
    
}

- (IBAction)buttonRemoveHighlight:(id)sender {
    UIButton *btn = (UIButton *)sender;
    
    [UIView animateWithDuration:0.2f animations:^{
        btn.backgroundColor = [UIColor groupTableViewBackgroundColor];
    }];
}



@end
