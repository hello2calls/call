//
//  LoginPresenter.m
//  demo
//
//  Created by by.huang on 2016/12/8.
//  Copyright © 2016年 by.huang. All rights reserved.
//

#import "LoginPresenter.h"
#import "HttpRequest.h"
#import "BaseParams.h"
#import "ByUtils.h"

@implementation LoginPresenter

#pragma mark 获取验证码
-(void)getVerifyCode : (NSString *)phoneNum
{
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
    dic[@"account_type"] = AccountType;
    dic[@"account_name"] = phoneNum;
    dic[@"type"] = @"sms";
    
    NSString *jsonStr = dic.mj_JSONString;
    
    [[HttpRequest sharedHttpRequest] post:Url_GetVerifyCode content:jsonStr  success:^(id respondObj) {
        
        BaseRespondModel *model = [BaseRespondModel mj_objectWithKeyValues:respondObj];
        if(API_SUCCESS == model.result_code)
        {
            [self.delegate OnSendVerifyCodeSuccess:model];
        }
        else{
            [self.delegate OnSendVerifyCodeFail:model.err_msg];
        }
    } fail:^(id respondObj, NSError *error) {
        BaseRespondModel *model = [BaseRespondModel mj_objectWithKeyValues:respondObj];
        if(model != nil)
        {
            [self.delegate OnSendVerifyCodeFail:model.err_msg];
        }else{
            [self.delegate OnSendVerifyCodeFail:Str_UnKnow_Error];
        }
    }];

}


#pragma mark 登录
-(void)login : (NSString *)phoneNum verifyCode : (NSString *)verifyCode
{
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
    dic[@"account_type"] = AccountType;
    dic[@"account_name"] = phoneNum;
    dic[@"verification"] = verifyCode;
    
    NSString *jsonStr = dic.mj_JSONString;

    [[HttpRequest sharedHttpRequest] post:Url_Login content:jsonStr  success:^(id respondObj) {
        
        LoginResondModel *model = [LoginResondModel mj_objectWithKeyValues:respondObj];
        if(API_SUCCESS == model.result_code)
        {
            [self.delegate OnLoginSuccess:model];
        }
        else{
            [self.delegate OnLoginFail:model.err_msg];
        }
    } fail:^(id respondObj, NSError *error) {
        BaseRespondModel *model = [BaseRespondModel mj_objectWithKeyValues:respondObj];
        if(model != nil)
        {
            [self.delegate OnLoginFail:model.err_msg];
        }else{
            [self.delegate OnLoginFail:Str_UnKnow_Error];
        }
    }];
}




@end
