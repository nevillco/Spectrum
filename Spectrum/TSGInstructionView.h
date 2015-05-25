//
//  TSGInstructionView.h
//  Spectrum
//
//  Created by Connor Neville on 5/25/15.
//  Copyright (c) 2015 connorneville. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CNLabel.h"

@interface TSGInstructionView : UIView

@property CNLabel* titleLabel;
@property CNLabel* topInstructionsLabel;
@property CNLabel* redInstructionsLabel;
@property CNLabel* blueInstructionsLabel;
@property CNLabel* greenInstructionsLabel;
@property CNLabel* bottomInstructions;
@property UIButton* goBackButton;

@end
