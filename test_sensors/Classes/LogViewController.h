//
//  LogViewController.h
//  test_sensors
//
//  Created by Yoshiaki Kuwata on 5/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@class Logger;


@interface LogViewController : NSObject {
    // View
 	IBOutlet UISwitch *switchLogging;    
    IBOutlet UILabel *label;
    
    // logger
    Logger *loggerGps;
    Logger *loggerAccel;
}


@property (nonatomic,retain) Logger *loggerGps;
@property (nonatomic,retain) Logger *loggerAccel;
- (IBAction)switchChanged:(id)sender;

@end
