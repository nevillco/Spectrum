//
//  TSGTouchableView.h
//  Spectrum
//
//  Created by Connor Neville on 5/23/15.
//  Copyright (c) 2015 connorneville. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CNLabel.h"

@interface TSGTouchableView : UIView

//Number of attempts logged so far
@property int attempts;
//Color to output
@property UIColor* createdColor;
//Label notifying max attempts reached
@property CNLabel* notifyLabel;
//Progress bars - updated during color creation
@property UIProgressView* redProgress;
@property UIProgressView* blueProgress;
@property UIProgressView* greenProgress;

@end
