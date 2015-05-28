//
//  TSGStatsView.m
//  Spectrum
//
//  Created by Connor Neville on 5/27/15.
//  Copyright (c) 2015 connorneville. All rights reserved.
//

#import "TSGStatsView.h"
#import "AppDelegate.h"
#import "UIColor+TSGColorPresets.h"

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

- (void)updateWithStatistics:(NSDictionary *)statistics {
    NSNumber* totalScore = ((NSNumber*)statistics[@"totalScore"]);
    int numAttempts = ((NSNumber*)statistics[@"numTries"]).intValue;
    double averageScore = ((NSNumber*)statistics[@"averageScore"]).doubleValue;
    int topScore = ((NSNumber*)statistics[@"topScore"]).intValue;
    [self.totalScoreLabel setText: [NSString stringWithFormat:@"%@ total score",[TSGStatsView numberWithShortcut:totalScore]]];
    [self.numAttemptsLabel setText:[NSString stringWithFormat:@"%d total plays",numAttempts]];
    [self.averageScoreLabel setText:[NSString stringWithFormat:@"%.2f average score",averageScore]];
    [self.topScoreLabel setText:[NSString stringWithFormat:@"%d best score",topScore]];
    
    int platinum = ((NSNumber*)statistics[@"platinum"]).intValue;
    int gold = ((NSNumber*)statistics[@"gold"]).intValue;
    int silver = ((NSNumber*)statistics[@"silver"]).intValue;
    int bronze = ((NSNumber*)statistics[@"bronze"]).intValue;
    [self.platinumMedalsLabel setText:[NSString stringWithFormat:@"%d platinum medals", platinum]];
    [self.goldMedalsLabel setText:[NSString stringWithFormat:@"%d gold medals", gold]];
    [self.silverMedalsLabel setText:[NSString stringWithFormat:@"%d silver medals", silver]];
    [self.bronzeMedalsLabel setText:[NSString stringWithFormat:@"%d bronze medals", bronze]];
}

