//
//  test_sensorsAppDelegate.h
//  test_sensors
//
//  Created by Yoshiaki Kuwata on 5/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

// forward declaration
@class GpsViewController;
@class AccelViewController;
@class CameraViewController;
@class Logger;

@interface test_sensorsAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    
    IBOutlet GpsViewController *gpsViewController;
    IBOutlet AccelViewController *accelViewController;
    IBOutlet CameraViewController *cameraViewController;
    
    Logger *logger;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

// @todo what's the point?
@property (nonatomic, retain) IBOutlet GpsViewController *gpsViewController;
@property (nonatomic, retain) IBOutlet AccelViewController *accelViewController;
@property (nonatomic, retain) IBOutlet CameraViewController *cameraViewController;

@property (nonatomic, retain) Logger *logger;

@end

