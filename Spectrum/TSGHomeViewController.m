//
//  TSGHomeViewController.m
//  Spectrum
//
//  Created by Connor Neville on 5/23/15.
//  Copyright (c) 2015 connorneville. All rights reserved.
//

#import "TSGHomeViewController.h"
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

@end
