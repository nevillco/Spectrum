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
        [self setBackgroundColor: [UIColor whiteColor]];
        [self makeControls];
        [self makeControlConstraints];
    }
    return self;
}

- (void) setGuessColor:(UIColor *)guessColor {
    [self.guessColorSquare setBackgroundColor: guessColor];
    [self.guessView setBackgroundColor:[guessColor colorWithAlphaComponent: 0.5f]];
}

- (void) setGoalColor:(UIColor *)goalColor {
    [self.goalColorSquare setBackgroundColor:goalColor];
    [self.goalView setBackgroundColor: [goalColor colorWithAlphaComponent: 0.5f]];
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
    self.initialInstructionLabel = [[CNLabel alloc] initWithText:@"The goal of the Spectrum Game is simple: try to match the goal color below by tapping and holding somewhere in the box. For more instructions, click the button in the bottom left."];
    self.initialInstructionLabel.font = [UIFont fontWithName:[AppDelegate fontName] size:12.0f];
    self.initialInstructionLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview: self.initialInstructionLabel];
    
    //self.touchView
    self.touchView = [[TSGTouchableView alloc] init];
    self.touchView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview: self.touchView];
    
    //self.redProgress
    self.redProgress = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleDefault];
    self.redProgress.progressTintColor = [UIColor redColor];
    self.redProgress.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview: self.redProgress];
    
    //self.blueProgress
    self.blueProgress = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleDefault];
    self.blueProgress.progressTintColor = [UIColor blueColor];
    self.blueProgress.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview: self.blueProgress];
    
    //self.greenProgress
    self.greenProgress = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleDefault];
    self.greenProgress.progressTintColor = [UIColor greenColor];
    self.greenProgress.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview: self.greenProgress];
    
    //self.guessView
    self.guessView = [[UIView alloc] init];
    self.guessView.backgroundColor = [UIColor whiteColor];
    self.guessView.translatesAutoresizingMaskIntoConstraints = NO;
    self.guessView.layer.borderWidth = 1.0f;
    self.guessView.layer.borderColor = [UIColor blackColor].CGColor;
    [self addSubview: self.guessView];
    
    //self.guessColorSquare
    self.guessColorSquare = [[TSGColorView alloc] initWithColor: [UIColor redColor]];
    self.guessColorSquare.translatesAutoresizingMaskIntoConstraints = NO;
    [self.guessView addSubview: self.guessColorSquare];
    
    //self.guessLabel
    self.guessLabel = [[CNLabel alloc] initWithText:@"Guess color"];
    self.guessLabel.font = [UIFont fontWithName:[AppDelegate fontName] size:18.0f];
    self.guessLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.guessView addSubview: self.guessLabel];
    
    //self.goalView
    self.goalView = [[UIView alloc] init];
    self.goalView.backgroundColor = [UIColor whiteColor];
    self.goalView.translatesAutoresizingMaskIntoConstraints = NO;
    self.goalView.layer.borderWidth = 1.0f;
    self.goalView.layer.borderColor = [UIColor blackColor].CGColor;
    [self addSubview: self.goalView];
    
    //self.goalColorSquare
    self.goalColorSquare = [[TSGColorView alloc] initWithColor: [UIColor redColor]];
    self.goalColorSquare.translatesAutoresizingMaskIntoConstraints = NO;
    [self.goalView addSubview: self.goalColorSquare];
    
    //self.goalLabel
    self.goalLabel = [[CNLabel alloc] initWithText:@"Goal color"];
    self.goalLabel.font = [UIFont fontWithName:[AppDelegate fontName] size:18.0f];
    self.goalLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.goalView addSubview: self.goalLabel];
    
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

