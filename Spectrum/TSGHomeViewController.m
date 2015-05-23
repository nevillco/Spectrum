//
//  TSGHomeViewController.m
//  Spectrum
//
//  Created by Connor Neville on 5/23/15.
//  Copyright (c) 2015 connorneville. All rights reserved.
//

#import "TSGHomeViewController.h"
#import "TSGHomeView.h"

@interface TSGHomeViewController ()

@end

@implementation TSGHomeViewController

- (void) loadView {
    self.view = [[TSGHomeView alloc] init];
}

@end
