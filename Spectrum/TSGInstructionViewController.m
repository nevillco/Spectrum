//
//  TSGInstructionViewController.m
//  Spectrum
//
//  Created by Connor Neville on 5/25/15.
//  Copyright (c) 2015 connorneville. All rights reserved.
//

#import "TSGInstructionViewController.h"
#import "TSGInstructionView.h"

@interface TSGInstructionViewController ()

@end

@implementation TSGInstructionViewController

- (void) loadView {
    TSGInstructionView* view = [[TSGInstructionView alloc] init];
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
    TSGInstructionView* view = (TSGInstructionView*) self.view;
    [view.goBackButton addTarget:self action:@selector(goBackButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
}

- (void) goBackButtonPressed: (id) sender {
    [self dismissViewControllerAnimated:TRUE completion:nil];
}

@end
