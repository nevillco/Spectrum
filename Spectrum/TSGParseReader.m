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

//Class containing static methods for Parse queries
//(handle in background thread when query results
//not necessary for return value)

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

+ (BOOL) shouldAddScoreToLeaderboard: (int) score {
    PFQuery *query = [PFQuery queryWithClassName:@"Score"];
    [query orderByAscending:@"score"];
    NSArray* values = [query findObjects];
    PFObject* first = [values firstObject];
    int minimum = ((NSNumber*)first[@"score"]).intValue;
    return (score > minimum) || (values.count < 25);
}

+ (void) addScoreToLeaderboard: (int) score withName: (NSString*) name {
    PFQuery *query = [PFQuery queryWithClassName:@"Score"];
    [query orderByAscending:@"score"];
    [query findObjectsInBackgroundWithBlock:^(NSArray* objects, NSError* error) {
        if(objects.count == [TSGParseReader maximumLeaderboardEntries]) {
            PFObject* first = [objects firstObject];
            [first deleteEventually];
        }
    }];
    PFObject* newObj = [PFObject objectWithClassName:@"Score"];
    newObj[@"score"] = [NSNumber numberWithInt:score];
    newObj[@"playerName"] = name;
    [newObj saveInBackground];
}

@end