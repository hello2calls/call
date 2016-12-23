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
#import "VoipUtils.h"
#import "CallRingUtil.h"
#import "UserDefaultsManager.h"
#import "AppDelegate.h"
#import "CootekSystemService.h"


@implementation CooTekVoipSDK
{
    NSTimer *timer;
    NSInteger seconds;
    Boolean isSpeaker;
    Boolean isMute;
}

SINGLETON_IMPLEMENTION(CooTekVoipSDK)

#pragma mark 初始化
-(void)initialize
{
    Boolean isInit = [PJSIPManager checkInit];
    if(isInit)
    {
        [ByToast showNormalToast:@"初始化成功"];
    }
    else
    {
        [ByToast showErrorToast:@"初始化失败"];
 
    }
    [PJSIPManager setCallStateDelegate:self];
}

#pragma mark 销毁
-(void)deinitialize
{
    [PJSIPManager destroy];
}


///回调部分
#pragma mark 拨号
-(void)callVoip:(NSString *)phoneNum callback : (Boolean)isCallback
{
    [PJSIPManager call:phoneNum callback:isCallback withDelegate:self];
}

#pragma mark 电话响铃中
-(void)onRinging
{
    NSLog(@"by---------------onRinging");
}


#pragma mark 电话已接听
-(void)onConnected
{
    NSLog(@"by---------------onConnected");
    [self startTimer];
}

#pragma mark 通话计时
-(void)startTimer
{
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateTime) userInfo:nil repeats:YES];
    [timer fire];
}


-(void)updateTime
{
    seconds ++ ;
    [[NSNotificationCenter defaultCenter] postNotificationName:Notify_ConnectTime object:[NSString stringWithFormat:@"%d",seconds]];
}

#pragma mark 转换c2p模式
- (void)onSwitchingToC2P
{
    NSLog(@"by---------------onSwitchingToC2P");
}


#pragma mark
- (void)onCallStateInfo:(NSDictionary *)info
{
    
}

#pragma mark 连接断开
- (void)onDisconected
{
    [timer invalidate];
    [self hungUp];
    [CallRingUtil audioEnd];
    NSLog(@"by---------------onDisconected");
    
}

#pragma mark 异常处理
- (void)onCallErrorWithCode:(int)errorCode
{
    NSLog(@"by---------------errorCode->%d",errorCode);
    //    [[CodeManager sharedCodeManager]showErrorMsg : errorCode];
    if (errorCode < BUSY_EVERYWHERE && errorCode != DECLINED) {
        [UserDefaultsManager setBoolValue:YES forKey:VOIP_SHOULD_GUIDE_BACK_CALL];
    }
    if (errorCode == BUSY_EVERYWHERE) {
        [CallRingUtil playBusyHere];
        [self performSelector:@selector(errorOccur:)
                   withObject:@(errorCode)
                   afterDelay:4];
    }
    else {
        [self errorOccur:errorCode];
    }
}


- (void)errorOccur:(int)errorCode {
    if ((errorCode < BUSY_EVERYWHERE || errorCode == SERVICE_UNAVAILIABLE ) && [self isTimeMeet]) {
        
    } else {
        [self afterErrorCompasateAsk : errorCode];
    }
}


- (BOOL)isTimeMeet {
    NSDate *date = [UserDefaultsManager dateForKey:ERROR_HANGUP_COMPSATE_SUCCESS_DATE];
    if (date == nil) {
        return YES;
    }
    NSDate *nowDate = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *compLast = [calendar components:NSCalendarUnitDay fromDate:date];
    NSDateComponents *compNow = [calendar components:NSCalendarUnitDay fromDate:nowDate];
    BOOL isMeet = compNow.day > compLast.day;
    return isMeet;
}


- (void)afterErrorCompasateAsk : (int )errorCode{
    
    if (errorCode == SERVER_MAITAIN){
        
        return;
    }
    if (errorCode == BUSY_EVERYWHERE || errorCode == DECLINE
        || errorCode == DECLINED_LONGER || errorCode == FLOW_FAILED
        || errorCode == SYSTEM_CALL_INCOMING) {
        [CootekSystemService playVibrate];
        [self performSelector:@selector(notifyOtherAudioDevice) withObject:nil afterDelay:3];
    }else if (errorCode < UNKNOWN_ERROR|| errorCode ==ERR_REASON_COUNTRY_OFFLINE ||
              errorCode ==  ERR_REASON_COUNTRY_UNSUPPORT ) {
        [CallRingUtil playDuTone];
        [self performSelector:@selector(notifyOtherAudioDevice) withObject:nil afterDelay:3];
    }
    
}

- (void)notifyOtherAudioDevice {
    [CallRingUtil audioEnd];
    [self hungUp];
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
    NSLog(@"onIncoming--------------------------------------------------------------------------->%@",number);
}





//动作

-(void)hungUp
{
    [PJSIPManager hangup:@"主动挂断"];
    [[NSNotificationCenter defaultCenter] postNotificationName:Notify_Hungup object:nil];
}

-(void)callback : (NSString *)phoneNum
{
    [self hungUp];
    [self callVoip:phoneNum callback:YES];
}

-(Boolean)mute
{
    isMute = !isMute;
    [PJSIPManager mute:isMute];
    return isMute;
}

-(Boolean)speaker
{
   isSpeaker = !isSpeaker;
   [PJSIPManager setSpeakerEnabled:isSpeaker];
   return isSpeaker;
}


-(Boolean)isAnswer
{
   return [PJSIPManager isAnswerIncomingCall];
}

-(void)acceptAnswer
{
    [PJSIPManager acceptIncomingCall];
}


@end
