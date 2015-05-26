//
//  TSGResultsViewController.h
//  Spectrum
//
//  Created by Connor Neville on 5/26/15.
//  Copyright (c) 2015 connorneville. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TSGResultsViewController : UIViewController

- (id) initWithGuess: (UIColor*) guessColor withGoal: (UIColor*) goalColor withAttempt: (int) attemptNumber;

@property NSDictionary* statisticDictionary;

@end
