//
//  TSGInstructionView.m
//  Spectrum
//
//  Created by Connor Neville on 5/25/15.
//  Copyright (c) 2015 connorneville. All rights reserved.
//

#import "TSGInstructionView.h"
#import "AppDelegate.h"
#import "UIColor+TSGColorPresets.h"

@implementation TSGInstructionView

- (id) init {
    self = [super init];
    if(self) {
        [self setBackgroundColor: [UIColor lightGrayColor]];
        [self makeControls];
        [self makeControlConstraints];
    }
    return self;
}

- (void) makeControls {
    //self.titleLabel
    self.titleLabel = [[CNLabel alloc] initWithText:@"Spectrum"];
    self.titleLabel.font = [UIFont fontWithName:[AppDelegate fontName] size:28.0f];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview: self.titleLabel];
    
    //self.topInstructionsLabel
    self.topInstructionsLabel = [[CNLabel alloc] initWithText:@"The goal of the Spectrum Game is simple: try to match the goal color below by tapping and holding somewhere in the box. You have at most three tries before you need to submit your attempt. You get a higher score for more accurately matching the red, green and blue values for the color. The progress bars right below the box show you how much red, green and blue your color will have."];
    self.topInstructionsLabel.font = [UIFont fontWithName:[AppDelegate fontName] size:13.0f];
    self.topInstructionsLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview: self.topInstructionsLabel];
    
    //self.redInstructionsLabel
    self.redInstructionsLabel = [[CNLabel alloc] initWithText:@"Your color will have more red if you tap/hold further down in the box (vertical)."];
    self.redInstructionsLabel.font = [UIFont fontWithName:[AppDelegate boldFontName] size:14.0f];
    self.redInstructionsLabel.textColor = [UIColor redColor];
    self.redInstructionsLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview: self.redInstructionsLabel];
    
    //self.blueInstructionsLabel
    self.blueInstructionsLabel = [[CNLabel alloc] initWithText:@"Your color will have more blue if you tap/hold further right in the box (horizontal)."];
    self.blueInstructionsLabel.font = [UIFont fontWithName:[AppDelegate boldFontName] size:14.0f];
    self.blueInstructionsLabel.textColor = [UIColor blueColor];
    self.blueInstructionsLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview: self.blueInstructionsLabel];
    
    //self.greenInstructionsLabel
    self.greenInstructionsLabel = [[CNLabel alloc] initWithText:@"Your color will have more green if you tap/hold the box for a longer time (duration). The green bar starts filling up after holding down for 1 second and maxes out at 4 seconds."];
    self.greenInstructionsLabel.font = [UIFont fontWithName:[AppDelegate boldFontName] size:14.0f];
    self.greenInstructionsLabel.textColor = [UIColor TSGGreenColor];
    self.greenInstructionsLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview: self.greenInstructionsLabel];
    
    //self.bottomInstructions
    self.bottomInstructions = [[CNLabel alloc] initWithText:@"It's also useful to keep in mind that darker colors (closer to black) have less of all 3 components, and lighter colors have more."];
    self.bottomInstructions.font = [UIFont fontWithName:[AppDelegate fontName] size:13.0f];
    self.bottomInstructions.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview: self.bottomInstructions];
    
    //self.goBackButton
    self.goBackButton = [[UIButton alloc] init];
    [self.goBackButton setTitle:@"Got it!" forState:UIControlStateNormal];
    [self.goBackButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.goBackButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [self.goBackButton.titleLabel setFont: [UIFont fontWithName:[AppDelegate fontName] size:24.0f]];
    self.goBackButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:self.goBackButton];
}

