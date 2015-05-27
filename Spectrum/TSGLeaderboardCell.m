//
//  TSGLeaderboardCell.m
//  Spectrum
//
//  Created by Connor Neville on 5/27/15.
//  Copyright (c) 2015 connorneville. All rights reserved.
//

#import "TSGLeaderboardCell.h"
#import "AppDelegate.h"

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

- (void) setStyleForRowIndex: (int) rowIndex {
    if(rowIndex % 2 == 0) {
        self.backgroundColor = [[UIColor darkGrayColor] colorWithAlphaComponent:0.4f];
    }
    else {
        self.backgroundColor = [UIColor clearColor];
    }
}

- (void) clearControls {
    if ([self subviews]) {
        for (UIView *subview in [self subviews]) {
            [subview removeFromSuperview];
        }
    }
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
