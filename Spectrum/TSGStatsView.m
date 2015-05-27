//
//  TSGStatsView.m
//  Spectrum
//
//  Created by Connor Neville on 5/27/15.
//  Copyright (c) 2015 connorneville. All rights reserved.
//

#import "TSGStatsView.h"
#import "AppDelegate.h"

@implementation TSGStatsView

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
    
    //self.totalScoreLabel
    self.totalScoreLabel = [[CNLabel alloc] initWithText:@"0 total score"];
    self.totalScoreLabel.font = [UIFont fontWithName:[AppDelegate boldFontName] size:18.0f];
    self.totalScoreLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview: self.totalScoreLabel];
    
    //self.numAttemptsLabel
    self.numAttemptsLabel = [[CNLabel alloc] initWithText:@"0 total plays"];
    self.numAttemptsLabel.font = [UIFont fontWithName:[AppDelegate boldFontName] size:18.0f];
    self.numAttemptsLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview: self.numAttemptsLabel];
    
    //self.averageScoreLabel
    self.averageScoreLabel = [[CNLabel alloc] initWithText:@"0.0 average score"];
    self.averageScoreLabel.font = [UIFont fontWithName:[AppDelegate boldFontName] size:18.0f];
    self.averageScoreLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview: self.averageScoreLabel];
    
    //self.topScoreLabel
    self.topScoreLabel = [[CNLabel alloc] initWithText:@"0 best score"];
    self.topScoreLabel.font = [UIFont fontWithName:[AppDelegate boldFontName] size:18.0f];
    self.topScoreLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview: self.topScoreLabel];
    
    //self.goBackButton
    self.goBackButton = [[UIButton alloc] init];
    [self.goBackButton setTitle:@"Go Back" forState:UIControlStateNormal];
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
                           //self.totalScoreLabel
                           [NSLayoutConstraint constraintWithItem:self.totalScoreLabel
                                                        attribute:NSLayoutAttributeLeading
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self
                                                        attribute:NSLayoutAttributeLeadingMargin
                                                       multiplier:1.0f
                                                         constant:0.0f],
                           [NSLayoutConstraint constraintWithItem:self.totalScoreLabel
                                                        attribute:NSLayoutAttributeTrailing
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self
                                                        attribute:NSLayoutAttributeTrailingMargin
                                                       multiplier:1.0f
                                                         constant:0.0f],
                           [NSLayoutConstraint constraintWithItem:self.totalScoreLabel
                                                        attribute:NSLayoutAttributeTop
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self.titleLabel
                                                        attribute:NSLayoutAttributeBottom
                                                       multiplier:1.0f
                                                         constant:20.0f],
                           //self.numAttemptsLabel
                           [NSLayoutConstraint constraintWithItem:self.numAttemptsLabel
                                                        attribute:NSLayoutAttributeLeading
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self
                                                        attribute:NSLayoutAttributeLeadingMargin
                                                       multiplier:1.0f
                                                         constant:0.0f],
                           [NSLayoutConstraint constraintWithItem:self.numAttemptsLabel
                                                        attribute:NSLayoutAttributeTrailing
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self
                                                        attribute:NSLayoutAttributeTrailingMargin
                                                       multiplier:1.0f
                                                         constant:0.0f],
                           [NSLayoutConstraint constraintWithItem:self.numAttemptsLabel
                                                        attribute:NSLayoutAttributeTop
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self.totalScoreLabel
                                                        attribute:NSLayoutAttributeBottom
                                                       multiplier:1.0f
                                                         constant:8.0f],
                           //self.averageScoreLabel
                           [NSLayoutConstraint constraintWithItem:self.averageScoreLabel
                                                        attribute:NSLayoutAttributeLeading
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self
                                                        attribute:NSLayoutAttributeLeadingMargin
                                                       multiplier:1.0f
                                                         constant:0.0f],
                           [NSLayoutConstraint constraintWithItem:self.averageScoreLabel
                                                        attribute:NSLayoutAttributeTrailing
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self
                                                        attribute:NSLayoutAttributeTrailingMargin
                                                       multiplier:1.0f
                                                         constant:0.0f],
                           [NSLayoutConstraint constraintWithItem:self.averageScoreLabel
                                                        attribute:NSLayoutAttributeTop
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self.numAttemptsLabel
                                                        attribute:NSLayoutAttributeBottom
                                                       multiplier:1.0f
                                                         constant:8.0f],
                           //self.topScoreLabel
                           [NSLayoutConstraint constraintWithItem:self.topScoreLabel
                                                        attribute:NSLayoutAttributeLeading
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self
                                                        attribute:NSLayoutAttributeLeadingMargin
                                                       multiplier:1.0f
                                                         constant:0.0f],
                           [NSLayoutConstraint constraintWithItem:self.topScoreLabel
                                                        attribute:NSLayoutAttributeTrailing
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self
                                                        attribute:NSLayoutAttributeTrailingMargin
                                                       multiplier:1.0f
                                                         constant:0.0f],
                           [NSLayoutConstraint constraintWithItem:self.topScoreLabel
                                                        attribute:NSLayoutAttributeTop
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self.averageScoreLabel
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
                                                        attribute:NSLayoutAttributeBottom
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self
                                                        attribute:NSLayoutAttributeBottomMargin
                                                       multiplier:1.0f
                                                         constant:0.0f],
                           ]];
    
}

@end
