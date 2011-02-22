//
//  SliderController.h
//
//  Created by Yoshiaki Kuwata on 2/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

#define MSG(fmt, ...) NSLog((@"%s%d: " fmt), __FUNCTION__, __LINE__, ##__VA_ARGS__);


@interface SliderController : NSObject /* Specify a superclass (eg: NSObject or NSView) */ {
    IBOutlet UILabel *label;
    IBOutlet UISlider *slider;
}
- (IBAction)sliderChanged:(id)sender;
@end
