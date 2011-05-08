//
//  GpsViewController.h
//  test_sensors
//
//  Created by Yoshiaki Kuwata on 5/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <CoreLocation/CoreLocation.h>



@interface GpsViewController : NSObject {
    // View
 	IBOutlet UILabel *height;
    IBOutlet UILabel *location;
	IBOutlet UILabel *date;
    IBOutlet UIActivityIndicatorView *activityIndicator;
    
    // Get GPS info
    CLLocationManager  *locmanager;
    CLLocation *bestEffortAtLocation;
}

// Methods
#if 0
- (void)locationManager:(CLLocationManager *)manager 
    didUpdateToLocation:(CLLocation *)newLocation 
           fromLocation:(CLLocation *) oldLocation;

- (void)locationManager:(CLLocationManager *)manager 
       didFailWithError:(NSError *) error;
#endif




@end