- (void) makeControlConstraints {
    [self addConstraints:@[//self.titleLabel
                           [NSLayoutConstraint constraintWithItem:self.titleLabel
                                                        attribute:NSLayoutAttributeLeading
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self
                                                        attribute:NSLayoutAttributeLeadingMargin
                                                       multiplier:1.0f
                                                         constant:0.0f],
                           [NSLayoutConstraint constraintWithItem:self.titleLabel
                                                        attribute:NSLayoutAttributeTrailing
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self
                                                        attribute:NSLayoutAttributeTrailingMargin
                                                       multiplier:1.0f
                                                         constant:0.0f],
                           [NSLayoutConstraint constraintWithItem:self.titleLabel
                                                        attribute:NSLayoutAttributeTop
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self
                                                        attribute:NSLayoutAttributeTopMargin
                                                       multiplier:1.0f
                                                         constant:20.0f],
                           //self.topInstructionsLabel
                           [NSLayoutConstraint constraintWithItem:self.topInstructionsLabel
                                                        attribute:NSLayoutAttributeLeading
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self
                                                        attribute:NSLayoutAttributeLeadingMargin
                                                       multiplier:1.0f
                                                         constant:0.0f],
                           [NSLayoutConstraint constraintWithItem:self.topInstructionsLabel
                                                        attribute:NSLayoutAttributeTrailing
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self
                                                        attribute:NSLayoutAttributeTrailingMargin
                                                       multiplier:1.0f
                                                         constant:0.0f],
                           [NSLayoutConstraint constraintWithItem:self.topInstructionsLabel
                                                        attribute:NSLayoutAttributeTop
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self.titleLabel
                                                        attribute:NSLayoutAttributeBottom
                                                       multiplier:1.0f
                                                         constant:0.0f],
                           //self.redInstructionsLabel
                           [NSLayoutConstraint constraintWithItem:self.redInstructionsLabel
                                                        attribute:NSLayoutAttributeLeading
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self
                                                        attribute:NSLayoutAttributeLeadingMargin
                                                       multiplier:1.0f
                                                         constant:0.0f],
                           [NSLayoutConstraint constraintWithItem:self.redInstructionsLabel
                                                        attribute:NSLayoutAttributeTrailing
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self
                                                        attribute:NSLayoutAttributeTrailingMargin
                                                       multiplier:1.0f
                                                         constant:0.0f],
                           [NSLayoutConstraint constraintWithItem:self.redInstructionsLabel
                                                        attribute:NSLayoutAttributeTop
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self.topInstructionsLabel
                                                        attribute:NSLayoutAttributeBottom
                                                       multiplier:1.0f
                                                         constant:8.0f],
                           //self.blueInstructionsLabel
                           [NSLayoutConstraint constraintWithItem:self.blueInstructionsLabel
                                                        attribute:NSLayoutAttributeLeading
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self
                                                        attribute:NSLayoutAttributeLeadingMargin
                                                       multiplier:1.0f
                                                         constant:0.0f],
                           [NSLayoutConstraint constraintWithItem:self.blueInstructionsLabel
                                                        attribute:NSLayoutAttributeTrailing
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self
                                                        attribute:NSLayoutAttributeTrailingMargin
                                                       multiplier:1.0f
                                                         constant:0.0f],
                           [NSLayoutConstraint constraintWithItem:self.blueInstructionsLabel
                                                        attribute:NSLayoutAttributeTop
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self.redInstructionsLabel
                                                        attribute:NSLayoutAttributeBottom
                                                       multiplier:1.0f
                                                         constant:8.0f],
                           //self.greenInstructionsLabel
                           [NSLayoutConstraint constraintWithItem:self.greenInstructionsLabel
                                                        attribute:NSLayoutAttributeLeading
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self
                                                        attribute:NSLayoutAttributeLeadingMargin
                                                       multiplier:1.0f
                                                         constant:0.0f],
                           [NSLayoutConstraint constraintWithItem:self.greenInstructionsLabel
                                                        attribute:NSLayoutAttributeTrailing
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self
                                                        attribute:NSLayoutAttributeTrailingMargin
                                                       multiplier:1.0f
                                                         constant:0.0f],
                           [NSLayoutConstraint constraintWithItem:self.greenInstructionsLabel
                                                        attribute:NSLayoutAttributeTop
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self.blueInstructionsLabel
                                                        attribute:NSLayoutAttributeBottom
                                                       multiplier:1.0f
                                                         constant:8.0f],
                           //self.bottomInstructions
                           [NSLayoutConstraint constraintWithItem:self.bottomInstructions
                                                        attribute:NSLayoutAttributeLeading
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self
                                                        attribute:NSLayoutAttributeLeadingMargin
                                                       multiplier:1.0f
                                                         constant:0.0f],
                           [NSLayoutConstraint constraintWithItem:self.bottomInstructions
                                                        attribute:NSLayoutAttributeTrailing
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self
                                                        attribute:NSLayoutAttributeTrailingMargin
                                                       multiplier:1.0f
                                                         constant:0.0f],
                           [NSLayoutConstraint constraintWithItem:self.bottomInstructions
                                                        attribute:NSLayoutAttributeTop
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self.greenInstructionsLabel
                                                        attribute:NSLayoutAttributeBottom
                                                       multiplier:1.0f
                                                         constant:8.0f],
                           //self.goBackButton
                           [NSLayoutConstraint constraintWithItem:self.goBackButton
                                                        attribute:NSLayoutAttributeCenterX
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self
                                                        attribute:NSLayoutAttributeCenterX
                                                       multiplier:1.0f
                                                         constant:0.0f],
                           [NSLayoutConstraint constraintWithItem:self.goBackButton
                                                        attribute:NSLayoutAttributeTop
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self.bottomInstructions
                                                        attribute:NSLayoutAttributeBottom
                                                       multiplier:1.0f
                                                         constant:8.0f]
                           ]];
    
}

@end
