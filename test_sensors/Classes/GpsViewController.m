//
//  GpsViewController.m
//  test_sensors
//
//  Created by Yoshiaki Kuwata on 5/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "GpsViewController.h"
#import "Logger.h"

#define NSLog(s,...) NSLog(@"%s:%d %@",__PRETTY_FUNCTION__,__LINE__,[NSString stringWithFormat:(s), ##__VA_ARGS__])


@implementation GpsViewController


@synthesize logger;


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
        timer = [ NSTimer scheduledTimerWithTimeInterval: 1.0f
                                                  target: self 
                                                selector: @selector( updateGps: )
                                                userInfo: nil 
                                                 repeats: YES ];
        // Logger
        logger = [[Logger alloc] initWithName:@"GPS"];
    }
    return self;
}

- (void)dealloc {
    [logger release];
    [locManager stopUpdatingLocation];
    [locManager release];
    [super dealloc];
}



- (void) updateGps: (NSTimer *) theTimer {
    // Take a measurement
    CLLocation *loc = locManager.location;
    
    // Update rate
    NSTimeInterval howRecent = [loc.timestamp timeIntervalSinceNow];
    labelRecent.text = [NSString stringWithFormat: @"%.1f sec ago", -howRecent];
    
    if (nil) {
        labelFailCount.text = [NSString stringWithFormat: @"%d", ++failCount];
        return;
    }    
    labelSuccessCount.text = [NSString stringWithFormat: @"%d", ++successCount];
    
    // Setting date format    
    NSDateFormatter* dateFormatter = [[[NSDateFormatter alloc] init] autorelease];
	[dateFormatter setDateFormat:@"yyyy:MM:dd HH:mm:ss Z"];
    
    // Process data
    double lat = loc.coordinate.latitude;      // in [deg]
    double lon = loc.coordinate.longitude;     // in [deg]
    double altitude = loc.altitude;            // in [m]
    double hAccuracy = loc.horizontalAccuracy; // in [m]
    double vAccuracy = loc.verticalAccuracy;   // in [m]
    NSString *timestamp =  [dateFormatter stringFromDate:loc.timestamp]; // “2001-03-24 10:45:32 +0700”
    double speed = loc.speed;            // in [m/s]
    double course = loc.course;          // in [deg], N=0, clockwise    
    
    // Display
    labelLocation.text = [NSString stringWithFormat:@"%f, %f", lat, lon];
    labelAltitude.text = [NSString stringWithFormat: @"%.2f", altitude];
    labelAccuracy.text = [NSString stringWithFormat: @"H %.1f, V %.1f", hAccuracy, vAccuracy];
    labelVelocity.text = [NSString stringWithFormat: @"%.1fm/s, %.1fdeg", speed, course];
    labelDate.text = timestamp;
    
    // Log
    if (logger.fileOpen) {
        NSDate *t = loc.timestamp;
        [logger write:[NSString stringWithFormat:@"%.3f,%f,%f,%.2f,%.1f,%.1f,%.1f,%.1f\n", 
                       [t timeIntervalSinceReferenceDate], 
                       lat, lon, altitude, hAccuracy, vAccuracy, speed, course]];
    }
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
    NSString *timestamp = [loc.timestamp dateWithString]; // “2001-03-24 10:45:32 +0600”
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
