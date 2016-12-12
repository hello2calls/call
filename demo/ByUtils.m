//
//  Utils.m
//  demo
//
//  Created by by.huang on 2016/12/7.
//  Copyright © 2016年 by.huang. All rights reserved.
//

#import "ByUtils.h"

@implementation ByUtils

+(BOOL)isPhoneNumVaild : (NSString *)phoneNum{
    if(IS_NS_STRING_EMPTY(phoneNum) ||  phoneNum.length != 11){
        return NO;
    }
    NSString * MOBILE = @"^1(3|4|5|7|8)\\d{9}$";
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    if ([regextestmobile evaluateWithObject:phoneNum] == YES){
        return YES;
    }
    else{
        return NO;
    }
}


+(NSString *)generatePhoneNum:(NSString *)phoneNum{
    
    if(IS_NS_STRING_EMPTY(phoneNum)){
        return Error_Nil;
    }
    if(phoneNum.length <= 3){
        return Error_Length;
    }
    NSRange range = NSMakeRange(0, 1);
    NSString *areaNum = [phoneNum substringWithRange:range];
    if([@"86" isEqualToString:areaNum])
    {
        range = NSMakeRange(1, phoneNum.length);
        return [phoneNum substringWithRange:range];
        
    }
    range = NSMakeRange(0, 2);
    areaNum = [phoneNum substringWithRange:range];
    if([@"+86" isEqualToString:areaNum])
    {
        range = NSMakeRange(2, phoneNum.length);
        return  [phoneNum substringWithRange:range];
    }
    return phoneNum;
}


+(PhoneOperator)getPhoneNumOperator : (NSString *)phoneNum{
    //移动
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d|705)\\d{7}$";
    //联通
    NSString * CU = @"^1((3[0-2]|5[256]|8[56])\\d|709)\\d{7}$";
    //电信
    NSString * CT = @"^1((33|53|8[09])\\d|349|700)\\d{7}$";
    //固话
    NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    if ([regextestcm evaluateWithObject:phoneNum] == YES){
        return China_Mobile;
    }
    
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    if([regextestcu evaluateWithObject:phoneNum] == YES){
        return China_Unicom;
    }
    
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    if([regextestct evaluateWithObject:phoneNum] == YES){
        return China_Telecom;
    }
    
    NSPredicate *regextestphs = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",PHS];
    if (([regextestphs evaluateWithObject:self] == YES)){
        return Phones;
    }
    return Other;
}


@end