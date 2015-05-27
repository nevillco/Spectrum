//
//  TSGParseReader.m
//  Spectrum
//
//  Created by Connor Neville on 5/27/15.
//  Copyright (c) 2015 connorneville. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSGParseReader.h"
#import <Parse/Parse.h>

@implementation TSGParseReader

+ (int) maximumLeaderboardEntries { return 25; }

+ (int) minimumScoreForLeaderboard {
    PFQuery *query = [PFQuery queryWithClassName:@"Score"];
    [query orderByAscending:@"score"];
    NSArray* values = [query findObjects];
    PFObject* first = [values firstObject];
    int minimum = ((NSNumber*)first[@"score"]).intValue;
    return minimum;
}

+ (NSArray*) leaderboardEntries {
    PFQuery *query = [PFQuery queryWithClassName:@"Score"];
    [query orderByDescending:@"score"];
    NSArray* values = [query findObjects];
    return values;
}

@end