+(NSString*)numberWithShortcut:(NSNumber*)number
{
    unsigned long long value = [number longLongValue];
    
    NSUInteger index = 0;
    double dvalue = (double)value;
    
    NSArray *suffix = @[ @"", @"K", @"M", @"B", @"T", @"P", @"E" ];
    
    while ((value /= 1000) && ++index) dvalue /= 1000;
    
    NSString *svalue = [NSString stringWithFormat:@"%@%@",[NSNumber numberWithDouble:dvalue], [suffix objectAtIndex:index]];
    
    return svalue;
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
    
    //self.platinumColorView
    self.platinumColorView = [[TSGColorView alloc] initWithColor:[UIColor whiteColor]];
    self.platinumColorView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview: self.platinumColorView];
    
    //self.platinumMedalsLabel
    self.platinumMedalsLabel = [[CNLabel alloc] initWithText:@"0 platinum medals"];
    self.platinumMedalsLabel.font = [UIFont fontWithName:[AppDelegate boldFontName] size:16.0f];
    self.platinumMedalsLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview: self.platinumMedalsLabel];
    
    //self.platinumDescriptionLabel
    self.platinumDescriptionLabel = [[CNLabel alloc] initWithText:[NSString stringWithFormat:@"requires perfect %d raw score", [AppDelegate platinumThreshold]]];
    self.platinumDescriptionLabel.font = [UIFont fontWithName:[AppDelegate fontName] size:13.0f];
    self.platinumDescriptionLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview: self.platinumDescriptionLabel];
    
    //self.goldColorView
    self.goldColorView = [[TSGColorView alloc] initWithColor:[UIColor TSGGoldColor]];
    self.goldColorView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview: self.goldColorView];
    
    //self.goldMedalsLabel
    self.goldMedalsLabel = [[CNLabel alloc] initWithText:@"0 gold medals"];
    self.goldMedalsLabel.font = [UIFont fontWithName:[AppDelegate boldFontName] size:16.0f];
    self.goldMedalsLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview: self.goldMedalsLabel];
    
    //self.goldDescriptionLabel
    self.goldDescriptionLabel = [[CNLabel alloc] initWithText:[NSString stringWithFormat:@"requires %d raw score", [AppDelegate goldThreshold]]];
    self.goldDescriptionLabel.font = [UIFont fontWithName:[AppDelegate fontName] size:13.0f];
    self.goldDescriptionLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview: self.goldDescriptionLabel];
    
    //self.silverColorView
    self.silverColorView = [[TSGColorView alloc] initWithColor:[UIColor TSGSilverColor]];
    self.silverColorView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview: self.silverColorView];
    
    //self.silverMedalsLabel
    self.silverMedalsLabel = [[CNLabel alloc] initWithText:@"0 silver medals"];
    self.silverMedalsLabel.font = [UIFont fontWithName:[AppDelegate boldFontName] size:16.0f];
    self.silverMedalsLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview: self.silverMedalsLabel];
    
    //self.silverDescriptionLabel
    self.silverDescriptionLabel = [[CNLabel alloc] initWithText:[NSString stringWithFormat:@"requires %d raw score", [AppDelegate silverThreshold]]];
    self.silverDescriptionLabel.font = [UIFont fontWithName:[AppDelegate fontName] size:13.0f];
    self.silverDescriptionLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview: self.silverDescriptionLabel];
    
    //self.bronzeColorView
    self.bronzeColorView = [[TSGColorView alloc] initWithColor:[UIColor TSGBronzeColor]];
    self.bronzeColorView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview: self.bronzeColorView];
    
    //self.bronzeMedalsLabel
    self.bronzeMedalsLabel = [[CNLabel alloc] initWithText:@"0 bronze medals"];
    self.bronzeMedalsLabel.font = [UIFont fontWithName:[AppDelegate boldFontName] size:16.0f];
    self.bronzeMedalsLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview: self.bronzeMedalsLabel];
    
    //self.silverDescriptionLabel
    self.bronzeDescriptionLabel = [[CNLabel alloc] initWithText:[NSString stringWithFormat:@"requires %d raw score", [AppDelegate bronzeThreshold]]];
    self.bronzeDescriptionLabel.font = [UIFont fontWithName:[AppDelegate fontName] size:13.0f];
    self.bronzeDescriptionLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview: self.bronzeDescriptionLabel];
    
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
                           //self.platinumColorView
                           [NSLayoutConstraint constraintWithItem:self.platinumColorView
                                                        attribute:NSLayoutAttributeLeading
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self
                                                        attribute:NSLayoutAttributeLeadingMargin
                                                       multiplier:1.0f
                                                         constant:0.0f],
                           [NSLayoutConstraint constraintWithItem:self.platinumColorView
                                                        attribute:NSLayoutAttributeTop
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self.topScoreLabel
                                                        attribute:NSLayoutAttributeBottom
                                                       multiplier:1.0f
                                                         constant:16.0f],
                           [NSLayoutConstraint constraintWithItem:self.platinumColorView
                                                        attribute:NSLayoutAttributeWidth
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:nil
                                                        attribute:NSLayoutAttributeNotAnAttribute
                                                       multiplier:1.0f
                                                         constant:40.0f],
                           //self.platinumMedalsLabel
                           [NSLayoutConstraint constraintWithItem:self.platinumMedalsLabel
                                                        attribute:NSLayoutAttributeLeading
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self.platinumColorView
                                                        attribute:NSLayoutAttributeTrailing
                                                       multiplier:1.0f
                                                         constant:5.0f],
                           [NSLayoutConstraint constraintWithItem:self.platinumMedalsLabel
                                                        attribute:NSLayoutAttributeTop
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self.platinumColorView
                                                        attribute:NSLayoutAttributeTop
                                                       multiplier:1.0f
                                                         constant:0.0f],
                           [NSLayoutConstraint constraintWithItem:self.platinumMedalsLabel
                                                        attribute:NSLayoutAttributeTrailing
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self
                                                        attribute:NSLayoutAttributeTrailingMargin
                                                       multiplier:1.0f
                                                         constant:0.0f],
                           //self.platinumDescriptionLabel
                           [NSLayoutConstraint constraintWithItem:self.platinumDescriptionLabel
                                                        attribute:NSLayoutAttributeLeading
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self.platinumColorView
                                                        attribute:NSLayoutAttributeTrailing
                                                       multiplier:1.0f
                                                         constant:5.0f],
                           [NSLayoutConstraint constraintWithItem:self.platinumDescriptionLabel
                                                        attribute:NSLayoutAttributeTrailing
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self
                                                        attribute:NSLayoutAttributeTrailingMargin
                                                       multiplier:1.0f
                                                         constant:0.0f],
                           [NSLayoutConstraint constraintWithItem:self.platinumDescriptionLabel
                                                        attribute:NSLayoutAttributeBottom
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self.platinumColorView
                                                        attribute:NSLayoutAttributeBottom
                                                       multiplier:1.0f
                                                         constant:0.0f],
                           //self.goldColorView
                           [NSLayoutConstraint constraintWithItem:self.goldColorView
                                                        attribute:NSLayoutAttributeLeading
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self
                                                        attribute:NSLayoutAttributeLeadingMargin
                                                       multiplier:1.0f
                                                         constant:0.0f],
                           [NSLayoutConstraint constraintWithItem:self.goldColorView
                                                        attribute:NSLayoutAttributeTop
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self.platinumColorView
                                                        attribute:NSLayoutAttributeBottom
                                                       multiplier:1.0f
                                                         constant:8.0f],
                           [NSLayoutConstraint constraintWithItem:self.goldColorView
                                                        attribute:NSLayoutAttributeWidth
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:nil
                                                        attribute:NSLayoutAttributeNotAnAttribute
                                                       multiplier:1.0f
                                                         constant:40.0f],
                           //self.goldMedalsLabel
                           [NSLayoutConstraint constraintWithItem:self.goldMedalsLabel
                                                        attribute:NSLayoutAttributeLeading
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self.goldColorView
                                                        attribute:NSLayoutAttributeTrailing
                                                       multiplier:1.0f
                                                         constant:5.0f],
                           [NSLayoutConstraint constraintWithItem:self.goldMedalsLabel
                                                        attribute:NSLayoutAttributeTop
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self.goldColorView
                                                        attribute:NSLayoutAttributeTop
                                                       multiplier:1.0f
                                                         constant:0.0f],
                           [NSLayoutConstraint constraintWithItem:self.goldMedalsLabel
                                                        attribute:NSLayoutAttributeTrailing
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self
                                                        attribute:NSLayoutAttributeTrailingMargin
                                                       multiplier:1.0f
                                                         constant:0.0f],
                           //self.goldDescriptionLabel
                           [NSLayoutConstraint constraintWithItem:self.goldDescriptionLabel
                                                        attribute:NSLayoutAttributeLeading
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self.goldColorView
                                                        attribute:NSLayoutAttributeTrailing
                                                       multiplier:1.0f
                                                         constant:5.0f],
                           [NSLayoutConstraint constraintWithItem:self.goldDescriptionLabel
                                                        attribute:NSLayoutAttributeTrailing
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self
                                                        attribute:NSLayoutAttributeTrailingMargin
                                                       multiplier:1.0f
                                                         constant:0.0f],
                           [NSLayoutConstraint constraintWithItem:self.goldDescriptionLabel
                                                        attribute:NSLayoutAttributeBottom
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self.goldColorView
                                                        attribute:NSLayoutAttributeBottom
                                                       multiplier:1.0f
                                                         constant:0.0f],
                           //self.silverColorView
                           [NSLayoutConstraint constraintWithItem:self.silverColorView
                                                        attribute:NSLayoutAttributeLeading
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self
                                                        attribute:NSLayoutAttributeLeadingMargin
                                                       multiplier:1.0f
                                                         constant:0.0f],
                           [NSLayoutConstraint constraintWithItem:self.silverColorView
                                                        attribute:NSLayoutAttributeTop
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self.goldColorView
                                                        attribute:NSLayoutAttributeBottom
                                                       multiplier:1.0f
                                                         constant:8.0f],
                           [NSLayoutConstraint constraintWithItem:self.silverColorView
                                                        attribute:NSLayoutAttributeWidth
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:nil
                                                        attribute:NSLayoutAttributeNotAnAttribute
                                                       multiplier:1.0f
                                                         constant:40.0f],
                           //self.silverMedalsLabel
                           [NSLayoutConstraint constraintWithItem:self.silverMedalsLabel
                                                        attribute:NSLayoutAttributeLeading
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self.silverColorView
                                                        attribute:NSLayoutAttributeTrailing
                                                       multiplier:1.0f
                                                         constant:5.0f],
                           [NSLayoutConstraint constraintWithItem:self.silverMedalsLabel
                                                        attribute:NSLayoutAttributeTop
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self.silverColorView
                                                        attribute:NSLayoutAttributeTop
                                                       multiplier:1.0f
                                                         constant:0.0f],
                           [NSLayoutConstraint constraintWithItem:self.silverMedalsLabel
                                                        attribute:NSLayoutAttributeTrailing
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self
                                                        attribute:NSLayoutAttributeTrailingMargin
                                                       multiplier:1.0f
                                                         constant:0.0f],
                           //self.silverDescriptionLabel
                           [NSLayoutConstraint constraintWithItem:self.silverDescriptionLabel
                                                        attribute:NSLayoutAttributeLeading
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self.silverColorView
                                                        attribute:NSLayoutAttributeTrailing
                                                       multiplier:1.0f
                                                         constant:5.0f],
                           [NSLayoutConstraint constraintWithItem:self.silverDescriptionLabel
                                                        attribute:NSLayoutAttributeTrailing
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self
                                                        attribute:NSLayoutAttributeTrailingMargin
                                                       multiplier:1.0f
                                                         constant:0.0f],
                           [NSLayoutConstraint constraintWithItem:self.silverDescriptionLabel
                                                        attribute:NSLayoutAttributeBottom
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self.silverColorView
                                                        attribute:NSLayoutAttributeBottom
                                                       multiplier:1.0f
                                                         constant:0.0f],
                           //self.bronzeColorView
                           [NSLayoutConstraint constraintWithItem:self.bronzeColorView
                                                        attribute:NSLayoutAttributeLeading
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self
                                                        attribute:NSLayoutAttributeLeadingMargin
                                                       multiplier:1.0f
                                                         constant:0.0f],
                           [NSLayoutConstraint constraintWithItem:self.bronzeColorView
                                                        attribute:NSLayoutAttributeTop
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self.silverColorView
                                                        attribute:NSLayoutAttributeBottom
                                                       multiplier:1.0f
                                                         constant:8.0f],
                           [NSLayoutConstraint constraintWithItem:self.bronzeColorView
                                                        attribute:NSLayoutAttributeWidth
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:nil
                                                        attribute:NSLayoutAttributeNotAnAttribute
                                                       multiplier:1.0f
                                                         constant:40.0f],
                           //self.bronzeMedalsLabel
                           [NSLayoutConstraint constraintWithItem:self.bronzeMedalsLabel
                                                        attribute:NSLayoutAttributeLeading
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self.bronzeColorView
                                                        attribute:NSLayoutAttributeTrailing
                                                       multiplier:1.0f
                                                         constant:5.0f],
                           [NSLayoutConstraint constraintWithItem:self.bronzeMedalsLabel
                                                        attribute:NSLayoutAttributeTop
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self.bronzeColorView
                                                        attribute:NSLayoutAttributeTop
                                                       multiplier:1.0f
                                                         constant:0.0f],
                           [NSLayoutConstraint constraintWithItem:self.bronzeMedalsLabel
                                                        attribute:NSLayoutAttributeTrailing
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self
                                                        attribute:NSLayoutAttributeTrailingMargin
                                                       multiplier:1.0f
                                                         constant:0.0f],
                           //self.bronzeDescriptionLabel
                           [NSLayoutConstraint constraintWithItem:self.bronzeDescriptionLabel
                                                        attribute:NSLayoutAttributeLeading
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self.bronzeColorView
                                                        attribute:NSLayoutAttributeTrailing
                                                       multiplier:1.0f
                                                         constant:5.0f],
                           [NSLayoutConstraint constraintWithItem:self.bronzeDescriptionLabel
                                                        attribute:NSLayoutAttributeTrailing
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self
                                                        attribute:NSLayoutAttributeTrailingMargin
                                                       multiplier:1.0f
                                                         constant:0.0f],
                           [NSLayoutConstraint constraintWithItem:self.bronzeDescriptionLabel
                                                        attribute:NSLayoutAttributeBottom
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self.bronzeColorView
                                                        attribute:NSLayoutAttributeBottom
                                                       multiplier:1.0f
                                                         constant:0.0f],
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
