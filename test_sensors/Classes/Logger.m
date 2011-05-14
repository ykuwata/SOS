//
//  Logger.m
//  test_sensors
//
//  Created by Yoshiaki Kuwata on 5/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Logger.h"


#define NSLog(s,...) NSLog(@"%s:%d %@",__PRETTY_FUNCTION__,__LINE__,[NSString stringWithFormat:(s), ##__VA_ARGS__])


@implementation Logger


- (id)init
{
    if (self = [super init])  // init with superclass
    {
        NSLog(@"initting...");
        count = 0;
#ifdef USE_FPRINTF
        fp = NULL;
#endif
        [self open];
    }
    return self;
}


- (void)dealloc {
    [self close];
    
    // Clean up
    [super dealloc];
}



- (void)open {
    
    // Application Document directory
    NSArray *paths = 
        NSSearchPathForDirectoriesInDomains (NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    // File name
    NSDate *now = [NSDate date];   // current time
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd-EEE-HH-mm-ss"];
    NSString *fname = [formatter stringFromDate:now];
    NSString *fullname = [NSString stringWithFormat:@"%@/%@.dat", documentsDirectory, fname];
    
    NSLog(@"log file: %@", fullname);
    
#ifdef USE_FPRINTF
    // Open a log file
    fp = fopen([fullname UTF8String],"w");
    if (fp == NULL) {
        NSLog(@"Failed to open the file");
        return;
    }
#else
    // Create a file by writing something...
    NSError *error = noErr;
    BOOL success = [@"Log file\n" writeToFile:fullname
                                   atomically:YES 
                                     encoding:NSUTF8StringEncoding 
                                        error:&error];
    if (!success) {
        // handle the error
        NSLog(@"Error %@", error);
    }
    
    // get a handle to the file
    fileHandle = [NSFileHandle fileHandleForWritingAtPath:fullname];
    if (fileHandle == nil) 
        NSLog(@"file does not exist!");

    // move to the end of the file -- not needed for a new file
    [fileHandle seekToEndOfFile];
#endif
    bytesWritten = 0;
    
    if (0){ // testing
        [self write:@"aiueo\n"];
        [self write:@"foo\n"];
        [self write:@"bar\n"];
        [self write:@"aiueo\n"];
    }
}


- (void) write:(NSString *)message {
#ifdef USE_FPRINTF
    assert(fp);
    // Crude way of writing
    bytesWritten += fprintf(fp, "count %3d: %s", bytesWritten, [message UTF8String]);
#else    
    assert(fileHandle);
    // convert the string to an NSData object
    NSData *textData = [message dataUsingEncoding:NSUTF8StringEncoding];
    
    // write the data to the end of the file
    [fileHandle writeData:textData];
    // @todo handle exception
    NSLog(@"written data");
#endif
}


- (void) close {
#ifdef USE_FPRINTF
    if (fp) {
        fclose(fp);
        NSLog(@"wrote %d bytes", bytesWritten);        
    }    
#else
    if (fileHandle)
        [fileHandle closeFile];
#endif    
}

@end
