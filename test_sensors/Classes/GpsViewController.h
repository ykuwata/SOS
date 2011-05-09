//
//  GpsViewController.h
//  test_sensors
//
//  Created by Yoshiaki Kuwata on 5/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <CoreLocation/CoreLocation.h>



@interface GpsViewController : NSObject <CLLocationManagerDelegate>{
    // View
 	IBOutlet UILabel *height;
    IBOutlet UILabel *location;
	IBOutlet UILabel *date;
    //IBOutlet UIActivityIndicatorView *activityIndicator;
    
    // Timer
    NSTimer *timer;
    
    // Get GPS info
    CLLocationManager  *locManager;
    CLLocation *bestEffortAtLocation;
}

// Text labels
@property (nonatomic,retain) IBOutlet UILabel *height;
@property (nonatomic,retain) IBOutlet UILabel *location;
@property (nonatomic,retain) IBOutlet UILabel *date;
//@property (nonatomic,retain) IBOutlet UIActivityIndicatorView *activityIndicator;


// Methods
#if 0
- (void)locationManager:(CLLocationManager *)manager 
    didUpdateToLocation:(CLLocation *)newLocation 
           fromLocation:(CLLocation *) oldLocation;

- (void)locationManager:(CLLocationManager *)manager 
       didFailWithError:(NSError *) error;
#endif




@end
