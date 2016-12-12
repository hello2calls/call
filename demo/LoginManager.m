//
//  LoginManager.m
//  demo
//
//  Created by by.huang on 2016/12/8.
//  Copyright © 2016年 by.huang. All rights reserved.
//

#import "LoginManager.h"
#import <MBProgressHUD/MBProgressHUD.h>
#import "PJSIPManager.h"

@implementation LoginManager

SINGLETON_IMPLEMENTION(LoginManager)

-(void)getVerifyCode
{
    [ByToast showNormalToast:@"获取验证码成功!"];
    if([PJSIPManager isInit])
    {
        [ByToast showNormalToast:@"初始化成功"];
    }
    else{
        [ByToast showNormalToast:@"初始化失败"];

    }
}


-(void)login
{
    
}

@end
