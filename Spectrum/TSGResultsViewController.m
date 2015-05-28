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
#import "TSGParseReader.h"
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

- (void) viewDidAppear:(BOOL)animated {
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0ul);
    dispatch_async(queue, ^{
        [self checkLeaderboard];
        dispatch_sync(dispatch_get_main_queue(), ^{
            // Update UI
            // Example:
            // self.myLabel.text = result;
        });
    });
}

#pragma mark statistics/calculations
- (NSDictionary*) makeStatisticDictionaryForGuess: (UIColor*) guessColor
                                          forGoal: (UIColor*) goalColor
                                        onAttempt: (int) attemptNumber {
    
    int rawScore = [self calculateRawScoreForGuess: guessColor forGoal: goalColor];
    NSString* medal = [self calculateMedalForRawScore: rawScore];
    NSMutableDictionary* multipliers = [self calculateMultipliersForGuess:guessColor forGoal:goalColor onAttempt:attemptNumber withMedal:medal];
    int finalScore = [self calculateFinalScoreForRawScore:rawScore withMultipliers:multipliers];
    
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

//Calculate medal using constants in App Delegate
- (NSString*) calculateMedalForRawScore: (int) rawScore {
    if(rawScore >= [AppDelegate platinumThreshold]) return @"platinum";
    if(rawScore >= [AppDelegate goldThreshold]) return @"gold";
    if(rawScore >= [AppDelegate silverThreshold]) return @"silver";
    if(rawScore >= [AppDelegate bronzeThreshold]) return @"bronze";
    return @"no medal";
}

//Multiply raw score by each multiplier to calculate final score
- (int) calculateFinalScoreForRawScore: (int) rawScore withMultipliers: (NSMutableDictionary*) multipliers {
    float finalScore = rawScore;
    for(id key in multipliers) {
        float multiplier = ((NSNumber*)multipliers[key]).floatValue;
        finalScore *= multiplier;
    }
    return finalScore;
}

//Determine which multipliers to add to dictionary (large boolean equations!)
- (NSMutableDictionary*) calculateMultipliersForGuess: (UIColor*) guessColor
                                              forGoal: (UIColor*) goalColor
                                            onAttempt: (int) attemptNumber
                                            withMedal: (NSString*) medal {
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
    
    if(![dict objectForKey:@"(*3.0) Perfect score"]) {
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
    
    if(intVals[0] > intVals[1] && intVals[0] > intVals[2] && intVals[3] > intVals[4] && intVals[3] > intVals[5]) {
        [dict setObject:[NSNumber numberWithFloat:1.4] forKey:@"(*1.4) Guessed most prevalent color (red)"];
    }
    else if(intVals[1] > intVals[0] && intVals[1] > intVals[2] && intVals[4] > intVals[3] && intVals[4] > intVals[5]) {
        [dict setObject:[NSNumber numberWithFloat:1.4] forKey:@"(*1.4) Guessed most prevalent color (green)"];
    }
    else if(intVals[2] > intVals[0] && intVals[2] > intVals[1] && intVals[5] > intVals[3] && intVals[5] > intVals[4]) {
        [dict setObject:[NSNumber numberWithFloat:1.4] forKey:@"(*1.4) Guessed most prevalent color (blue)"];
    }
    
    if(intVals[0] < intVals[1] && intVals[0] < intVals[2] && intVals[3] < intVals[4] && intVals[3] < intVals[5]) {
        [dict setObject:[NSNumber numberWithFloat:1.4] forKey:@"(*1.4) Guessed least prevalent color (red)"];
    }
    else if(intVals[1] < intVals[0] && intVals[1] < intVals[2] && intVals[4] < intVals[3] && intVals[4] < intVals[5]) {
        [dict setObject:[NSNumber numberWithFloat:1.4] forKey:@"(*1.4) Guessed least prevalent color (green)"];
    }
    else if(intVals[2] < intVals[0] && intVals[2] < intVals[1] && intVals[5] < intVals[3] && intVals[5] < intVals[4]) {
        [dict setObject:[NSNumber numberWithFloat:1.4] forKey:@"(*1.4) Guessed least prevalent color (blue)"];
    }
    
    //No multiplier for platinum medal - one given for perfect raw score already
    if([medal isEqualToString: @"gold"]) {
        [dict setObject:[NSNumber numberWithFloat: 1.6f] forKeyedSubscript:@"(*1.6) Gold raw score medal"];
    }
    else if([medal isEqualToString: @"silver"]) {
        [dict setObject:[NSNumber numberWithFloat: 1.4f] forKeyedSubscript:@"(*1.4) Silver raw score medal"];
    }
    else if([medal isEqualToString: @"bronze"]) {
        [dict setObject:[NSNumber numberWithFloat: 1.2f] forKeyedSubscript:@"(*1.2) Bronze raw score medal"];
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

- (void) checkLeaderboard {
    int score = ((NSNumber*)self.statisticDictionary[@"finalScore"]).intValue;
    BOOL shouldAdd = [TSGParseReader shouldAddScoreToLeaderboard: score];
    if(shouldAdd) {
        [self displayNameAlertWithText:@"Your final score of %d was good enough to make the global leaderboard. If you want to publish your score, enter a name below." forScore:score];
    }
}

- (void) displayNameAlertWithText: (NSString*) text forScore: (int) score {
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Leaderboard" message:[NSString stringWithFormat: text, score] preferredStyle:UIAlertControllerStyleAlert];
    
    
    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"Name";
    }];
    
    UIAlertAction* ok = [UIAlertAction
                         actionWithTitle:@"Submit"
                         style:UIAlertActionStyleDefault
                         handler:^(UIAlertAction * action)
                         {
                             NSString* name = ((UITextField*)alert.textFields.firstObject).text;
                             NSString* nameValidity = [self nameValidity: name];
                             if([nameValidity isEqualToString: @"Valid"]) {
                                 [TSGParseReader addScoreToLeaderboard:score withName:name];
                             }
                             else {
                                 [self displayNameAlertWithText:nameValidity forScore:score];
                             }
                             [alert dismissViewControllerAnimated:YES completion:nil];
                             
                         }];
    UIAlertAction* cancel = [UIAlertAction
                             actionWithTitle:@"No Thanks"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             {
                                 [alert dismissViewControllerAnimated:YES completion:nil];
                                 
                             }];
    
    [alert addAction:ok];
    [alert addAction:cancel];
    [self presentViewController: alert animated:true completion:nil];
}

//Return "Valid" if valid, otherwise, return error message.
- (NSString*) nameValidity: (NSString*) name {
    if(name.length < 3) return @"Your name has to be at least 3 characters.";
    if(name.length > 12) return @"Your name can be at most 12 characters.";
    return @"Valid";
}

@end
