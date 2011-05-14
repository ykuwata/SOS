//
//  Logger.h
//  test_sensors
//
//  Created by Yoshiaki Kuwata on 5/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


//#define USE_FPRINTF

@interface Logger : NSObject {
    int count;
    
#ifdef USE_FPRINTF
    // Log file (C-like)
    FILE *fp;
#else
    // Log file (iOS)
    NSFileHandle *fileHandle;
#endif
    // number of bytes written
    int bytesWritten;
}



- (void) open;
- (void) close;
- (void) write: (NSString *)message;

@end
