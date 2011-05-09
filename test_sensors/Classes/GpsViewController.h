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
    IBOutlet UILabel *labelLocation;
 	IBOutlet UILabel *labelAltitude;
    IBOutlet UILabel *labelAccuracy;
    IBOutlet UILabel *labelVelocity;    
	IBOutlet UILabel *labelDate;
	IBOutlet UILabel *labelRecent;
    IBOutlet UILabel *labelSuccessCount;
    IBOutlet UILabel *labelFailCount;
    //IBOutlet UIActivityIndicatorView *activityIndicator;
    
    // Counter
    int successCount;
    int failCount;
    
    // Timer
    NSTimer *timer;
    
    // Get GPS info
    CLLocationManager  *locManager;
    CLLocation *bestEffortAtLocation;
}

#if 0 // needed??
// Text labels
@property (nonatomic,retain) IBOutlet UILabel *labelHeight;
@property (nonatomic,retain) IBOutlet UILabel *labelLocation;
@property (nonatomic,retain) IBOutlet UILabel *labelDate;
//@property (nonatomic,retain) IBOutlet UIActivityIndicatorView *activityIndicator;
#endif


// Methods
#if 0
- (void)locationManager:(CLLocationManager *)manager 
    didUpdateToLocation:(CLLocation *)newLocation 
           fromLocation:(CLLocation *) oldLocation;

- (void)locationManager:(CLLocationManager *)manager 
       didFailWithError:(NSError *) error;
#endif




@end
