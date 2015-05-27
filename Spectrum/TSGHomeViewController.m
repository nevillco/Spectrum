//
//  TSGHomeViewController.m
//  Spectrum
//
//  Created by Connor Neville on 5/23/15.
//  Copyright (c) 2015 connorneville. All rights reserved.
//

#import "TSGHomeViewController.h"
#import "TSGInstructionViewController.h"
#import "TSGResultsViewController.h"
#import "TSGStatsViewController.h"
#import "TSGHomeView.h"
#import "AppDelegate.h"

@interface TSGHomeViewController ()

@end

@implementation TSGHomeViewController

- (void) loadView {
    TSGHomeView* view = [[TSGHomeView alloc] init];
    [view setGoalColor:[AppDelegate randomColor]];
    [view setGuessColor:[UIColor whiteColor]];
    self.view = view;
}

- (id) init {
    self = [super init];
    if(self) {
        [self addActions];
    }
    return self;
}

- (void) reload {
    TSGHomeView* view = [[TSGHomeView alloc] init];
    [view setGoalColor:[AppDelegate randomColor]];
    [view setGuessColor:[UIColor whiteColor]];
    self.view = view;
    [self addActions];
}

- (void) addActions {
    TSGHomeView* view = (TSGHomeView*) self.view;
    [view.instructionButton addTarget:self action:@selector(instructionButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [view.myStatsButton addTarget:self action:@selector(myStatsButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [view.submitButton addTarget:self action:@selector(submitButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
}

- (void) instructionButtonPressed: (id) sender {
    [self presentViewController:[[TSGInstructionViewController alloc] init] animated:TRUE completion:nil];
}

- (void) myStatsButtonPressed: (id) sender {
    [self presentViewController:[[TSGStatsViewController alloc] init] animated:TRUE completion:nil];
}

- (void) submitButtonPressed: (id) sender {
    TSGHomeView* view = (TSGHomeView*) self.view;
    [self presentViewController:[[TSGResultsViewController alloc] initWithGuess:[view guessColor] withGoal:[view goalColor] withAttempt:[view.touchView attempts]] animated:true completion:nil];
}

@end
