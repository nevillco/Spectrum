//
//  TSGHomeView.m
//  Spectrum
//
//  Created by Connor Neville on 5/23/15.
//  Copyright (c) 2015 connorneville. All rights reserved.
//

#import "TSGHomeView.h"
#import "AppDelegate.h"

@implementation TSGHomeView

- (id) init {
    self = [super init];
    if(self) {
        self.backgroundColor = [UIColor lightGrayColor];
        [self makeControls];
        [self makeControlConstraints];
    }
    return self;
}

//Construct, format and add each property of TSGHomeView
- (void) makeControls {
    //self.titleLabel
    self.titleLabel = [[CNLabel alloc] initWithText:@"Spectrum"];
    self.titleLabel.font = [UIFont fontWithName:[AppDelegate fontName] size:28.0f];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview: self.titleLabel];
    
    //self.initialInstructionLabel
    self.initialInstructionLabel = [[CNLabel alloc] initWithText:@"The goal of the Spectrum Game is simple: try to match the goal color below by tapping and holding somewhere in the box. You have up to three tries."];
    self.initialInstructionLabel.font = [UIFont fontWithName:[AppDelegate fontName] size:13.0f];
    self.initialInstructionLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview: self.initialInstructionLabel];
    
    //self.redInstructionLabel
    self.redInstructionLabel = [[CNLabel alloc] initWithText:@"Touch further down for a redder color."];
    self.redInstructionLabel.font = [UIFont fontWithName:[AppDelegate boldFontName] size:13.0f];
    self.redInstructionLabel.textColor = [UIColor redColor];
    self.redInstructionLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview: self.redInstructionLabel];
    
    //self.blueInstructionLabel
    self.blueInstructionLabel = [[CNLabel alloc] initWithText:@"Touch further right for a bluer color."];
    self.blueInstructionLabel.font = [UIFont fontWithName:[AppDelegate boldFontName] size:13.0f];
    self.blueInstructionLabel.textColor = [UIColor blueColor];
    self.blueInstructionLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview: self.blueInstructionLabel];
    
    //self.greenInstructionLabel
    self.greenInstructionLabel = [[CNLabel alloc] initWithText:@"Hold your touch longer for a greener color."];
    self.greenInstructionLabel.font = [UIFont fontWithName:[AppDelegate boldFontName] size:13.0f];
    self.greenInstructionLabel.textColor = [UIColor greenColor];
    self.greenInstructionLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview: self.greenInstructionLabel];
    
    //self.touchView
    self.touchView = [[TSGTouchableView alloc] init];
    self.touchView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview: self.touchView];
    
    //self.submitButton
    self.submitButton = [[UIButton alloc] init];
    [self.submitButton setTitle:@"Submit Attempt" forState:UIControlStateNormal];
    [self.submitButton.titleLabel setFont: [UIFont fontWithName:[AppDelegate fontName] size:24.0f]];
    [self.submitButton setTitleColor: [UIColor blueColor] forState:UIControlStateNormal];
    [self.submitButton setTitleColor: [UIColor whiteColor] forState:UIControlStateHighlighted];
    self.submitButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview: self.submitButton];
    
    //self.instructionButton
    self.instructionButton = [[UIButton alloc] init];
    [self.instructionButton setTitle:@"Hide Instructions" forState:UIControlStateNormal];
    [self.instructionButton.titleLabel setFont: [UIFont fontWithName:[AppDelegate fontName] size:11.0f]];
    [self.instructionButton setTitleColor: [UIColor blueColor] forState:UIControlStateNormal];
    [self.instructionButton setTitleColor: [UIColor whiteColor] forState:UIControlStateHighlighted];
    self.instructionButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview: self.instructionButton];
    
    //self.myStatsButton
    self.myStatsButton = [[UIButton alloc] init];
    [self.myStatsButton setTitle:@"My Stats" forState:UIControlStateNormal];
    [self.myStatsButton.titleLabel setFont: [UIFont fontWithName:[AppDelegate fontName] size:11.0f]];
    [self.myStatsButton setTitleColor: [UIColor blueColor] forState:UIControlStateNormal];
    [self.myStatsButton setTitleColor: [UIColor whiteColor] forState:UIControlStateHighlighted];
    self.myStatsButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview: self.myStatsButton];
    
    //self.leaderboardButton
    self.leaderboardButton = [[UIButton alloc] init];
    [self.leaderboardButton setTitle:@"Leaderboard" forState:UIControlStateNormal];
    [self.leaderboardButton.titleLabel setFont: [UIFont fontWithName:[AppDelegate fontName] size:11.0f]];
    [self.leaderboardButton setTitleColor: [UIColor blueColor] forState:UIControlStateNormal];
    [self.leaderboardButton setTitleColor: [UIColor whiteColor] forState:UIControlStateHighlighted];
    self.leaderboardButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview: self.leaderboardButton];
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
                           //self.initialInstructionLabel
                           [NSLayoutConstraint constraintWithItem:self.initialInstructionLabel
                                                         attribute:NSLayoutAttributeLeading
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeLeadingMargin
                                                        multiplier:1.0f
                                                          constant:0.0f],
                            [NSLayoutConstraint constraintWithItem:self.initialInstructionLabel
                                                         attribute:NSLayoutAttributeTrailing
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeTrailingMargin
                                                        multiplier:1.0f
                                                          constant:0.0f],
                            [NSLayoutConstraint constraintWithItem:self.initialInstructionLabel
                                                         attribute:NSLayoutAttributeTop
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self.titleLabel
                                                         attribute:NSLayoutAttributeBottom
                                                        multiplier:1.0f
                                                          constant:0.0f],
                           //self.redInstructionLabel
                           [NSLayoutConstraint constraintWithItem:self.redInstructionLabel
                                                        attribute:NSLayoutAttributeLeading
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self
                                                        attribute:NSLayoutAttributeLeadingMargin
                                                       multiplier:1.0f
                                                         constant:0.0f],
                           [NSLayoutConstraint constraintWithItem:self.redInstructionLabel
                                                        attribute:NSLayoutAttributeTrailing
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self
                                                        attribute:NSLayoutAttributeTrailingMargin
                                                       multiplier:1.0f
                                                         constant:0.0f],
                           [NSLayoutConstraint constraintWithItem:self.redInstructionLabel
                                                        attribute:NSLayoutAttributeTop
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self.initialInstructionLabel
                                                        attribute:NSLayoutAttributeBottom
                                                       multiplier:1.0f
                                                         constant:0.0f],
                           //self.blueInstructionLabel
                           [NSLayoutConstraint constraintWithItem:self.blueInstructionLabel
                                                        attribute:NSLayoutAttributeLeading
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self
                                                        attribute:NSLayoutAttributeLeadingMargin
                                                       multiplier:1.0f
                                                         constant:0.0f],
                           [NSLayoutConstraint constraintWithItem:self.blueInstructionLabel
                                                        attribute:NSLayoutAttributeTrailing
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self
                                                        attribute:NSLayoutAttributeTrailingMargin
                                                       multiplier:1.0f
                                                         constant:0.0f],
                           [NSLayoutConstraint constraintWithItem:self.blueInstructionLabel
                                                        attribute:NSLayoutAttributeTop
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self.redInstructionLabel
                                                        attribute:NSLayoutAttributeBottom
                                                       multiplier:1.0f
                                                         constant:0.0f],
                           //self.greenInstructionLabel
                           [NSLayoutConstraint constraintWithItem:self.greenInstructionLabel
                                                        attribute:NSLayoutAttributeLeading
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self
                                                        attribute:NSLayoutAttributeLeadingMargin
                                                       multiplier:1.0f
                                                         constant:0.0f],
                           [NSLayoutConstraint constraintWithItem:self.greenInstructionLabel
                                                        attribute:NSLayoutAttributeTrailing
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self
                                                        attribute:NSLayoutAttributeTrailingMargin
                                                       multiplier:1.0f
                                                         constant:0.0f],
                           [NSLayoutConstraint constraintWithItem:self.greenInstructionLabel
                                                        attribute:NSLayoutAttributeTop
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self.blueInstructionLabel
                                                        attribute:NSLayoutAttributeBottom
                                                       multiplier:1.0f
                                                         constant:0.0f],
                           //self.submitButton
                           [NSLayoutConstraint constraintWithItem:self.submitButton
                                                        attribute:NSLayoutAttributeCenterX
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self
                                                        attribute:NSLayoutAttributeCenterX
                                                       multiplier:1.0f
                                                         constant:0.0f],
                           [NSLayoutConstraint constraintWithItem:self.submitButton
                                                        attribute:NSLayoutAttributeBottom
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self.myStatsButton
                                                        attribute:NSLayoutAttributeTop
                                                       multiplier:1.0f
                                                         constant:0.0f],
                           //self.instructionButton
                           [NSLayoutConstraint constraintWithItem:self.instructionButton
                                                        attribute:NSLayoutAttributeLeading
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self
                                                        attribute:NSLayoutAttributeLeadingMargin
                                                       multiplier:1.0f
                                                         constant:0.0f],
                           [NSLayoutConstraint constraintWithItem:self.instructionButton
                                                        attribute:NSLayoutAttributeBottom
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self
                                                        attribute:NSLayoutAttributeBottomMargin
                                                       multiplier:1.0f
                                                         constant:0.0f],
                           //self.myStatsButton
                           [NSLayoutConstraint constraintWithItem:self.myStatsButton
                                                        attribute:NSLayoutAttributeCenterX
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self
                                                        attribute:NSLayoutAttributeCenterX
                                                       multiplier:1.0f
                                                         constant:0.0f],
                           [NSLayoutConstraint constraintWithItem:self.myStatsButton
                                                        attribute:NSLayoutAttributeBottom
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self
                                                        attribute:NSLayoutAttributeBottomMargin
                                                       multiplier:1.0f
                                                         constant:0.0f],
                           //self.leaderboardButton
                           [NSLayoutConstraint constraintWithItem:self.leaderboardButton
                                                        attribute:NSLayoutAttributeTrailing
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self
                                                        attribute:NSLayoutAttributeTrailingMargin
                                                       multiplier:1.0f
                                                         constant:0.0f],
                           [NSLayoutConstraint constraintWithItem:self.leaderboardButton
                                                        attribute:NSLayoutAttributeBottom
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self
                                                        attribute:NSLayoutAttributeBottomMargin
                                                       multiplier:1.0f
                                                         constant:0.0f],
                           //self.touchView
                           [NSLayoutConstraint constraintWithItem:self.touchView
                                                        attribute:NSLayoutAttributeLeading
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self
                                                        attribute:NSLayoutAttributeLeadingMargin
                                                       multiplier:1.0f
                                                         constant:0.0f],
                           [NSLayoutConstraint constraintWithItem:self.touchView
                                                        attribute:NSLayoutAttributeTrailing
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self
                                                        attribute:NSLayoutAttributeTrailingMargin
                                                       multiplier:1.0f
                                                         constant:0.0f],
                           [NSLayoutConstraint constraintWithItem:self.touchView
                                                        attribute:NSLayoutAttributeTop
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self.greenInstructionLabel
                                                        attribute:NSLayoutAttributeBottom
                                                       multiplier:1.0f
                                                         constant:0.0f],
                           //Will want to change this one later
                           [NSLayoutConstraint constraintWithItem:self.touchView
                                                        attribute:NSLayoutAttributeHeight
                                                        relatedBy:NSLayoutRelationGreaterThanOrEqual
                                                           toItem:nil
                                                        attribute:NSLayoutAttributeNotAnAttribute
                                                       multiplier:1.0f
                                                         constant:100.0f]
         ]];
}

@end
