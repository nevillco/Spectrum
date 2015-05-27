//
//  TSGStatsView.h
//  Spectrum
//
//  Created by Connor Neville on 5/27/15.
//  Copyright (c) 2015 connorneville. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CNLabel.h"

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

- (void) updateWithStatistics: (NSDictionary*) statistics;

@end
