//
//  LoginPresenter.h
//  demo
//
//  Created by by.huang on 2016/12/8.
//  Copyright © 2016年 by.huang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ILoginProtrol.h"

@interface LoginPresenter : NSObject

@property (strong, nonatomic) id delegate;

//获取验证码
-(void)getVerifyCode : (NSString *)phoneNum;

//登录
-(void)login : (NSString *)phoneNum verifyCode : (NSString *)verifyCode;

@end
