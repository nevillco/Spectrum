//
//  TSGColorView.m
//  Spectrum
//
//  Created by Connor Neville on 5/23/15.
//  Copyright (c) 2015 connorneville. All rights reserved.
//

#import "TSGColorView.h"

@implementation TSGColorView

- (id) initWithColor: (UIColor*) color {
    self = [super init];
    if(self) {
        [self setBackgroundColor: color];
        self.layer.borderColor = [UIColor blackColor].CGColor;
        self.layer.borderWidth = 1.0f;
        self.layer.cornerRadius = 5.0f;
        //Constraint: height = width (square)
        [self addConstraint: [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:1.0f constant:0.0f]];
    }
    return self;
}

- (id) init {
    self = [super init];
    if(self) {
        [self setBackgroundColor: [UIColor clearColor]];
        self.layer.borderColor = [UIColor blackColor].CGColor;
        self.layer.borderWidth = 1.0f;
        self.layer.cornerRadius = 5.0f;
        //Constraint: height = width (square)
        [self addConstraint: [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:1.0f constant:0.0f]];
    }
    return self;
}

@end
