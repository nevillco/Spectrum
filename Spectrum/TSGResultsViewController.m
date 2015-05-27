//
//  TSGResultsViewController.m
//  Spectrum
//
//  Created by Connor Neville on 5/26/15.
//  Copyright (c) 2015 connorneville. All rights reserved.
//

#import "TSGResultsViewController.h"
#import "TSGHomeViewController.h"
#import "TSGResultsView.h"
#import "AppDelegate.h"

@interface TSGResultsViewController ()

@end

@implementation TSGResultsViewController

- (void) loadView {
    TSGResultsView* view = [[TSGResultsView alloc] init];
    self.view = view;
}

- (id) initWithGuess: (UIColor*) guessColor withGoal: (UIColor*) goalColor withAttempt: (int) attemptNumber {
    self = [super init];
    if(self) {
        self.statisticDictionary = [self makeStatisticDictionaryForGuess: guessColor forGoal: goalColor onAttempt:attemptNumber];
        TSGResultsView* view = (TSGResultsView*) self.view;
        [view updateControlsWithStatisticDictionary: self.statisticDictionary];
        [AppDelegate updateLocalStatsWithDictionary: self.statisticDictionary];
        [self addActions];
    }
    return self;
}

#pragma mark statistics/calculations
- (NSDictionary*) makeStatisticDictionaryForGuess: (UIColor*) guessColor
                                          forGoal: (UIColor*) goalColor
                                        onAttempt: (int) attemptNumber {
    
    int rawScore = [self calculateRawScoreForGuess: guessColor forGoal: goalColor];
    NSMutableDictionary* multipliers = [self calculateMultipliersForGuess:guessColor forGoal:goalColor onAttempt:attemptNumber];
    int finalScore = [self calculateFinalScoreForRawScore:rawScore withMultipliers:multipliers];
    NSString* medal = [self calculateMedalForRawScore: rawScore];
    
    return @{@"guessColor":guessColor,
             @"goalColor":goalColor,
             @"attemptNumber":[NSNumber numberWithInt:attemptNumber],
             @"rawScore":[NSNumber numberWithInt: rawScore],
             @"multipliers": multipliers,
             @"finalScore": [NSNumber numberWithInt: finalScore],
             @"medal": medal};
}

- (int) calculateRawScoreForGuess: (UIColor*) guessColor forGoal: (UIColor*) goalColor {
    CGFloat floatVals[6];
    [guessColor getRed:&floatVals[0] green:&floatVals[1] blue:&floatVals[2] alpha:nil];
    [goalColor getRed:&floatVals[3] green:&floatVals[4] blue:&floatVals[5] alpha:nil];
    
    int intVals[6];
    for(int i = 0; i < 6; i++) {
        intVals[i] = (int)(floatVals[i] * 255);
    }
    
    int differences[3] = {ABS(intVals[0]-intVals[3]), ABS(intVals[1]-intVals[4]), ABS(intVals[2]-intVals[5])};
    
    return 765 - differences[0] - differences[1] - differences[2];
}

- (NSString*) calculateMedalForRawScore: (int) rawScore {
    if(rawScore == 765) return @"platinum";
    if(rawScore > 700) return @"gold";
    if(rawScore > 600) return @"silver";
    if(rawScore > 500) return @"bronze";
    return @"no medal";
}

- (int) calculateFinalScoreForRawScore: (int) rawScore withMultipliers: (NSMutableDictionary*) multipliers {
    float finalScore = rawScore;
    for(id key in multipliers) {
        float multiplier = ((NSNumber*)multipliers[key]).floatValue;
        finalScore *= multiplier;
    }
    return finalScore;
}

