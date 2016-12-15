//
//  CooTekVoipSDK.m
//  demo
//
//  Created by by.huang on 2016/12/6.
//  Copyright © 2016年 by.huang. All rights reserved.
//

#import "CooTekVoipSDK.h"
#import "PJSIPManager.h"
#import "CodeManager.h"

@implementation CooTekVoipSDK

SINGLETON_IMPLEMENTION(CooTekVoipSDK)

-(void)initialize
{
    Boolean isInit = [PJSIPManager checkInit];
    if(isInit)
    {
        [ByToast showNormalToast:@"sdk初始化成功！"];
    }
    else
    {
        [ByToast showNormalToast:@"sdk初始化失败！"];
    }
}

-(void)deinitialize
{
    NSLog(@"销毁");
}


-(void)callVoip:(NSString *)phoneNum
{
    [PJSIPManager call:phoneNum callback:YES withDelegate:self];
}

-(void)onRinging
{
    NSLog(@"onRinging");
}

-(void)onConnected
{
    NSLog(@"onConnected");
}
- (void)onSwitchingToC2P
{
    NSLog(@"onSwitchingToC2P");
}


- (void)onCallStateInfo:(NSDictionary *)info
{
    
}

- (void)onDisconected
{
    NSLog(@"onDisconected");
    
}

- (void)onCallErrorWithCode:(int)errorCode
{
    NSLog(@"errorCode->%d",errorCode);
    [[CodeManager sharedCodeManager]showErrorMsg : errorCode];
    
}
- (void)onCallModeSet:(NSString *)callMode
{
    NSLog(@"onCallModeSet->%@",callMode);
    
}
- (void)notifyEdgeNotStable
{
    NSLog(@"notifyEdgeNotStable");
    
}
- (void)onIncoming:(NSString *)number
{
    NSLog(@"onIncoming->%@",number);
    
}


@end
