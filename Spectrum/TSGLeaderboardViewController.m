//
//  TSGLeaderboardViewController.m
//  Spectrum
//
//  Created by Connor Neville on 5/27/15.
//  Copyright (c) 2015 connorneville. All rights reserved.
//

#import "TSGLeaderboardViewController.h"
#import "TSGLeaderboardView.h"

@interface TSGLeaderboardViewController ()

@end

@implementation TSGLeaderboardViewController

- (void) loadView {
    TSGLeaderboardView* view = [[TSGLeaderboardView alloc] init];
    self.view = view;
}

- (id) init {
    self = [super init];
    if(self) {
        [self addActions];
    }
    return self;
}

- (void) addActions {
    TSGLeaderboardView* view = (TSGLeaderboardView*) self.view;
    [view.goBackButton addTarget:self action:@selector(goBackButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
}

- (void) goBackButtonPressed: (id) sender {
    [self dismissViewControllerAnimated:TRUE completion:nil];
}

@end
