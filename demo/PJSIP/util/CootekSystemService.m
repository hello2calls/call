//
//  CootekSystemService.m
//  TouchPalDialer
//
//  Created by Sendor on 11-10-21.
//  Copyright 2011 Cootek. All rights reserved.
//

#import "CootekSystemService.h"
#import <AVFoundation/AVFoundation.h>
#include <AudioToolbox/AudioToolbox.h>
#import "UserDefaultsManager.h"
static int a = 0;
void playSoundCompletionProc(SystemSoundID ssID, void* clientData) {
    AudioServicesDisposeSystemSoundID(ssID);
}

static SystemSoundID lastPlayedSoundID = 0;

@implementation CootekSystemService
+ (void)playKeySound:(SystemSoundID)soundid {
//    CFURLRef soundFileURLRef;
//    SystemSoundID soundID;
//    CFBundleRef mainBundle = CFBundleGetMainBundle();
//    soundFileURLRef = CFBundleCopyResourceURL(mainBundle, CFSTR("Tock"), CFSTR("caf"), NULL);
//    AudioServicesCreateSystemSoundID(soundFileURLRef, &soundID);
//    CFRelease(soundFileURLRef);
//    AudioServicesAddSystemSoundCompletion(soundID, NULL, NULL, playSoundCompletionProc, NULL);
    AudioServicesPlaySystemSound(soundid);
}

+ (void) stopPlayRecentSound {
        AudioServicesDisposeSystemSoundID(lastPlayedSoundID);
}


+ (void)playVibrate {
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
}

+ (void)playCaf {
    CFURLRef soundFileURLRef;
    SystemSoundID soundID;
    CFBundleRef mainBundle = CFBundleGetMainBundle();
    soundFileURLRef = CFBundleCopyResourceURL(mainBundle, CFSTR("Reminder"), CFSTR("caf"), NULL);
    AudioServicesCreateSystemSoundID(soundFileURLRef, &soundID);
    CFRelease(soundFileURLRef);
    AudioServicesAddSystemSoundCompletion(soundID, NULL, NULL, playSoundCompletionProc, NULL);
    AudioServicesPlaySystemSound(soundID);
}

static int sCount = 0;
#define VIBRATE_COUNT 5
+ (void)startLoopVibrate {
    if (sCount > 0) {
        return;
    }
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        sCount = VIBRATE_COUNT;
        while (sCount-- > 0) {
            if (sCount != VIBRATE_COUNT -1) {
                dispatch_sync(dispatch_get_main_queue(), ^{
                    [self playVibrate];
                });
            }
            sleep(2);
        }
    });
    
}

+ (void)stopLoopVibrate {
    sCount = 0;
}

@end
