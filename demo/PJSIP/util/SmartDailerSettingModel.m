//
//  SmartDailerSettingModel.m
//  TouchPalDialer
//
//  Created by Ailce on 12-2-20.
//  Refactored by Leon on 13-3-10.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "SmartDailerSettingModel.h"
#import "DeviceSim.h"
#import "FunctionUtility.h"
#import "UserDefaultsManager.h"
//#import "OrlandoEngine.h"
#import "CootekNotifications.h"
//#import "ContactCacheChangeCommand.h"
//#import "PhoneNumber.h"
//#import "RuleModel.h"
//#import "ProfileModel.h"

static BOOL CachedIsChinaSim_;  // indicates if the value has been cached
static BOOL IsChinaSimCached_;  // the value

@implementation SmartDailerSettingModel

+ (void)initialize
{
    CachedIsChinaSim_ = NO;
}

+ (SmartDailerSettingModel *)settings
{
    return [[SmartDailerSettingModel alloc] init];
}
@end
