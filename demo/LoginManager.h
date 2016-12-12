//
//  LoginManager.h
//  demo
//
//  Created by by.huang on 2016/12/8.
//  Copyright © 2016年 by.huang. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface LoginManager : NSObject

SINGLETON_DECLARATION(LoginManager)

//获取验证码
-(void)getVerifyCode;

//登录
-(void)login;

@end
