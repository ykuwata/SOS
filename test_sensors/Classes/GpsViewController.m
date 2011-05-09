//
//  GpsViewController.m
//  test_sensors
//
//  Created by Yoshiaki Kuwata on 5/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "GpsViewController.h"

#define NSLog(s,...) NSLog(@"%s:%d %@",__PRETTY_FUNCTION__,__LINE__,[NSString stringWithFormat:(s), ##__VA_ARGS__])


@implementation GpsViewController

#if 0
// Text labels
@synthesize height;
@synthesize date;
@synthesize location;
//@synthesize activityIndicator;
#endif

- (id)init
{
    if (self = [super init])  // init with superclass
    {
        NSLog(@"initting...");

        // Location manager
        locManager = [[CLLocationManager alloc] init];
        locManager.delegate = self;
        // @todo Configure
        [locManager startUpdatingLocation];
        
        // Counter
        failCount = 0;
        successCount = 0;
        
        // Timer
        timer = [ NSTimer scheduledTimerWithTimeInterval: 5.0f
                                                  target: self 
                                                selector: @selector( updateGps: )
                                                userInfo: nil 
                                                 repeats: YES ];
    }
    return self;
}

- (void)dealloc {
    [locManager stopUpdatingLocation];
    [locManager release];
    [super dealloc];
}



- (void) updateGps: (NSTimer *) theTimer {
    // Take a measurement
    CLLocation *loc = locManager.location;
    
    // Update rate
    NSTimeInterval howRecent = [loc.timestamp timeIntervalSinceNow];
    labelRecent.text = [NSString stringWithFormat: @"%.1f secs ago", -howRecent];
    
    if (nil) {
        labelFailCount.text = [NSString stringWithFormat: @"%d", failCount++];
        return;
    }    
    labelSuccessCount.text = [NSString stringWithFormat: @"%d", successCount++];
    
    
    // Process data
    double lat = loc.coordinate.latitude;      // in [deg]
    double lon = loc.coordinate.longitude;     // in [deg]
    double altitude = loc.altitude;            // in [m]
    double hAccuracy = loc.horizontalAccuracy; // in [m]
    double vAccuracy = loc.verticalAccuracy;   // in [m]
    NSString *timestamp = [loc.timestamp description]; // “2001-03-24 10:45:32 +0600”
                                       //descriptionWithLocale:[NSLocale currentLocale]];
    double speed = loc.speed;            // in [m/s]
    double course = loc.course;          // in [deg], N=0, clockwise    
    
    // Display
    labelLocation.text = [NSString stringWithFormat:@"%f, %f", lat, lon];
    labelAltitude.text = [NSString stringWithFormat: @"%.2f", altitude];
    labelAccuracy.text = [NSString stringWithFormat: @"H %.1f, V %.1f", hAccuracy, vAccuracy];
    labelVelocity.text = [NSString stringWithFormat: @"%.1fm/s, %.1fdeg", speed, course];
    labelDate.text = timestamp;
}



#if 0
// This is very irregular...
- (void)locationManager:(CLLocationManager *)manager 
    didUpdateToLocation:(CLLocation *)loc 
           fromLocation:(CLLocation *)oldLocation 
{ 
    NSLog(@"newLoc: %@", loc.description);
    
    NSTimeInterval howRecent = 
    [loc.timestamp timeIntervalSinceNow];
    if (howRecnet < -10) return;
    
    if (loc.horizontalAccuracy > 100) // in [m]
        return;
    
    // Use the coordinate data 
    double lat = loc.coordinate.latitude;      // in [deg]
    double lon = loc.coordinate.longitude;     // in [deg]
    double altitude = loc.altutide;            // in [m]
    double hAccuracy = loc.horizontalAccuracy; // in [m]
    double vAccuracy = loc.verticalAccuracy;   // in [m]
    NSString *timestamp = 
    [loc.timestamp dateWithString]; // “2001-03-24 10:45:32 +0600”
    
    double speed = loc.speed;            // in [m/s]
    double course = loc.course;          // in [deg], N=0, clockwise    
}

- (void)locationManager:(CLLocaitonManager*)manager
       didFailWithError:(NSError*)error;
{
    ;
}
#endif

@end
