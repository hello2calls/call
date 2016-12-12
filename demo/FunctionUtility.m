//
//  FunctionUtility.m
//  TouchPalDialer
//
//  Created by zhang Owen on 8/22/11.
//  Copyright 2011 Cootek. All rights reserved.
//

#import "FunctionUtility.h"
#import <SystemConfiguration/CaptiveNetwork.h>
#import "UserDefaultsManager.h"
#import "SeattleFeatureExecutor.h"
//#import "ScheduleInternetVisit.h"
#import "Reachability.h"
#import <sys/utsname.h>
#import "TouchPalVersionInfo.h"
//#import "DeviceSim.h"
#import "DefaultUIAlertViewHandler.h"
//#import "DialerUsageRecord.h"
//#import "TPMFMessageActionController.h"
//#import "TPShareController.h"
//#import "QQShareController.h"
//#import "HandlerWebViewController.h"
#include <ifaddrs.h>
#include <arpa/inet.h>
//#import "DialerGuideAnimationManager.h"
//#import "RootScrollViewController.h"
//#import "TPDialerResourceManager.h"
//#import "CTUrl.h"
//#import "FLWebViewProvider.h"
//#import "TPAnalyticConstants.h"
//#import "DateTimeUtil.h"
//#import "NSString+TPHandleNil.h"
//#import "VoipCallPopUpView.h"
//#import "LocalStorage.h"
//#import "PersonInfoDescViewController.h"
//#import "AllViewController.h"
//#import "VoipUtils.h"
//#import "PhoneNumber.h"
#define sinaWeiboOAuthConsumerKey		@"1142947862"
#define debugLogFloder		@"debugLogFloder"
#define defaultLogTxt              @"defultLog.txt"

@implementation FunctionUtility


+ (BOOL)isTimeUpForEvent:(NSString *)event withSchedule:(double)schedule firstTimeCount:(BOOL)firstTimeCount persistCheck:(BOOL)persist{
    NSDate *lastUpdateDate = [UserDefaultsManager dateForKey:event
                                                defaultValue:nil];
    if ((lastUpdateDate == nil && firstTimeCount) || [lastUpdateDate compare:[NSDate date]] == NSOrderedDescending) {
        if (persist) {
            [UserDefaultsManager setObject:[NSDate date] forKey:event];
        }
        return YES;
    } else if (lastUpdateDate == nil) {
        return NO;
    }
    NSTimeInterval actualTimeInterval = [[NSDate date] timeIntervalSinceDate:lastUpdateDate];
    if (actualTimeInterval < schedule) {
        return NO;
    }
    if (persist) {
        [UserDefaultsManager setObject:[NSDate date] forKey:event];
    }
    return YES;
}


+ (NSString*)networkType
{
    NSString *type = @"";
    switch([[Reachability shareReachability] networkStatus]) {
        case network_wifi:
            type = @"wifi";
            break;
        case network_2g:
            type = @"2g";
            break;
        case network_3g:
            type = @"3g";
            break;
        case network_none:
            type = @"none";
            break;
        case network_4g:
            type = @"4g";
            break;
        case network_lte:
            type = @"lte";
            break;
        default:
            break;
    }
    return type;
}



+ (BOOL)isInChina {
    if (HARD_CODE_C2C_SUPORT) {
        if ([UserDefaultsManager boolValueForKey:@"test_c2c_support"]) {
            return NO;
        }
        NSString *timeZone = [NSTimeZone localTimeZone].description.lowercaseString;
        dispatch_async(dispatch_get_main_queue(), ^{
            [DefaultUIAlertViewHandler showAlertViewWithTitle:@"请把这个框截图发给我们吧" message:[NSString stringWithFormat:@"当前时区:%@", timeZone]];
        });
        [UserDefaultsManager setBoolValue:YES forKey:@"test_c2c_support"];
        return NO;
    }
    if ([UserDefaultsManager boolValueForKey:@"inter_roaming"]) {
        return NO;
    }
    NSString *timeZone = [NSTimeZone localTimeZone].description.lowercaseString;
    if ( ([timeZone rangeOfString:@"gmt+8"].length > 0 || [timeZone rangeOfString:@"gmt+08"].length > 0) && [timeZone rangeOfString:@"asia/"].length > 0) {
        //still may some country that is not China, but we try the best
        return YES;
    }
//    if (![UserDefaultsManager boolValueForKey:HAS_RECORD_USER_INTER_ROMAING]) {
//        [DialerUsageRecord recordpath:USER_INTERNATIONAL_ROAMING kvs:Pair(@"intl-roaming", @(YES)), nil];
//        [UserDefaultsManager setBoolValue:YES forKey:HAS_RECORD_USER_INTER_ROMAING];
//    }
    return NO;
}


