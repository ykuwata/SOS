//
//  test_sensorsAppDelegate.h
//  test_sensors
//
//  Created by Yoshiaki Kuwata on 5/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GpsViewController;  // forward declaration

@interface test_sensorsAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    
    IBOutlet GpsViewController *gpsViewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet GpsViewController *gpsViewController;

@end

