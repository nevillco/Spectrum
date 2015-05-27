//
//  TSGStatsViewController.m
//  Spectrum
//
//  Created by Connor Neville on 5/27/15.
//  Copyright (c) 2015 connorneville. All rights reserved.
//

#import "TSGStatsViewController.h"
#import "TSGHomeViewController.h"
#import "TSGStatsView.h"
#import "AppDelegate.h"

@interface TSGStatsViewController ()

@end

@implementation TSGStatsViewController

- (void) loadView {
    TSGStatsView* view = [[TSGStatsView alloc] init];
    self.view = view;
    NSDictionary* localStats = [AppDelegate getLocalUserStats];
    [view updateWithStatistics: localStats];
}

- (id) init {
    self = [super init];
    if(self) {
        [self addActions];
    }
    return self;
}

#pragma mark actions/view communication
- (void) addActions {
    TSGStatsView* view = (TSGStatsView*) self.view;
    [view.goBackButton addTarget:self action:@selector(goBackButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
}

- (void) goBackButtonPressed: (id) sender {
    TSGHomeViewController* presenter = (TSGHomeViewController*) self.presentingViewController;
    [presenter reload];
    [self dismissViewControllerAnimated:true completion:nil];
}

@end
