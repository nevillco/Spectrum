//
//  TSGResultsViewController.m
//  Spectrum
//
//  Created by Connor Neville on 5/26/15.
//  Copyright (c) 2015 connorneville. All rights reserved.
//

#import "TSGResultsViewController.h"
#import "TSGResultsView.h"

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
        [self makeStatisticDictionaryForGuess: guessColor forGoal: goalColor onAttempt:attemptNumber];
        [self addActions];
    }
    return self;
}

- (NSDictionary*) makeStatisticDictionaryForGuess: (UIColor*) guessColor
                                          forGoal: (UIColor*) goalColor
                                        onAttempt: (int) attemptNumber {
    
    int rawScore = [self calculateRawScoreForGuess: guessColor forGoal: goalColor];
    NSMutableDictionary* multipliers = [self calculateMultipliersForGuess:guessColor forGoal:goalColor onAttempt:attemptNumber];
    float totalMultiplier = [self calculateTotalForMultipliers: multipliers];
    int finalScore = (int)(rawScore * totalMultiplier);
    
    return @{@"guessColor":guessColor,
             @"goalColor":goalColor,
             @"attemptNumber":[NSNumber numberWithInt:attemptNumber],
             @"rawScore":[NSNumber numberWithInt: rawScore],
             @"multipliers": multipliers,
             @"totalMultiplier": [NSNumber numberWithFloat: totalMultiplier],
             @"finalScore": [NSNumber numberWithInt: finalScore]};
}

- (int) calculateRawScoreForGuess: (UIColor*) guessColor forGoal: (UIColor*) goalColor {
    CGFloat floatVals[6];
    [guessColor getRed:&floatVals[0] green:&floatVals[1] blue:&floatVals[2] alpha:nil];
    [goalColor getRed:&floatVals[3] green:&floatVals[4] blue:&floatVals[5] alpha:nil];
    
    int intVals[6];
    for(int i = 0; i < 6; i++) {
        intVals[i] = (int)(floatVals[i] * 256);
    }
    
    return 765 - (ABS(intVals[0]-intVals[3]) + ABS(intVals[1]-intVals[4]) + ABS(intVals[2]-intVals[5]));
}

- (float) calculateTotalForMultipliers: (NSMutableDictionary*) multiplers {
    float total = 0.0f;
    for(id key in multiplers) {
        total += [multiplers[key] floatValue];
    }
    return total;
}

- (NSMutableDictionary*) calculateMultipliersForGuess: (UIColor*) guessColor
                                              forGoal: (UIColor*) goalColor
                                            onAttempt: (int) attemptNumber {
    NSMutableDictionary* dict = [[NSMutableDictionary alloc] initWithCapacity:2];
    
    if(attemptNumber == 1) [dict setObject:[NSNumber numberWithFloat: 1.5] forKey:@"First attempt"];
    else if(attemptNumber == 2) [dict setObject:[NSNumber numberWithFloat:1.25] forKey:@"Second attempt"];
    else [dict setObject:[NSNumber numberWithFloat:1.0] forKey:@"Last attempt"];
    
    return dict;
}

- (void) addActions {
    
}

@end
