//
//  AccelViewController.m
//  test_sensors
//
//  Created by Yoshiaki Kuwata on 5/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AccelViewController.h"
#import "Logger.h"

#define NSLog(s,...) NSLog(@"%s:%d %@",__PRETTY_FUNCTION__,__LINE__,[NSString stringWithFormat:(s), ##__VA_ARGS__])


@implementation AccelViewController


@synthesize logger;


- (id)init
{
    if (self = [super init])  // init with superclass
    {
        NSLog(@"initting...");
        count = 0;
        
        // 1. Create UIAccelerometer
        UIAccelerometer * theAccel = [UIAccelerometer sharedAccelerometer];
        
        // 2. Configure
        theAccel.updateInterval = 1.0/10;  // in seconds --> 10 Hz
        
        // 3. Set the delegate (object to receive the acceleration event)
        theAccel.delegate = self;  // this starts the event

        // Logger
        logger = [[Logger alloc] initWithName:@"Accel"];
    }
    return self;
}

- (void)dealloc {
    // Clean up
    [logger release];
    UIAccelerometer* theAccel = [UIAccelerometer sharedAccelerometer];
    theAccel.delegate = nil;

    [super dealloc];
}


- (void)accelerometer:(UIAccelerometer*)accelerometer
        didAccelerate:(UIAcceleration*)acceleration
{
	// Get the event data
	UIAccelerationValue ax, ay, az;
	ax = acceleration.x;  // horizontal
	ay = acceleration.y;  // vertical
	az = acceleration.z;  // from front to back
                     
#if 0
	// Process the data?
#define FILTERFACTOR (1.0)
	if (1) { // LPF (simple)
        float value = (newAcceleration * FILTERFACTOR) + (previousValue * (1.0 - FILTERFACTOR));
        previousValue = value;
    }
    else {	// HPF
        float value = newAcceleration - (newAcceleration * FILTERFACTOR) + 
        (previousValue * (1.0 - FILTERFACTOR));
        previousValue = value;
    }
#endif                                                                                                                                  
    
    // display
    labelAccel.text = [NSString stringWithFormat: @"(% .3f, % .3f, % .3f)", ax, ay, az];
    labelCount.text = [NSString stringWithFormat: @"%d", count++];
    
    // Log
    if (logger.fileOpen) {
        // @todo Record time
        [logger write:[NSString stringWithFormat: @"(% .3f, % .3f, % .3f)\n", ax, ay, az]];        
    }
}

@end
