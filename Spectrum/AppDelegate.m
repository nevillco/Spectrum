//
//  AppDelegate.m
//  Spectrum
//
//  Created by Connor Neville on 5/23/15.
//  Copyright (c) 2015 connorneville. All rights reserved.
//

#import "AppDelegate.h"
#import "TSGHomeViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    TSGHomeViewController* rootViewController = [[TSGHomeViewController alloc] init];
    [self.window setRootViewController: rootViewController];
    [self.window makeKeyAndVisible];
    return YES;
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

+ (NSString*) fontName { return @"TrebuchetMS"; }
+ (NSString*) boldFontName { return [NSString stringWithFormat:@"%@-Bold", [self fontName]]; }
+ (int) maxAttemptsPerColor { return 3; }
//Generates a color with random RGB values (no transparency)
+ (UIColor*) randomColor
{
    srand48(time(0));
    return [UIColor colorWithRed:drand48() green:drand48() blue:drand48() alpha:1];
}
//[UIColor greenColor] is too light - offering new default
+ (UIColor*) greenColor {
    return [UIColor colorWithRed:0.0f green:0.6f blue:0.0f alpha:1.0f];
}

@end
