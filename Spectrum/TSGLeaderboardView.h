//
//  TSGLeaderboardView.h
//  Spectrum
//
//  Created by Connor Neville on 5/27/15.
//  Copyright (c) 2015 connorneville. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CNLabel.h"

@interface TSGLeaderboardView : UIView

@property CNLabel* titleLabel;
@property CNLabel* infoLabel;
@property UITableView* leaderboardTable;
@property UIButton* goBackButton;

@end
