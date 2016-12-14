/*
 
 File: Reachability.m
 Abstract: Basic demonstration of how to use the SystemConfiguration Reachablity APIs.
 
 Version: 2.2
 
 Disclaimer: IMPORTANT:  This Apple software is supplied to you by Apple Inc.
 ("Apple") in consideration of your agreement to the following terms, and your
 use, installation, modification or redistribution of this Apple software
 constitutes acceptance of these terms.  If you do not agree with these terms,
 please do not use, install, modify or redistribute this Apple software.
 
 In consideration of your agreement to abide by the following terms, and subject
 to these terms, Apple grants you a personal, non-exclusive license, under
 Apple's copyrights in this original Apple software (the "Apple Software"), to
 use, reproduce, modify and redistribute the Apple Software, with or without
 modifications, in source and/or binary forms; provided that if you redistribute
 the Apple Software in its entirety and without modifications, you must retain
 this notice and the following text and disclaimers in all such redistributions
 of the Apple Software.
 Neither the name, trademarks, service marks or logos of Apple Inc. may be used
 to endorse or promote products derived from the Apple Software without specific
 prior written permission from Apple.  Except as expressly stated in this notice,
 no other rights or licenses, express or implied, are granted by Apple herein,
 including but not limited to any patent rights that may be infringed by your
 derivative works or by other works in which the Apple Software may be
 incorporated.
 
 The Apple Software is provided by Apple on an "AS IS" basis.  APPLE MAKES NO
 WARRANTIES, EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION THE IMPLIED
 WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 PURPOSE, REGARDING THE APPLE SOFTWARE OR ITS USE AND OPERATION ALONE OR IN
 COMBINATION WITH YOUR PRODUCTS.
 
 IN NO EVENT SHALL APPLE BE LIABLE FOR ANY SPECIAL, INDIRECT, INCIDENTAL OR
 CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE
 GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 ARISING IN ANY WAY OUT OF THE USE, REPRODUCTION, MODIFICATION AND/OR
 DISTRIBUTION OF THE APPLE SOFTWARE, HOWEVER CAUSED AND WHETHER UNDER THEORY OF
 CONTRACT, TORT (INCLUDING NEGLIGENCE), STRICT LIABILITY OR OTHERWISE, EVEN IF
 APPLE HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 
 Copyright (C) 2010 Apple Inc. All Rights Reserved.
 
 */

#import <sys/socket.h>
#import <netinet/in.h>
#import <netinet6/in6.h>
#import <arpa/inet.h>
#import <ifaddrs.h>
#import <netdb.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <CoreFoundation/CoreFoundation.h>

#import "Reachability.h"
#import "AppDelegate.h"

//#define kShouldPrintReachabilityFlags 1

static void PrintReachabilityFlags(SCNetworkReachabilityFlags    flags, const char* comment)
{
#if kShouldPrintReachabilityFlags
	
    cootek_log(@"Reachability Flag Status: %c%c %c%c%c%c%c%c%c %s\n",
               (flags & kSCNetworkReachabilityFlagsIsWWAN)				  ? 'W' : '-',
               (flags & kSCNetworkReachabilityFlagsReachable)            ? 'R' : '-',
               
               (flags & kSCNetworkReachabilityFlagsTransientConnection)  ? 't' : '-',
               (flags & kSCNetworkReachabilityFlagsConnectionRequired)   ? 'c' : '-',
               (flags & kSCNetworkReachabilityFlagsConnectionOnTraffic)  ? 'C' : '-',
               (flags & kSCNetworkReachabilityFlagsInterventionRequired) ? 'i' : '-',
               (flags & kSCNetworkReachabilityFlagsConnectionOnDemand)   ? 'D' : '-',
               (flags & kSCNetworkReachabilityFlagsIsLocalAddress)       ? 'l' : '-',
               (flags & kSCNetworkReachabilityFlagsIsDirect)             ? 'd' : '-',
               comment
               );
#endif
}


@implementation Reachability

static Reachability *sharedInstance;

static void ReachabilityCallback(SCNetworkReachabilityRef target, SCNetworkReachabilityFlags flags, void* info)
{
#pragma unused (target, flags)
	NSCAssert(info != NULL, @"info was NULL in ReachabilityCallback");
	NSCAssert([(NSObject*) info isKindOfClass: [Reachability class]], @"info was wrong class in ReachabilityCallback");
    
	Reachability* noteObject = (Reachability*) info;
	// Post a notification to notify the client that the network reachability changed.
	cootek_log(@"COOTEK s log:: Reachability - reachability changed!");
	[[NSNotificationCenter defaultCenter] postNotificationName: N_REACHABILITY_NETWORK_CHANE object: noteObject];
	
}

- (void) startNotifier
{
    if (![NSThread isMainThread]) {
        [self performSelectorOnMainThread:@selector(startNotifier) withObject:nil waitUntilDone:NO];
        return;
    }
    
	SCNetworkReachabilityContext	context = {0,self, NULL, NULL, NULL};
	if(SCNetworkReachabilitySetCallback(reachabilityRef, ReachabilityCallback, &context))
	{
		SCNetworkReachabilityScheduleWithRunLoop(reachabilityRef, CFRunLoopGetCurrent(), kCFRunLoopDefaultMode);
	}
}

- (void) stopNotifier
{
    if (![NSThread isMainThread]) {
        [self performSelectorOnMainThread:@selector(stopNotifier) withObject:nil waitUntilDone:NO];
        return;
    }
    
	if(reachabilityRef!= NULL)
	{
		SCNetworkReachabilityUnscheduleFromRunLoop(reachabilityRef, CFRunLoopGetCurrent(), kCFRunLoopDefaultMode);
	}
}

