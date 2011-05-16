//
//  LogViewController.m
//  test_sensors
//
//  Created by Yoshiaki Kuwata on 5/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "LogViewController.h"
#import "Logger.h"

#define NSLog(s,...) NSLog(@"%s:%d %@",__PRETTY_FUNCTION__,__LINE__,[NSString stringWithFormat:(s), ##__VA_ARGS__])


@implementation LogViewController


@synthesize loggerGps;
@synthesize loggerAccel;


- (id)init
{
    if (self = [super init])  // init with superclass
    {
        NSLog(@"initting...");
    }
    return self;
}


- (void)dealloc {
    [super dealloc];
}


- (IBAction)switchChanged:(id)sender 
{
    assert(loggerGps);
    assert(loggerAccel);
    
    if (switchLogging.on) {
        // Start logging
        [loggerGps open];
        [loggerAccel open];
        label.text = [NSString stringWithFormat:@"logging"];
    } 
    else {
        // Stop logging
        [loggerGps close];
        [loggerAccel close];
        label.text = [NSString stringWithFormat:@"not logging"];
    }
}

@end
