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
@class LogViewController;
@class Logger;
@class DeepSleepPreventer;

@interface test_sensorsAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    
    /// GPS
    IBOutlet GpsViewController *gpsViewController;
    
    /// Accelerometer
    IBOutlet AccelViewController *accelViewController;
    
    /// Camera (work in progress)
    IBOutlet CameraViewController *cameraViewController;
    
    /// Log On/Off
    IBOutlet LogViewController *logViewController;
        
    /// Logger
    Logger *logger;
    
    /// Keep the app running in background
    DeepSleepPreventer *deepSleepPreventer;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet GpsViewController *gpsViewController;
@property (nonatomic, retain) IBOutlet AccelViewController *accelViewController;
@property (nonatomic, retain) IBOutlet CameraViewController *cameraViewController;
@property (nonatomic, retain) IBOutlet LogViewController *logViewController;

@property (nonatomic, retain) Logger *logger;
@property (nonatomic, retain) DeepSleepPreventer *deepSleepPreventer;

@end

