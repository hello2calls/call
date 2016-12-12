//
//  FunctionUtility.h
//  TouchPalDialer
//
//  Created by zhang Owen on 8/22/11.
//  Copyright 2011 Cootek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "consts.h"
#import "Reachability.h"

#define PERSON_DEFAULT_COLOR_TYPES (2)

#define davinciADMaxTime 3
#define PlastResourceExpiredSecond        (7*24*60*60)
@interface FunctionUtility : NSObject


+ (BOOL)isTimeUpForEvent:(NSString *)event withSchedule:(double)schedule firstTimeCount:(BOOL)firstTimeCount persistCheck:(BOOL)persist;

+ (NSString*)networkType;

+ (BOOL)isInChina;

+ (NSString *)simpleEncodeForString:(NSString *)string;

+ (NSString *)simpleDecodeForString:(NSString *)string;

+ (void)writeDefaultKeyToDefaults:(NSString *)name andObject:(id)object andKey:(NSString *)key;

+ (float)systemVersionFloat;

+ (NSString *) getWebViewUserAgent;

+ (NSString *)currentWifiBase;


@end
