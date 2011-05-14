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


@synthesize logger;


- (id)init
{
    if (self = [super init])  // init with superclass
    {
        NSLog(@"initting...");
        
        // Set up logger
        self.logger = [[Logger alloc] init];
    }
    return self;
}


- (void)dealloc {
    [logger release];
    [super dealloc];
}


- (IBAction)switchChanged:(id)sender 
{
    if (switchLogging.on) {
        // Start logging
        [logger open];
        label.text = [NSString stringWithFormat:@"logging"];
        // Timer?
    } 
    else {
        // Stop logging
        [logger close];
        label.text = [NSString stringWithFormat:@"not logging"];
    }
}

@end
