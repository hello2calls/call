//
//  AppDelegate.m
//  demo
//
//  Created by by.huang on 2016/12/6.
//  Copyright © 2016年 by.huang. All rights reserved.
//

#import "AppDelegate.h"
#import "MainPage.h"
#import <AFNetworking/AFNetworking.h>



@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    _window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    _window.backgroundColor = BACKGROUND_COLOR;
    
    
    MainPage *mainPage = [[MainPage alloc]init];
    UINavigationController *navController = [[UINavigationController alloc]initWithRootViewController:mainPage];
    [_window setRootViewController:navController];
    [_window makeKeyAndVisible];
    
    [self listenNetChange];
    return YES;
}


#pragma mark 监听网络变化
-(void)listenNetChange
{
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:
                _netStatu = None;
                break;
                
            case AFNetworkReachabilityStatusNotReachable:
                _netStatu = None;
                break;
                
            case AFNetworkReachabilityStatusReachableViaWWAN:
                _netStatu = Wan;
                break;
                
            case AFNetworkReachabilityStatusReachableViaWiFi:
                _netStatu = Wifi;
                break;
            default:
                break;
        }
    }];
    [manager startMonitoring];
}



@end
