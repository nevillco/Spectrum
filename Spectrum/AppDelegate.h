//
//  AppDelegate.h
//  Spectrum
//
//  Created by Connor Neville on 5/23/15.
//  Copyright (c) 2015 connorneville. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

+ (NSString*) fontName;
+ (NSString*) boldFontName;
+ (int) maxAttemptsPerColor;
+ (UIColor*) randomColor;

+ (NSDictionary*) getLocalUserStats;
+ (void) updateLocalStatsWithDictionary: (NSDictionary*) statistics;

+ (int) platinumThreshold;
+ (int) goldThreshold;
+ (int) silverThreshold;
+ (int) bronzeThreshold;

@end