- (void) dealloc
{
	[self stopNotifier];
	if(reachabilityRef!= NULL)
	{
		CFRelease(reachabilityRef);
	}
    [super dealloc];
}

+ (Reachability*) reachabilityWithHostName: (NSString*) hostName;
{
	Reachability* retVal = NULL;
	SCNetworkReachabilityRef reachability = SCNetworkReachabilityCreateWithName(NULL, [hostName UTF8String]);
	if(reachability!= NULL)
	{
		retVal= [[[self alloc] init] autorelease];
		if(retVal!= NULL)
		{
			retVal->reachabilityRef = reachability;
			retVal->localWiFiRef = NO;
		}
	}
	return retVal;
}

+ (Reachability*) reachabilityWithAddress: (const struct sockaddr_in*) hostAddress;
{
	SCNetworkReachabilityRef reachability = SCNetworkReachabilityCreateWithAddress(kCFAllocatorDefault, (const struct sockaddr*)hostAddress);
	Reachability* retVal = NULL;
	if(reachability!= NULL)
	{
		retVal= [[[self alloc] init] autorelease];
		if(retVal!= NULL)
		{
			retVal->reachabilityRef = reachability;
			retVal->localWiFiRef = NO;
		}
	}
	return retVal;
}

+ (Reachability*) reachabilityForInternetConnection;
{
	struct sockaddr_in zeroAddress;
	bzero(&zeroAddress, sizeof(zeroAddress));
	zeroAddress.sin_len = sizeof(zeroAddress);
	zeroAddress.sin_family = AF_INET;
	return [self reachabilityWithAddress: &zeroAddress];
}

+ (Reachability*) reachabilityForLocalWiFi;
{
	struct sockaddr_in localWifiAddress;
	bzero(&localWifiAddress, sizeof(localWifiAddress));
	localWifiAddress.sin_len = sizeof(localWifiAddress);
	localWifiAddress.sin_family = AF_INET;
	// IN_LINKLOCALNETNUM is defined in <netinet/in.h> as 169.254.0.0
	localWifiAddress.sin_addr.s_addr = htonl(IN_LINKLOCALNETNUM);
	Reachability* retVal = [self reachabilityWithAddress: &localWifiAddress];
	if(retVal!= NULL)
	{
		retVal->localWiFiRef = YES;
	}
	return retVal;
}

+ (ClientNetworkType)network
{
    return [[self shareReachability] networkStatus];
}

#pragma mark Network Flag Handling



- (BOOL) connectionRequired;
{
	NSAssert(reachabilityRef != NULL, @"connectionRequired called with NULL reachabilityRef");
	SCNetworkReachabilityFlags flags;
	if (SCNetworkReachabilityGetFlags(reachabilityRef, &flags))
	{
		return (flags & kSCNetworkReachabilityFlagsConnectionRequired);
	}
	return NO;
}


- (ClientNetworkType) networkStatus {
    ClientNetworkType returnValue = network_none;
    SCNetworkReachabilityFlags flags;
    if(SCNetworkReachabilityGetFlags(reachabilityRef, &flags))
    {
        int status = ((AppDelegate *)([UIApplication sharedApplication].delegate)).netStatu;
        switch (status) {
            case Wifi:
                returnValue = network_wifi;
                break;
            case Wan:
                returnValue = [self mobileNetwrokType:flags];
                break;
            default:
                returnValue = network_none;
                break;
        }
    
    }
    return returnValue;
}

- (ClientNetworkType)mobileNetwrokType:(SCNetworkReachabilityFlags)flags
{
     ClientNetworkType returnValue = network_none;
    if ((flags & kSCNetworkReachabilityFlagsIsWWAN) == kSCNetworkReachabilityFlagsIsWWAN)
    {
        
        if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
        {
            
            CTTelephonyNetworkInfo * info = [[CTTelephonyNetworkInfo alloc] init];
            NSString *currentRadioAccessTechnology = info.currentRadioAccessTechnology;
            if (currentRadioAccessTechnology)
            {
                if ([currentRadioAccessTechnology isEqualToString:CTRadioAccessTechnologyLTE])
                {
                    returnValue =  network_4g;
                }
                else if ([currentRadioAccessTechnology isEqualToString:CTRadioAccessTechnologyEdge]
                         || [currentRadioAccessTechnology isEqualToString:CTRadioAccessTechnologyGPRS])
                {
                    returnValue =  network_2g;
                }
                else
                {
                    returnValue =  network_3g;
                }
                return returnValue;
                
            }
        }
        
        if ((flags & kSCNetworkReachabilityFlagsTransientConnection) == kSCNetworkReachabilityFlagsTransientConnection)
        {
            if((flags & kSCNetworkReachabilityFlagsConnectionRequired) == kSCNetworkReachabilityFlagsConnectionRequired)
            {
                returnValue =  network_2g;
                return returnValue;
            }
            returnValue =  network_3g;
            return returnValue;
        }
    }
    return returnValue;
}


+ (void)startNotify
{
    [[Reachability shareReachability] startNotifier];
}

+ (Reachability *)shareReachability
{
    @synchronized(self) {
        if (!sharedInstance) {
            sharedInstance = [[Reachability reachabilityForInternetConnection] retain];
            
            [sharedInstance startNotifier];
        }
    }
    
    return sharedInstance;
}
@end
