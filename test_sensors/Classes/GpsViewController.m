//
//  GpsViewController.m
//  test_sensors
//
//  Created by Yoshiaki Kuwata on 5/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "GpsViewController.h"


@implementation GpsViewController

- (id)init
{
    if (self = [super init])
    {
        locmanager = [[CLLocationManager alloc] init];
        
    }
    return self;
}

- (void)dealloc {
    [locmanager release];
    [super dealloc];
}



@end
