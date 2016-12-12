//
//  CooTekVoipSDK.h
//  demo
//
//  Created by by.huang on 2016/12/6.
//  Copyright © 2016年 by.huang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CooTekVoipSDK : NSObject

//初始化SDK
-(void)initialize;

//销毁SDK
-(void)deinitialize;

//设置是否打开log开关
-(void)setDebugMode : (BOOL) flag;

//是否登录免费电话
-(BOOL)isVoipLogin;

//获取免费电话登录号码
-(NSString *)getVoipLoginNumber;

//进入免费电话设置界面
-(void)launchVoipSetting;

//拨打免费电话
-(void)callVoip;

//进入登录界面
-(void)launchLoginActivity;

//判断用户是否在线
-(BOOL)isUserOnline;

//获取录音文件列表
-(NSMutableArray *)getMediaRecordList;

//判断是否是回拨号码
-(BOOL)isCallbackNum;

//登录引导弹框
-(void)showSignInLeadDialog;


@end
