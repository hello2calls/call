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
#import "CooTekVoipSDK.h"
#import "AccountManager.h"

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
    
    [[CooTekVoipSDK sharedCooTekVoipSDK] initialize];
    
    
    return YES;
}




@end
