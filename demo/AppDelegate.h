//
//  AppDelegate.h
//  demo
//
//  Created by by.huang on 2016/12/6.
//  Copyright © 2016年 by.huang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CooTekVoipSDK.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (assign, nonatomic) int netStatu;

@property (strong, nonatomic) CooTekVoipSDK *cooTekVoipSDK;

@end

