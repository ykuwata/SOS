//
//  AccelViewController.h
//  test_sensors
//
//  Created by Yoshiaki Kuwata on 5/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Logger;

@interface AccelViewController : NSObject <UIAccelerometerDelegate>{
    // View
 	IBOutlet UILabel *labelAccel;
 	IBOutlet UILabel *labelCount;
    
    // Counter
    int count;
}

@property (nonatomic,retain) Logger *logger;

@end
