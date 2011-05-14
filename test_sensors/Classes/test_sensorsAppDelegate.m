//
//  test_sensorsAppDelegate.m
//  test_sensors
//
//  Created by Yoshiaki Kuwata on 5/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "test_sensorsAppDelegate.h"

#import "GpsViewController.h"
#import "AccelViewController.h"
#import "CameraViewController.h"
#import "LogViewController.h"
#import "Logger.h"
#import "DeepSleepPreventer.h"


@implementation test_sensorsAppDelegate

@synthesize window;

@synthesize gpsViewController;
@synthesize accelViewController;
@synthesize cameraViewController;
@synthesize logger;
@synthesize deepSleepPreventer;

#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // Override point for customization after application launch.
    
    // Set up sleep preventer
    self.deepSleepPreventer = [[DeepSleepPreventer alloc] init];
	[self.deepSleepPreventer startPreventSleep];
    
    // Set up camera
    CameraViewController* view_controller = [[CameraViewController alloc] init];
    self.cameraViewController = view_controller;
    [view_controller release];
    
#if 0    
    UIView* controllers_view = [self.view_controller view];
    [self.window addSubview:controllers_view];
#endif
    [self.window makeKeyAndVisible];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
    [deepSleepPreventer release];
    
    // Listed in xib file
    // @todo should we dealloc?
    [gpsViewController release];
    [accelViewController release];
    
    [window release];

    [super dealloc];
}


@end