- (NSMutableDictionary*) calculateMultipliersForGuess: (UIColor*) guessColor
                                              forGoal: (UIColor*) goalColor
                                            onAttempt: (int) attemptNumber {
    NSMutableDictionary* dict = [[NSMutableDictionary alloc] initWithCapacity:2];
    
    if(attemptNumber == 1) [dict setObject:[NSNumber numberWithFloat: 1.2] forKey:@"(*1.2) First attempt"];
    else if(attemptNumber == 2) [dict setObject:[NSNumber numberWithFloat:1.1] forKey:@"(*1.1) Second attempt"];
    else [dict setObject:[NSNumber numberWithFloat:1.0] forKey:@"(*1.0) Last attempt"];
    
    
    CGFloat floatVals[6];
    [guessColor getRed:&floatVals[0] green:&floatVals[1] blue:&floatVals[2] alpha:nil];
    [goalColor getRed:&floatVals[3] green:&floatVals[4] blue:&floatVals[5] alpha:nil];
    
    int intVals[6];
    for(int i = 0; i < 6; i++) {
        intVals[i] = (int)(floatVals[i] * 255);
    }
    
    int differences[3] = {ABS(intVals[0]-intVals[3]), ABS(intVals[1]-intVals[4]), ABS(intVals[2]-intVals[5])};
    //NSLog(@"Differences: %d %d %d", differences[0], differences[1], differences[2]);
    
    if(differences[0] == 0 && differences[1] == 0 && differences[2] == 0) {
        [dict setObject:[NSNumber numberWithFloat:3.0] forKey:@"(*3.0) Perfect score"];
    }
    else if(differences[0] <= 5 && differences[1] <= 5 && differences[2] <= 5) {
        [dict setObject:[NSNumber numberWithFloat:2.8] forKey:@"(*2.8) All colors within 5"];
    }
    else if(differences[0] <= 10 && differences[1] <= 10 && differences[2] <= 10) {
        [dict setObject:[NSNumber numberWithFloat:2.6] forKey:@"(*2.6) All colors within 10"];
    }
    else if(differences[0] <= 15 && differences[1] <= 15 && differences[2] <= 15) {
        [dict setObject:[NSNumber numberWithFloat:2.4] forKey:@"(*2.4) All colors within 15"];
    }
    else if(differences[0] <= 20 && differences[1] <= 20 && differences[2] <= 20) {
        [dict setObject:[NSNumber numberWithFloat:2.2] forKey:@"(*2.2) All colors within 20"];
    }
    else if(differences[0] <= 25 && differences[1] <= 25 && differences[2] <= 25) {
        [dict setObject:[NSNumber numberWithFloat:2.4] forKey:@"(*2.0) All colors within 25"];
    }
    else if(differences[0] <= 50 && differences[1] <= 50 && differences[2] <= 50) {
        [dict setObject:[NSNumber numberWithFloat:1.5] forKey:@"(*1.5) All colors within 50"];
    }
    
    if(![dict objectForKey:@"(*2.0) Perfect score"]) {
        if((differences[0] + differences[1] == 0) || (differences[1] + differences[2] == 0) || (differences[2] + differences[0] == 0)) {
            [dict setObject:[NSNumber numberWithFloat:2.9] forKey:@"(*2.9) Two colors perfect"];
        }
        else if((differences[0] == 0) || (differences[1] == 0) || (differences[2] == 0)) {
            [dict setObject:[NSNumber numberWithFloat:2.8] forKey:@"(*2.8) One color perfect"];
        }
    }
    
    if(![dict objectForKey:@"(*2.8) All colors within 5"] && ![dict objectForKey:@"(*3.0) Perfect score"]) {
        if(((differences[0] <= 5 && differences[1] <= 5) || (differences[1] <= 5 && differences[2] <= 5) || (differences[2] <= 5 && differences[0] <= 5)) &&
           ![dict objectForKey:@"(*2.9) Two colors perfect"]) {
            [dict setObject:[NSNumber numberWithFloat:2.7] forKey:@"(*2.7) Two colors within 5"];
        }
        else if(((differences[0] <= 5) || (differences[1] <= 5) || (differences[2] <= 5)) && ![dict objectForKey:@"(*2.8) One color perfect"]) {
            [dict setObject:[NSNumber numberWithFloat:2.6] forKey:@"(*2.6) One color within 5"];
        }
    }
    
    if(![dict objectForKey:@"(*2.6) All colors within 10"] && ![dict objectForKey:@"(*2.8) All colors within 5"] && ![dict objectForKey:@"(*3.0) Perfect score"]) {
        if(((differences[0] <= 10 && differences[1] <= 10) || (differences[1] <= 10 && differences[2] <= 10) || (differences[2] <= 10 && differences[0] <= 10)) &&
           ![dict objectForKey:@"(*2.9) Two colors perfect"] && ![dict objectForKey:@"(*2.7) Two colors within 5"]) {
            [dict setObject:[NSNumber numberWithFloat:2.5] forKey:@"(*2.5) Two colors within 10"];
        }
        else if(((differences[0] <= 10) || (differences[1] <= 10) || (differences[2] <= 10)) &&
                ![dict objectForKey:@"(*2.8) One color perfect"] && ![dict objectForKey:@"(*2.6) One color within 5"]) {
            [dict setObject:[NSNumber numberWithFloat:2.4] forKey:@"(*2.4) One color within 10"];
        }
    }
    
    return dict;
}

#pragma mark actions/view communication
- (void) addActions {
    TSGResultsView* view = (TSGResultsView*) self.view;
    [view.goBackButton addTarget:self action:@selector(goBackButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
}

- (void) goBackButtonPressed: (id) sender {
    TSGHomeViewController* presenter = (TSGHomeViewController*) self.presentingViewController;
    [presenter reload];
    [self dismissViewControllerAnimated:true completion:nil];
}

@end
