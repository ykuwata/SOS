//
//  CameraViewController.h
//  test_sensors
//
//  Created by Yoshiaki Kuwata on 5/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CameraViewController 
    : UIViewController<UIImagePickerControllerDelegate, UINavigationControllerDelegate> 
{
    UIImagePickerController *picker;
    
    //IBOutlet UIImageView* imageView; // not sure why we need this...
    
    IBOutlet UILabel *labelCount;
    IBOutlet UISwitch *switchTakePics;
    
    // Timer
    NSTimer *timer;
    
    // Picture counter
    int count;
    
    // flag
    BOOL taking;
}

#if 0
// Take picture
- (IBAction) getImageByCamera:(id)i_sender;
#endif

@end
