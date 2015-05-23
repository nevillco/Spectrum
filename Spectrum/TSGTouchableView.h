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

@property int attempts;
@property UIColor* createdColor;
@property CNLabel* notifyLabel;

@end
