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

// Text labels
@synthesize height;
@synthesize date;
@synthesize location;
//@synthesize activityIndicator;


- (id)init
{
    if (self = [super init])  // init with superclass
    {
        NSLog(@"initting...");

        // Location manager
        locmanager = [[CLLocationManager alloc] init];
        
        // Timer
        timer = [ NSTimer scheduledTimerWithTimeInterval: 1.0f
                                                  target: self 
                                                selector: @selector( updateGps: )
                                                userInfo: nil 
                                                 repeats: YES ];
    }
    return self;
}

- (void)dealloc {
    [locmanager release];
    [super dealloc];
}


- (void) updateGps: (NSTimer *) theTimer {
    static int count = 0;
    height.text = [NSString stringWithFormat: @"%d",
                   count++];
}

@end
