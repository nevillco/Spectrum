//
//  TSGHomeView.h
//  Spectrum
//
//  Created by Connor Neville on 5/23/15.
//  Copyright (c) 2015 connorneville. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CNLabel.h"
#import "TSGTouchableView.h"
#import "TSGColorView.h"

@interface TSGHomeView : UIView

//Title
@property CNLabel* titleLabel;

//Paragraph instructions at top of view
@property CNLabel* initialInstructionLabel;

//Instructions for each color type
@property CNLabel* redInstructionLabel;
@property CNLabel* blueInstructionLabel;
@property CNLabel* greenInstructionLabel;

//Touchable view, usedby player to make a color
@property TSGTouchableView* touchView;

//Button to submit attempt
@property UIButton* submitButton;

//View for goal color
@property UIView* goalView;
//Square with goal color (subview of goalView!)
@property TSGColorView* goalColorSquare;
//Label for goal color (subview of goalView!)
@property CNLabel* goalLabel;

//View for guessed color
@property UIView* guessView;
//Square with guess color (subview of guessView!)
@property TSGColorView* guessColorSquare;
//Label for guess color (subview of guessView!)
@property CNLabel* guessLabel;


//Three small buttons to display along button

//Show/hide instructions. Since this action only affects UI,
//HomeView should implement the action
@property UIButton* instructionButton;
//Button to segue to My Stats
@property UIButton* myStatsButton;
//Button to segue to global Leaderboard
@property UIButton* leaderboardButton;

@end
