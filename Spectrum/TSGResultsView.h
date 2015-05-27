//
//  TSGResultsView.h
//  Spectrum
//
//  Created by Connor Neville on 5/25/15.
//  Copyright (c) 2015 connorneville. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CNLabel.h"
#import "TSGColorView.h"

@interface TSGResultsView : UIView

//Title
@property CNLabel* titleLabel;

//View for goal color
@property UIView* goalView;
//Square with goal color (subview of goalView!)
@property TSGColorView* goalColorSquare;
//Label for goal color (subview of goalView!)
@property CNLabel* goalLabel;
//Label to display RGB of goal (subview of goalView!)
@property CNLabel* goalRGBLabel;

//View for guessed color
@property UIView* guessView;
//Square with guess color (subview of guessView!)
@property TSGColorView* guessColorSquare;
//Label for guess color (subview of guessView!)
@property CNLabel* guessLabel;
//Label to display RGB of guess (subview of guessView!)
@property CNLabel* guessRGBLabel;

//Raw score label
@property CNLabel* rawScoreLabel;
//Label for list of multipliers (will have many lines)
@property CNLabel* multipliersLabel;
//Final score label
@property CNLabel* finalScoreLabel;

//Button to dismiss VC and return
@property UIButton* goBackButton;

@end
