//
//  Constant.h
//  demo
//
//  Created by by.huang on 2016/12/7.
//  Copyright © 2016年 by.huang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Constant : NSObject


#define Error_Nil @"error_nil"
#define Error_Length @"error_length"



#define Str_Login_Register @"登录注册"
#define Str_Login_Tips @"通过手机号码验证后可使用免费电话"
#define Str_Login_Phone_Hint @"请填写您的手机号码"
#define Str_Login_Verify_Hint @"输入验证码"
#define Str_Login_Verify @"获取验证码"
#define Str_Login @"登录"
#define Str_Login_Phone_Input_Error @"手机号码输入有误"


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
