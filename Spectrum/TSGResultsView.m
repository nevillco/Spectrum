//
//  TSGResultsView.m
//  Spectrum
//
//  Created by Connor Neville on 5/25/15.
//  Copyright (c) 2015 connorneville. All rights reserved.
//

#import "TSGResultsView.h"
#import "AppDelegate.h"

@implementation TSGResultsView

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
    self.titleLabel = [[CNLabel alloc] initWithText:@"Results"];
    self.titleLabel.font = [UIFont fontWithName:[AppDelegate fontName] size:28.0f];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview: self.titleLabel];
    
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
    
    //self.guessRGBLabel
    self.guessRGBLabel = [[CNLabel alloc] initWithText:@"(0, 0, 0)"];
    self.guessRGBLabel.font = [UIFont fontWithName:[AppDelegate fontName] size:18.0f];
    self.guessRGBLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.guessView addSubview: self.guessRGBLabel];
    
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
    
    //self.goalRGBLabel
    self.goalRGBLabel = [[CNLabel alloc] initWithText:@"(0, 0, 0)"];
    self.goalRGBLabel.font = [UIFont fontWithName:[AppDelegate fontName] size:18.0f];
    self.goalRGBLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.goalView addSubview: self.goalRGBLabel];
    
    //self.rawScoreLabel
    self.rawScoreLabel = [[CNLabel alloc] initWithText:@"Raw score: 000"];
    self.rawScoreLabel.font = [UIFont fontWithName:[AppDelegate fontName] size:18.0f];
    self.rawScoreLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview: self.rawScoreLabel];
    
    //self.multipliersLabel
    self.multipliersLabel = [[CNLabel alloc] initWithText:@"(*1.0) multiplier a\n(*1.0) multiplier b\n(*1.0) multiplier c\n(*1.0) multiplier d"];
    self.multipliersLabel.font = [UIFont fontWithName:[AppDelegate fontName] size:14.0f];
    self.multipliersLabel.minimumScaleFactor = 0.6f;
    self.multipliersLabel.adjustsFontSizeToFitWidth = TRUE;
    self.multipliersLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview: self.multipliersLabel];
    
    //self.finalScoreLabel
    self.finalScoreLabel = [[CNLabel alloc] initWithText:@"Final score: 000"];
    self.finalScoreLabel.font = [UIFont fontWithName:[AppDelegate fontName] size:18.0f];
    self.finalScoreLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview: self.finalScoreLabel];
    
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
    [self addConstraints: @[//self.titleLabel
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
                            //self.guessView
                            //This view's leading and trailing go beyond the superview bounds
                            //so the user doesn't see the vertical borders
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
                                                         attribute:NSLayoutAttributeTop
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self.titleLabel
                                                         attribute:NSLayoutAttributeBottom
                                                        multiplier:1.0f
                                                          constant:8.0f],
                            //self.guessColorSquare
                            [NSLayoutConstraint constraintWithItem:self.guessColorSquare
                                                         attribute:NSLayoutAttributeLeading
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self.guessView
                                                         attribute:NSLayoutAttributeLeadingMargin
                                                        multiplier:1.0f
                                                          constant:5.0f],
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
                                                         attribute:NSLayoutAttributeLeading
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self.guessColorSquare
                                                         attribute:NSLayoutAttributeTrailing
                                                        multiplier:1.0f
                                                          constant:8.0f],
                            [NSLayoutConstraint constraintWithItem:self.guessLabel
                                                         attribute:NSLayoutAttributeCenterY
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self.guessColorSquare
                                                         attribute:NSLayoutAttributeCenterY
                                                        multiplier:1.0f
                                                          constant:0.0f],
                            //self.guessRGBLabel
                            [NSLayoutConstraint constraintWithItem:self.guessRGBLabel
                                                         attribute:NSLayoutAttributeTrailing
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self.guessView
                                                         attribute:NSLayoutAttributeTrailingMargin
                                                        multiplier:1.0f
                                                          constant:-5.0f],
                            [NSLayoutConstraint constraintWithItem:self.guessRGBLabel
                                                         attribute:NSLayoutAttributeCenterY
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self.guessColorSquare
                                                         attribute:NSLayoutAttributeCenterY
                                                        multiplier:1.0f
                                                          constant:0.0f],
                            //self.goalView
                            //This view's leading and trailing go beyond the superview bounds
                            //so the user doesn't see the vertical borders
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
                                                         attribute:NSLayoutAttributeTop
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self.guessView
                                                         attribute:NSLayoutAttributeBottom
                                                        multiplier:1.0f
                                                          constant:10.0f],
                            //self.goalColorSquare
                            [NSLayoutConstraint constraintWithItem:self.goalColorSquare
                                                         attribute:NSLayoutAttributeTrailing
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self.goalView
                                                         attribute:NSLayoutAttributeTrailingMargin
                                                        multiplier:1.0f
                                                          constant:-5.0f],
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
                            //goalLabel
                            [NSLayoutConstraint constraintWithItem:self.goalLabel
                                                         attribute:NSLayoutAttributeTrailing
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self.goalColorSquare
                                                         attribute:NSLayoutAttributeLeading
                                                        multiplier:1.0f
                                                          constant:-8.0f],
                            [NSLayoutConstraint constraintWithItem:self.goalLabel
                                                         attribute:NSLayoutAttributeCenterY
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self.goalColorSquare
                                                         attribute:NSLayoutAttributeCenterY
                                                        multiplier:1.0f
                                                          constant:0.0f],
                            //self.goalRGBLabel
                            [NSLayoutConstraint constraintWithItem:self.goalRGBLabel
                                                         attribute:NSLayoutAttributeLeading
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self.goalView
                                                         attribute:NSLayoutAttributeLeadingMargin
                                                        multiplier:1.0f
                                                          constant:5.0f],
                            [NSLayoutConstraint constraintWithItem:self.goalRGBLabel
                                                         attribute:NSLayoutAttributeCenterY
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self.goalView
                                                         attribute:NSLayoutAttributeCenterY
                                                        multiplier:1.0f
                                                          constant:0.0f],
                            //self.rawScoreLabel
                            [NSLayoutConstraint constraintWithItem:self.rawScoreLabel
                                                         attribute:NSLayoutAttributeLeading
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeLeadingMargin
                                                        multiplier:1.0f
                                                          constant:0.0f],
                            [NSLayoutConstraint constraintWithItem:self.rawScoreLabel
                                                         attribute:NSLayoutAttributeTop
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self.goalView
                                                         attribute:NSLayoutAttributeBottom
                                                        multiplier:1.0f
                                                          constant:8.0f],
                            //self.multipliersLabel
                            [NSLayoutConstraint constraintWithItem:self.multipliersLabel
                                                         attribute:NSLayoutAttributeLeading
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeLeadingMargin
                                                        multiplier:1.0f
                                                          constant:0.0f],
                            [NSLayoutConstraint constraintWithItem:self.multipliersLabel
                                                         attribute:NSLayoutAttributeTop
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self.rawScoreLabel
                                                         attribute:NSLayoutAttributeBottom
                                                        multiplier:1.0f
                                                          constant:8.0f],
                            //self.finalScoreLabel
                            [NSLayoutConstraint constraintWithItem:self.finalScoreLabel
                                                         attribute:NSLayoutAttributeLeading
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeLeadingMargin
                                                        multiplier:1.0f
                                                          constant:0.0f],
                            [NSLayoutConstraint constraintWithItem:self.finalScoreLabel
                                                         attribute:NSLayoutAttributeBottom
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self.goBackButton
                                                         attribute:NSLayoutAttributeTop
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
