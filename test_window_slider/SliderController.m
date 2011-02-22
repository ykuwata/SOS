//
//  SliderController.m
//
//  Created by Yoshiaki Kuwata on 2/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SliderController.h"

@implementation SliderController
- (IBAction)sliderChanged:(id)sender 
{
    int sliderValue = slider.value;
    MSG("%d",sliderValue);
    label.text = [NSString stringWithFormat:@"%d", sliderValue];
}
@end