+ (NSString *)simpleEncodeForString:(NSString *)string {
    if (string.length == 0) {
        return nil;
    }
    //1 round
    int middle = string.length/7;
    NSString *prefix = [string substringToIndex:middle];
    NSString *suffix = [string substringFromIndex:middle];
    NSString *mix = [NSString stringWithFormat:@"%@%@", suffix, prefix];
    //second round
    middle = mix.length/4;
    prefix = [mix substringToIndex:middle];
    suffix = [mix substringFromIndex:middle];
    mix = [NSString stringWithFormat:@"%@%@", suffix, prefix];
    //map
    NSMutableString *mapString = [NSMutableString stringWithString:@""];
    for (int i = 0; i<mix.length; i++) {
        unichar e = [mix characterAtIndex:i];
        unichar newchar = 3*e + 33;
        [mapString appendString:[NSString stringWithCharacters:&newchar length:1]];
    }
    return mapString;
}

+ (NSString *)simpleDecodeForString:(NSString *)string {
    if (string.length == 0) {
        return nil;
    }
    //unmap
    NSMutableString *unmapString = [NSMutableString stringWithString:@""];
    for (int i = 0; i < string.length; i ++) {
        unichar e = [string characterAtIndex:i];
        unichar c = (e - 33)/3;
        [unmapString appendString:[NSString stringWithCharacters:&c length:1]];
    }
    //second round
    int middle = unmapString.length - unmapString.length/4;
    NSString *prefix = [unmapString substringToIndex:middle];
    NSString *suffix = [unmapString substringFromIndex:middle];
    NSString *unmix = [NSString stringWithFormat:@"%@%@", suffix, prefix];
    //first round
    middle = unmix.length - unmix.length/7;
    prefix = [unmix substringToIndex:middle];
    suffix = [unmix substringFromIndex:middle];
    return [NSString stringWithFormat:@"%@%@", suffix, prefix];
}

+ (void)writeDefaultKeyToDefaults:(NSString *)name andObject:(id)object andKey:(NSString *)key{
    if ( [[UIDevice currentDevice].systemVersion intValue] > 7){
        NSUserDefaults *shared = [[NSUserDefaults alloc] initWithSuiteName:name];
        [shared setObject:object forKey:key];
        [shared synchronize];
    }
}



+ (float)systemVersionFloat {
    return [[[UIDevice currentDevice] systemVersion] floatValue];
}




+(NSString *)getWebViewUserAgent{
    NSString *myUserAgent = [UserDefaultsManager stringForKey:UserAgent defaultValue:@""];
    if (myUserAgent.length == 0) {
        dispatch_async(dispatch_get_main_queue(), ^{
            UIWebView *webView = [[UIWebView alloc]initWithFrame:CGRectZero];
            NSString *userAgent = [webView stringByEvaluatingJavaScriptFromString:@"navigator.userAgent"];
            [UserDefaultsManager setObject:userAgent forKey:UserAgent];
        });
    }
    return myUserAgent;

}

+ (NSString *)currentWifiBase{
    NSString *bssid = @"";
    CFArrayRef cfArrayRef = CNCopySupportedInterfaces();
    NSArray *ifs = (__bridge id)cfArrayRef;
    for (NSString *ifnam in ifs) {
        CFStringRef cfStringRef = (CFStringRef)CFBridgingRetain(ifnam);
        CFDictionaryRef cfDicRef = CNCopyCurrentNetworkInfo(cfStringRef);
        if (cfDicRef != NULL) {
            NSDictionary *info = [(__bridge id)cfDicRef copy];
            cootek_log(@"wifi info:%@",info);
            CFRelease(cfDicRef);
            CFRelease(cfStringRef);
            if (info[@"BSSID"]) {
                bssid = info[@"BSSID"];
                break;
            }
        }
    }
    if (cfArrayRef != NULL) {
        CFRelease(cfArrayRef);
    }
    return bssid;
}


@end
