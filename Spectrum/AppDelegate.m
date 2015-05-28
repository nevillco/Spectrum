//
//  AppDelegate.m
//  Spectrum
//
//  Created by Connor Neville on 5/23/15.
//  Copyright (c) 2015 connorneville. All rights reserved.
//

#import "AppDelegate.h"
#import "TSGHomeViewController.h"
#import <Parse/Parse.h>
#import "TSGParseReader.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Info" ofType:@"plist"];
    NSDictionary *plist = [NSDictionary dictionaryWithContentsOfFile:path];
    // Initialize Parse
    [Parse setApplicationId:[plist objectForKey:@"ParseAppId"]
                  clientKey:[plist objectForKey:@"ParseClientKey"]];
    
    //Test parse leaderboard
    //NSLog(@"%d", [TSGParseReader minimumScoreForLeaderboard]);
    
    [AppDelegate resetLocalStats];
    NSLog(@"%@", [AppDelegate getLocalUserStats]);
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    TSGHomeViewController* rootViewController = [[TSGHomeViewController alloc] init];
    [self.window setRootViewController: rootViewController];
    [self.window makeKeyAndVisible];
    return YES;
}

+ (void) createLocalFileIfNecessary {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    //get the documents directory:
    NSArray *paths = NSSearchPathForDirectoriesInDomains
    (NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    //make a file name to write the data to using the documents directory:
    NSString *fileName = [NSString stringWithFormat:@"%@/textfile.txt",
                          documentsDirectory];
    
    if (![fileManager fileExistsAtPath:fileName]){
        //create content:
        //Total score
        //Number of tries
        //Average score
        //Top score
        //Platinum medals
        //Gold medals
        //Silver medals
        //Bronze medals
        NSString *content = @"0\n"
        "0\n"
        "0.0\n"
        "0\n"
        "0\n0\n0\n0";
        
        [[NSFileManager defaultManager] createFileAtPath:fileName contents:[content dataUsingEncoding:NSUTF8StringEncoding] attributes:nil];
    }
}

+ (void) resetLocalStats {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    NSString *fileName = [NSString stringWithFormat:@"%@/textfile.txt",
                          documentsDirectory];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:fileName]){
        [fileManager removeItemAtPath:fileName error:nil];
        [AppDelegate createLocalFileIfNecessary];
    }
}

+ (NSDictionary*) getLocalUserStats {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    NSString *fileName = [NSString stringWithFormat:@"%@/textfile.txt",
                          documentsDirectory];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:fileName]){
        [AppDelegate createLocalFileIfNecessary];
    }
    NSString *fileContent = [[NSString alloc] initWithContentsOfFile:fileName encoding:NSUTF8StringEncoding error:nil];
    NSArray* lines = [fileContent componentsSeparatedByString:@"\n"];
    return @{@"totalScore": [NSNumber numberWithLongLong:[lines[0] longLongValue]],
             @"numTries": [NSNumber numberWithInt:[lines[1] intValue]],
             @"averageScore": [NSNumber numberWithDouble:[lines[2] doubleValue]],
             @"topScore": [NSNumber numberWithInt:[lines[3] intValue]],
             @"platinum": [NSNumber numberWithInt:[lines[4] intValue]],
             @"gold": [NSNumber numberWithInt:[lines[5] intValue]],
             @"silver": [NSNumber numberWithInt:[lines[6] intValue]],
             @"bronze": [NSNumber numberWithInt:[lines[7] intValue]]};
}

+ (void) updateLocalStatsWithDictionary: (NSDictionary*) statistics {
    NSMutableDictionary* localStats = [[AppDelegate getLocalUserStats] mutableCopy];
    //Update num tries (add 1)
    int numTries = ((NSNumber*)localStats[@"numTries"]).intValue;
    [localStats setObject:[NSNumber numberWithInt:(numTries + 1)] forKey:@"numTries"];
    //Update total score
    long long totalScore = ((NSNumber*)localStats[@"totalScore"]).longLongValue;
    int currentScore = ((NSNumber*)statistics[@"finalScore"]).intValue;
    long long newTotal = totalScore + currentScore;
    [localStats setObject:[NSNumber numberWithLongLong:newTotal] forKey:@"totalScore"];
    //Update top score (if necessary)
    int previousTopScore = ((NSNumber*)localStats[@"topScore"]).intValue;
    if(currentScore > previousTopScore) {
        [localStats setObject:[NSNumber numberWithInt: currentScore] forKey:@"topScore"];
    }
    //Update average
    double newAverage = (newTotal / (double)(numTries + 1));
    [localStats setObject:[NSNumber numberWithDouble:newAverage] forKey:@"averageScore"];
    //Medal
    NSString* medalEarned = statistics[@"medal"];
    //Will be true unless no medal earned
    if(localStats[medalEarned]) {
        int numOfMedalType = ((NSNumber*)localStats[medalEarned]).intValue;
        [localStats setObject:[NSNumber numberWithInt:(numOfMedalType+1)] forKey:medalEarned];
    }
    [AppDelegate writeLocalStatsToTextFile: localStats];
}

+ (void) writeLocalStatsToTextFile: (NSDictionary*) updatedStats {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    //get the documents directory:
    NSArray *paths = NSSearchPathForDirectoriesInDomains
    (NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    //make a file name to write the data to using the documents directory:
    NSString *fileName = [NSString stringWithFormat:@"%@/textfile.txt",
                          documentsDirectory];
    
    if ([fileManager fileExistsAtPath:fileName]){
        long long totalScore = ((NSNumber*)updatedStats[@"totalScore"]).longLongValue;
        int numTries = ((NSNumber*)updatedStats[@"numTries"]).intValue;
        double averageScore = ((NSNumber*)updatedStats[@"averageScore"]).doubleValue;
        int topScore = ((NSNumber*)updatedStats[@"topScore"]).intValue;
        int platinums = ((NSNumber*)updatedStats[@"platinum"]).intValue;
        int golds = ((NSNumber*)updatedStats[@"gold"]).intValue;
        int silvers = ((NSNumber*)updatedStats[@"silver"]).intValue;
        int bronzes = ((NSNumber*)updatedStats[@"bronze"]).intValue;
        
        NSString* content = [NSString stringWithFormat:@"%lld\n%d\n%f\n%d\n%d\n%d\n%d\n%d",
                             totalScore, numTries, averageScore, topScore,
                             platinums, golds, silvers, bronzes];
        //save content to the documents directory
        [content writeToFile:fileName
                  atomically:NO
                    encoding:NSStringEncodingConversionAllowLossy
                       error:nil];
    }
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

//Used throughout views as global font
+ (NSString*) fontName { return @"TrebuchetMS"; }
+ (NSString*) boldFontName { return [NSString stringWithFormat:@"%@-Bold", [self fontName]]; }

//Used in TSGTouchableView
+ (int) maxAttemptsPerColor { return 3; }

//Generates a color with random RGB values (no transparency)
+ (UIColor*) randomColor
{
    srand48(time(0));
    return [UIColor colorWithRed:drand48() green:drand48() blue:drand48() alpha:1];
}

//Minimum scores required for each medal type
+ (int) platinumThreshold { return 765; }
+ (int) goldThreshold { return 700; }
+ (int) silverThreshold { return 650; }
+ (int) bronzeThreshold { return 600; }

@end
