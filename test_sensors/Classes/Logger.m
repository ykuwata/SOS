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

@synthesize fileOpen;
@synthesize name;

- (id)initWithName:(NSString*)nameIn
{
    if (self = [super init])  // init with superclass
    {
        NSLog(@"initting...");
        count = 0;
        fileOpen = FALSE;
        self.name = nameIn;
        [self.name retain]; //@todo needed?
#ifdef USE_FPRINTF
        fp = NULL;
#endif
    }
    return self;
}


- (void)dealloc {
    [self.name release];
    [self close];
    
    // Clean up
    [super dealloc];
}



- (int)open {
    
    // Application Document directory
    NSArray *paths = 
        NSSearchPathForDirectoriesInDomains (NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    // File name
    NSDate *now = [NSDate date];   // current time
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd-EEE-HH-mm-ss"];
    NSString *fname = [NSString stringWithFormat:@"%@_%@.dat", 
                       [formatter stringFromDate:now], self.name];
    NSString *fullname = [NSString stringWithFormat:@"%@/%@", documentsDirectory, fname];
    
    NSLog(@"log file: %@", fullname);
    
#ifdef USE_FPRINTF
    // Open a log file
    fp = fopen([fullname UTF8String],"w");
    if (fp == NULL) {
        NSLog(@"Failed to open the file");
        return -1;
    }
#else
    // Create a file by writing something...
    NSError *error = noErr;
    NSString *header = [NSString stringWithFormat:@"Log file: %@\n", fname];
    BOOL success = [header writeToFile:fullname
                            atomically:YES 
                              encoding:NSUTF8StringEncoding 
                                 error:&error];
    if (!success) {
        // handle the error
        NSLog(@"Error %@", error);
        return -1;
    }
    
    // get a handle to the file
    fileHandle = [NSFileHandle fileHandleForWritingAtPath:fullname];
    if (fileHandle == nil) {
        NSLog(@"file does not exist!");
        return -1;
    }
    [fileHandle retain];   // fileHandle gets auto-released without this...
    
    // move to the end of the file -- not needed for a new file
    [fileHandle seekToEndOfFile];
#endif
    
    // Renew the symbolic link
    if (1) {
        NSFileManager *fm = [NSFileManager defaultManager];
        [fm changeCurrentDirectoryPath:[documentsDirectory stringByExpandingTildeInPath]];
        
        // remove the symbolic link
        NSError *error = noErr;
        NSString *latest = [NSString stringWithFormat:@"latest_%@", name]; 
        success = [fm removeItemAtPath:latest
                                 error:&error];
        if (success)
            NSLog(@"removed 'latest_%@'", name);
        
        // create a new link
        error = noErr;
        success = [fm createSymbolicLinkAtPath:latest 
                           withDestinationPath:fname
                                         error:&error];
        if (success)
            NSLog(@"created symlink 'latest_%@'", name);
        else {
            NSLog(@"Symlink failed... %@", error);
            return -1;
        }
    }
    fileOpen = TRUE;
    bytesWritten = 0;
    
    if (0){ // testing
        [self write:@"aiueo\n"];
        [self write:@"foo\n"];
        [self write:@"bar\n"];
        [self write:@"aiueo\n"];
    }
    
    return 0;
}


- (void) write:(NSString *)message {
    assert (fileOpen);
    
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
#endif
    
    count++;
}


- (void) close {
#ifdef USE_FPRINTF
    if (fp) {
        fclose(fp);
        NSLog(@"wrote %d bytes", bytesWritten);        
    }    
#else
    if (fileHandle) {
        [fileHandle closeFile];
        [fileHandle release];
    }
#endif
    
    fileOpen = FALSE;
}

@end
