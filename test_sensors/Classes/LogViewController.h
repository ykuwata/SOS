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
    
    // Link
    Logger *logger;
}


@property (nonatomic,retain) Logger *logger;
- (IBAction)switchChanged:(id)sender;

@end
