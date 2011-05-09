//
//  test_sensorsAppDelegate.h
//  test_sensors
//
//  Created by Yoshiaki Kuwata on 5/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GpsViewController;  // forward declaration
@class AccelViewController;  // forward declaration
@class CameraViewController;  // forward declaration

@interface test_sensorsAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    
    IBOutlet GpsViewController *gpsViewController;
    IBOutlet AccelViewController *accelViewController;
    IBOutlet CameraViewController *cameraViewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

// @todo what's the point?
@property (nonatomic, retain) IBOutlet GpsViewController *gpsViewController;
@property (nonatomic, retain) IBOutlet AccelViewController *accelViewController;
@property (nonatomic, retain) IBOutlet CameraViewController *cameraViewController;

@end

