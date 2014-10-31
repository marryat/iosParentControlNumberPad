//
//  HoldButtonLayer.h
//  iOSParentalControl
//
//  Created by Marryat Stevens on 30/09/2014.
//  Copyright (c) 2014 Spotty Bear. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@class GrownUpCheckControl;

@interface HoldButtonLayer : CALayer

@property (weak) GrownUpCheckControl *holdButton;
@property (nonatomic, assign) float percentageHighlight;

@end
