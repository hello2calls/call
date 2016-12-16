//
//  Constant.h
//  demo
//
//  Created by by.huang on 2016/12/7.
//  Copyright © 2016年 by.huang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Constant : NSObject

// 错误类型
#define Error_Nil @"error_nil"
#define Error_Length @"error_length"

// Strings
#define Str_Login_Register @"登录注册"
#define Str_Login_Tips @"通过手机号码验证后可使用免费电话"
#define Str_Login_Phone_Hint @"请填写您的手机号码"
#define Str_Login_Verify_Hint @"输入验证码"
#define Str_Login_Verify @"获取验证码"
#define Str_Login @"登录"
#define Str_Login_Phone_Input_Error @"手机号码输入有误"


#define Str_UnKnow_Error @"未知错误"

// 网络

#define Root_Url @"http://ws2.cootekservice.com:80/"

#define Url_Active [Root_Url stringByAppendingString:@"auth/activate"]
#define Url_Login [Root_Url stringByAppendingString:@"auth/login"]
#define Url_GetVerifyCode [Root_Url stringByAppendingString:@"auth/send_verification"]
#define Url_Logout [Root_Url stringByAppendingString:@"auth/logout"]


//错误码

#define API_ERROR_NONE_ERROR       0
#define API_ERROR_INPUT_ERROR      1000
#define API_ERROR_TOKEN_INVALID    1001
#define API_ERROR_TOKEN_UPDATED    1002
#define API_ERROR_NEED_HISTORY     1003
#define API_ERROR_RETRY_LATER      1004
#define API_ERROR_TOKEN_EXPIRED    1005
#define API_ERROR_ACCESS_DENIED    1006
#define API_SUCCESS                2000



#define AccountType @"com.cootek.auth.phone"

//运营商类型
typedef NS_ENUM(NSInteger,PhoneOperator)
{
    China_Mobile = 0, //中国移动
    China_Unicom , //中国联通
    China_Telecom ,//中国电信
    Phones , //固话
    Other
};





@end
