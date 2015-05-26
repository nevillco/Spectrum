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

//The view that the user interacts with to generate a color
//has to interact with progress bars and create gridlines as
//view is being held

//Number of attempts logged so far
@property int attempts;
//Color to output
@property UIColor* createdColor;
//Label notifying max attempts reached
@property CNLabel* notifyLabel;
//Timer to continually update progress bars
@property NSTimer* progressTimer;
//Progress bars - updated during color creation
@property UIProgressView* redProgress;
@property UIProgressView* blueProgress;
@property UIProgressView* greenProgress;
//Float values used by progress bar
@property float redValue;
@property float blueValue;
@property float greenValue;

@end
