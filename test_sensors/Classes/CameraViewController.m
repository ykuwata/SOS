//
//  CameraViewController.m
//  test_sensors
//
//  Created by Yoshiaki Kuwata on 5/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CameraViewController.h"


#define NSLog(s,...) NSLog(@"%s:%d %@",__PRETTY_FUNCTION__,__LINE__,[NSString stringWithFormat:(s), ##__VA_ARGS__])



@implementation CameraViewController

- (id)init
{
    NSLog(@"initting...");
    if (self = [super init]) {
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]
            == NO) {
            NSLog(@"Camera not available");
            return nil;
        }
        
        picker = [[UIImagePickerController alloc] init];
     
        // Configure
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        picker.allowsEditing = NO;
        picker.delegate = self;        
        [self presentModalViewController:picker animated:YES];
    
        
        // Timer
        timer = [ NSTimer scheduledTimerWithTimeInterval: 10.0f
                                                  target: self 
                                                selector: @selector( takeOnePicture: )
                                                userInfo: nil 
                                                 repeats: YES ];
        NSLog(@"starting a timer");
        
        // other stuff
        count = 0;
        taking = FALSE;
    }
    return self;
}


- (void)dealloc
{
    [picker release];
	[super dealloc];
}


// take a picture
- (void) takeOnePicture: (NSTimer *) theTimer {
    if (taking) {
        NSLog(@"still taking a pic...");
        return;
    }
#if 0 // yoshi debuggging 
    if (switchTimer.on == NO) {
        NSLog(@"timer not enabled");
        return;
    }
#endif
        
    // Ready to take
    NSLog(@"pic request!");
    [picker takePicture];
    taking = TRUE;
    
#if 0
    [self startCameraPickerFromViewController:self 
                                usingDelegate:self 
                                   sourceType:UIImagePickerControllerSourceTypeCamera];
#endif
}


- (void) imagePickerController:(UIImagePickerController *)picker 
 didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSLog(@"done");
    
    taking = FALSE;
    
    labelCount.text = [NSString stringWithFormat: @"%d", ++count];
}

@end
