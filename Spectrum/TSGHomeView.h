//
//  TSGHomeView.h
//  Spectrum
//
//  Created by Connor Neville on 5/23/15.
//  Copyright (c) 2015 connorneville. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CNLabel.h"

@interface TSGHomeView : UIView

//Title
@property CNLabel* titleLabel;

//Paragraph instructions at top of view
@property CNLabel* initialInstructionLabel;

//Instructions for each color type
@property CNLabel* redInstructionLabel;
@property CNLabel* blueInstructionLabel;
@property CNLabel* greenInstructionLabel;

@end
