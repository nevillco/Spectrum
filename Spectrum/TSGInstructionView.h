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

//Title
@property CNLabel* titleLabel;
//Paragraph instructions at top of view
@property CNLabel* topInstructionsLabel;

//Instructions on how to get R, G, B values
@property CNLabel* redInstructionsLabel;
@property CNLabel* blueInstructionsLabel;
@property CNLabel* greenInstructionsLabel;

//Paragraph instructions at bottom of view
@property CNLabel* bottomInstructions;
//Button to dismiss VC and return
@property UIButton* goBackButton;

//Button to send email
@property UIButton* emailButton;

@end
