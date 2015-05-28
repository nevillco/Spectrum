//
//  TSGLeaderboardCell.m
//  Spectrum
//
//  Created by Connor Neville on 5/27/15.
//  Copyright (c) 2015 connorneville. All rights reserved.
//

#import "TSGLeaderboardCell.h"
#import "AppDelegate.h"
#import "UIColor+TSGColorPresets.h"

@implementation TSGLeaderboardCell

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
}

- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self) {
        [self setBackgroundColor: [UIColor clearColor]];
        [self clearControls];
        [self makeControls];
        [self makeControlConstraints];
    }
    return self;
}

//Style based on row number
- (void) setStyleForRowIndex: (int) rowIndex {
    if(rowIndex == 0) {
        self.backgroundColor = [UIColor TSGGoldColor];
    }
    else if(rowIndex == 1) {
        self.backgroundColor = [UIColor TSGSilverColor];
    }
    else if(rowIndex == 2) {
        self.backgroundColor = [UIColor TSGBronzeColor];
    }
    else if(rowIndex % 2 == 0) {
        self.backgroundColor = [[UIColor darkGrayColor] colorWithAlphaComponent:0.3f];
    }
    else {
        self.backgroundColor = [[UIColor darkGrayColor] colorWithAlphaComponent:0.6f];
    }
}

//Remove all existing controls (only call on init)
- (void) clearControls {
    if ([self subviews]) {
        for (UIView *subview in [self subviews]) {
            [subview removeFromSuperview];
        }
    }
}

- (void) makeLabelsEmpty {
    self.playerNameLabel.text = @"";
    self.scoreLabel.text = @"";
}

- (void) updateLabelsWithEntry: (PFObject*) entry {
    self.playerNameLabel.text = entry[@"playerName"];
    self.scoreLabel.text = [entry[@"score"] stringValue];
}

- (void) makeControls {
    self.playerNameLabel = [[CNLabel alloc] initWithText:@"Player Name"];
    self.playerNameLabel.font = [UIFont fontWithName:[AppDelegate fontName] size:14.0f];
    self.playerNameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview: self.playerNameLabel];
    
    self.scoreLabel = [[CNLabel alloc] initWithText:@"9000"];
    self.scoreLabel.font = [UIFont fontWithName:[AppDelegate boldFontName] size:20.0f];
    self.scoreLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview: self.scoreLabel];
}

- (void) makeControlConstraints {
    [self addConstraints: @[//self.playerNameLabel
                            [NSLayoutConstraint constraintWithItem:self.playerNameLabel
                                                         attribute:NSLayoutAttributeCenterY
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeCenterY
                                                        multiplier:1.0f
                                                          constant:0.0f],
                            [NSLayoutConstraint constraintWithItem:self.playerNameLabel
                                                         attribute:NSLayoutAttributeLeading
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeLeadingMargin
                                                        multiplier:1.0f
                                                          constant:0.0f],
                            //self.scoreLabel
                            [NSLayoutConstraint constraintWithItem:self.scoreLabel
                                                         attribute:NSLayoutAttributeCenterY
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeCenterY
                                                        multiplier:1.0f
                                                          constant:0.0f],
                            [NSLayoutConstraint constraintWithItem:self.scoreLabel
                                                         attribute:NSLayoutAttributeTrailing
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeTrailingMargin
                                                        multiplier:1.0f
                                                          constant:0.0f],
                            ]];
}

@end
