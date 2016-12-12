//
//  Utils.h
//  demo
//
//  Created by by.huang on 2016/12/7.
//  Copyright © 2016年 by.huang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ByUtils : NSObject

//手机号是否合法
+(BOOL)isPhoneNumVaild  : (NSString *)phoneNum;

//手机号格式化
+(NSString *)generatePhoneNum : (NSString *)phoneNum;

//运行商类型
+(PhoneOperator)getPhoneNumOperator : (NSString *)phoneNum;

//获取当前时间
+(NSString *)getCurrentTime;

@end
