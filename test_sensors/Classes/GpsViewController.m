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
    NSLog(@"I'm here");
    if (self = [super init])
    {
        locmanager = [[CLLocationManager alloc] init];
        self.height.text = @"Loading...";
    }
    return self;
}

- (void)dealloc {
    [locmanager release];
    [super dealloc];
}


@end
