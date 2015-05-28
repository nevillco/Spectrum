//
//  TSGParseReader.h
//  Spectrum
//
//  Created by Connor Neville on 5/27/15.
//  Copyright (c) 2015 connorneville. All rights reserved.
//

@interface TSGParseReader : NSObject

//Class containing static methods for Parse queries
//(handle in background thread when query results
//not necessary for return value)

+ (int) maximumLeaderboardEntries;
+ (int) minimumScoreForLeaderboard;
+ (NSArray*) leaderboardEntries;
+ (BOOL) shouldAddScoreToLeaderboard: (int) score;
+ (void) addScoreToLeaderboard: (int) score withName: (NSString*) name;

@end