//
//  TSGStatsView.h
//  Spectrum
//
//  Created by Connor Neville on 5/27/15.
//  Copyright (c) 2015 connorneville. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CNLabel.h"
#import "TSGColorView.h"

@interface TSGStatsView : UIView

//Title
@property CNLabel* titleLabel;
//Label for total score (large number, will need to be formatted)
@property CNLabel* totalScoreLabel;
//Label for number of attempts
@property CNLabel* numAttemptsLabel;
//Label for average score
@property CNLabel* averageScoreLabel;
//Label for top score
@property CNLabel* topScoreLabel;
//Button to dismiss VC and go back home
@property UIButton* goBackButton;

//For each medal type: a color view,
//a medalsLabel stating how many, and a descriptionLabel
//expaining criteria for achieving
@property TSGColorView* platinumColorView;
@property CNLabel* platinumMedalsLabel;
@property CNLabel* platinumDescriptionLabel;

@property TSGColorView* goldColorView;
@property CNLabel* goldMedalsLabel;
@property CNLabel* goldDescriptionLabel;

@property TSGColorView* silverColorView;
@property CNLabel* silverMedalsLabel;
@property CNLabel* silverDescriptionLabel;

@property TSGColorView* bronzeColorView;
@property CNLabel* bronzeMedalsLabel;
@property CNLabel* bronzeDescriptionLabel;

- (void) updateWithStatistics: (NSDictionary*) statistics;

@end