//Make constraints for each property
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
                                                           toItem:self.initialInstructionLabel
                                                        attribute:NSLayoutAttributeBottom
                                                       multiplier:1.0f
                                                         constant:8.0f],
                           [NSLayoutConstraint constraintWithItem:self.touchView
                                                        attribute:NSLayoutAttributeBottom
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self.redProgress
                                                        attribute:NSLayoutAttributeTop
                                                       multiplier:1.0f
                                                         constant:-10.0f],
                           //self.redProgress
                           [NSLayoutConstraint constraintWithItem:self.redProgress
                                                        attribute:NSLayoutAttributeLeading
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self
                                                        attribute:NSLayoutAttributeLeadingMargin
                                                       multiplier:1.0f
                                                         constant:0.0f],
                           [NSLayoutConstraint constraintWithItem:self.redProgress
                                                        attribute:NSLayoutAttributeTrailing
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self
                                                        attribute:NSLayoutAttributeTrailingMargin
                                                       multiplier:1.0f
                                                         constant:0.0f],
                           [NSLayoutConstraint constraintWithItem:self.redProgress
                                                        attribute:NSLayoutAttributeBottom
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self.blueProgress
                                                        attribute:NSLayoutAttributeTop
                                                       multiplier:1.0f
                                                         constant:-10.0f],
                           //self.blueProgress
                           [NSLayoutConstraint constraintWithItem:self.blueProgress
                                                        attribute:NSLayoutAttributeLeading
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self
                                                        attribute:NSLayoutAttributeLeadingMargin
                                                       multiplier:1.0f
                                                         constant:0.0f],
                           [NSLayoutConstraint constraintWithItem:self.blueProgress
                                                        attribute:NSLayoutAttributeTrailing
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self
                                                        attribute:NSLayoutAttributeTrailingMargin
                                                       multiplier:1.0f
                                                         constant:0.0f],
                           [NSLayoutConstraint constraintWithItem:self.blueProgress
                                                        attribute:NSLayoutAttributeBottom
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self.greenProgress
                                                        attribute:NSLayoutAttributeTop
                                                       multiplier:1.0f
                                                         constant:-10.0f],
                           //self.greenProgress
                           [NSLayoutConstraint constraintWithItem:self.greenProgress
                                                        attribute:NSLayoutAttributeLeading
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self
                                                        attribute:NSLayoutAttributeLeadingMargin
                                                       multiplier:1.0f
                                                         constant:0.0f],
                           [NSLayoutConstraint constraintWithItem:self.greenProgress
                                                        attribute:NSLayoutAttributeTrailing
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self
                                                        attribute:NSLayoutAttributeTrailingMargin
                                                       multiplier:1.0f
                                                         constant:0.0f],
                           [NSLayoutConstraint constraintWithItem:self.greenProgress
                                                        attribute:NSLayoutAttributeBottom
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self.guessView
                                                        attribute:NSLayoutAttributeTop
                                                       multiplier:1.0f
                                                         constant:-10.0f],
                           //self.guessView
                           [NSLayoutConstraint constraintWithItem:self.guessView
                                                        attribute:NSLayoutAttributeLeading
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self
                                                        attribute:NSLayoutAttributeLeading
                                                       multiplier:1.0f
                                                         constant:-5.0f],
                           [NSLayoutConstraint constraintWithItem:self.guessView
                                                        attribute:NSLayoutAttributeTrailing
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self
                                                        attribute:NSLayoutAttributeTrailing
                                                       multiplier:1.0f
                                                         constant:5.0f],
                           [NSLayoutConstraint constraintWithItem:self.guessView
                                                        attribute:NSLayoutAttributeBottom
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self.goalView
                                                        attribute:NSLayoutAttributeTop
                                                       multiplier:1.0f
                                                         constant:-10.0f],
                           //self.guessColorSquare
                           [NSLayoutConstraint constraintWithItem:self.guessColorSquare
                                                        attribute:NSLayoutAttributeTrailing
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self.guessView
                                                        attribute:NSLayoutAttributeTrailingMargin
                                                       multiplier:1.0f
                                                         constant:-5.0f],
                           [NSLayoutConstraint constraintWithItem:self.guessColorSquare
                                                        attribute:NSLayoutAttributeWidth
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:nil
                                                        attribute:NSLayoutAttributeNotAnAttribute
                                                       multiplier:1.0f
                                                         constant:35.0f],
                           [NSLayoutConstraint constraintWithItem:self.guessColorSquare
                                                        attribute:NSLayoutAttributeTop
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self.guessView
                                                        attribute:NSLayoutAttributeTopMargin
                                                       multiplier:1.0f
                                                         constant:0.0f],
                           [NSLayoutConstraint constraintWithItem:self.guessColorSquare
                                                        attribute:NSLayoutAttributeBottom
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self.guessView
                                                        attribute:NSLayoutAttributeBottomMargin
                                                       multiplier:1.0f
                                                         constant:0.0f],
                           //self.guessLabel
                           [NSLayoutConstraint constraintWithItem:self.guessLabel
                                                        attribute:NSLayoutAttributeTrailing
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self.guessColorSquare
                                                        attribute:NSLayoutAttributeLeading
                                                       multiplier:1.0f
                                                         constant:-8.0f],
                           [NSLayoutConstraint constraintWithItem:self.guessLabel
                                                        attribute:NSLayoutAttributeCenterY
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self.guessColorSquare
                                                        attribute:NSLayoutAttributeCenterY
                                                       multiplier:1.0f
                                                         constant:0.0f],
                           //self.goalView
                           [NSLayoutConstraint constraintWithItem:self.goalView
                                                        attribute:NSLayoutAttributeLeading
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self
                                                        attribute:NSLayoutAttributeLeading
                                                       multiplier:1.0f
                                                         constant:-5.0f],
                           [NSLayoutConstraint constraintWithItem:self.goalView
                                                        attribute:NSLayoutAttributeTrailing
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self
                                                        attribute:NSLayoutAttributeTrailing
                                                       multiplier:1.0f
                                                         constant:5.0f],
                           [NSLayoutConstraint constraintWithItem:self.goalView
                                                        attribute:NSLayoutAttributeBottom
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self.submitButton
                                                        attribute:NSLayoutAttributeTop
                                                       multiplier:1.0f
                                                         constant:0.0f],
                           //self.goalColorSquare
                           [NSLayoutConstraint constraintWithItem:self.goalColorSquare
                                                        attribute:NSLayoutAttributeLeading
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self.goalView
                                                        attribute:NSLayoutAttributeLeadingMargin
                                                       multiplier:1.0f
                                                         constant:5.0f],
                           [NSLayoutConstraint constraintWithItem:self.goalColorSquare
                                                        attribute:NSLayoutAttributeWidth
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:nil
                                                        attribute:NSLayoutAttributeNotAnAttribute
                                                       multiplier:1.0f
                                                         constant:35.0f],
                           [NSLayoutConstraint constraintWithItem:self.goalColorSquare
                                                        attribute:NSLayoutAttributeTop
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self.goalView
                                                        attribute:NSLayoutAttributeTopMargin
                                                       multiplier:1.0f
                                                         constant:0.0f],
                           [NSLayoutConstraint constraintWithItem:self.goalColorSquare
                                                        attribute:NSLayoutAttributeBottom
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self.goalView
                                                        attribute:NSLayoutAttributeBottomMargin
                                                       multiplier:1.0f
                                                         constant:0.0f],
                           //self.goalLabel
                           [NSLayoutConstraint constraintWithItem:self.goalLabel
                                                        attribute:NSLayoutAttributeLeading
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self.goalColorSquare
                                                        attribute:NSLayoutAttributeTrailing
                                                       multiplier:1.0f
                                                         constant:8.0f],
                           [NSLayoutConstraint constraintWithItem:self.goalLabel
                                                        attribute:NSLayoutAttributeCenterY
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self.goalColorSquare
                                                        attribute:NSLayoutAttributeCenterY
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
                                                         constant:0.0f]
         ]];
}

@end
