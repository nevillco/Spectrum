//
//  UIColor+TSGColorPresets.m
//  Spectrum
//
//  Created by Connor Neville on 5/27/15.
//  Copyright (c) 2015 connorneville. All rights reserved.
//

#import "UIColor+TSGColorPresets.h"

@implementation UIColor (TSGColorPresets)

//[UIColor greenColor] is too light - offering new default
+ (UIColor*) TSGGreenColor {
    return [UIColor colorWithRed:0.0f green:0.6f blue:0.0f alpha:1.0f];
}

+ (UIColor*) TSGGoldColor {
    return [UIColor colorWithRed:1.0f green:0.75f blue:0.0f alpha:1.0f];
}

+ (UIColor*) TSGSilverColor {
    return [UIColor colorWithRed:0.7f green:0.7f blue:0.7f alpha:1.0f];
}

+ (UIColor*) TSGBronzeColor {
    return [UIColor colorWithRed:0.7f green:0.5f blue:0.15f alpha:1.0f];
}

@end
