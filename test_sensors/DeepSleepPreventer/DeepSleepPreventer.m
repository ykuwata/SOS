//
//  DeepSleepPreventer.m
//
/*
 
 Copyright (c) 2009-2010, Marco Peluso - marcopeluso.com
 All rights reserved.
 
 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions are met:
 
 1. Redistributions of source code must retain the above copyright notice,
 this list of conditions and the following disclaimer.
 
 2. Redistributions in binary form must reproduce the above copyright
 notice, this list of conditions and the following disclaimer in the
 documentation and/or other materials provided with the distribution.
 
 3. Neither the name of the copyright holders nor the names of its
 contributors may be used to endorse or promote products derived from
 this software without specific prior written permission.
 
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
 THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR
 CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
 OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
 WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
 OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
 ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 
 */
//

#import "DeepSleepPreventer.h"

#import <AVFoundation/AVFoundation.h>
#import <AudioToolbox/AudioToolbox.h>

@implementation DeepSleepPreventer

@synthesize audioPlayer;
@synthesize preventSleepTimer;

- (id)init
{
    if ((self = [super init])) {
		// Activate audio session
		AudioSessionSetActive(true);
		// Set up audio session, to prevent iPhone from deep sleeping, while playing sounds
		UInt32 sessionCategory = kAudioSessionCategory_MediaPlayback;
		AudioSessionSetProperty (kAudioSessionProperty_AudioCategory,
                                 sizeof (sessionCategory),
                                 &sessionCategory
                                 );
        
		// Set up sound file
		NSString *soundFilePath = [[NSBundle mainBundle] pathForResource:@"noSound"
																  ofType:@"wav"];
		NSURL *fileURL = [[NSURL alloc] initFileURLWithPath:soundFilePath];
        
		// Set up audio player with sound file
		self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:fileURL error:nil];
		[self.audioPlayer prepareToPlay];
        
		// You may want to set this to 0.0 even if your sound file is silent.
		// I don't know exactly, if this affects battery life, but it can't hurt.
		[self.audioPlayer setVolume:0.0];
	}
    return self;
}

- (void)playPreventSleepSound {
	[self.audioPlayer play];
}


- (void)startPreventSleep {
	// We need to play a sound at least every 10 seconds to keep the iPhone awake.
	// We create a new repeating timer, that begins firing now and then every ten seconds.
	// Every time it fires, it calls -playPreventSleepSound
	self.preventSleepTimer = [[NSTimer alloc] initWithFireDate:[NSDate dateWithTimeIntervalSinceNow:0]
                                                      interval:10.0
                                                        target:self
                                                      selector:@selector(playPreventSleepSound)
                                                      userInfo:nil
                                                       repeats:YES];
    //@todo 10 sec?
    
	// We add this timer to the current run loop
	NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
	[runLoop addTimer:self.preventSleepTimer forMode:NSDefaultRunLoopMode];
}


- (void)stopPreventSleep {
	[self.preventSleepTimer invalidate];
	self.preventSleepTimer = nil;
}

- (void)dealloc {
	// memory management
	[preventSleepTimer release];
	[audioPlayer release];
	[super dealloc];
}

@end
