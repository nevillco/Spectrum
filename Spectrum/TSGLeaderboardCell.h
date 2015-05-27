//
//  TSGLeaderboardCell.h
//  Spectrum
//
//  Created by Connor Neville on 5/27/15.
//  Copyright (c) 2015 connorneville. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CNLabel.h"

@interface TSGLeaderboardCell : UITableViewCell

- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;

- (void) setStyleForRowIndex: (int) rowIndex;

@property CNLabel* playerNameLabel;
@property CNLabel* scoreLabel;

@end
