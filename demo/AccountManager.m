//
//  AccountManager.m
//  demo
//
//  Created by by.huang on 2016/12/12.
//  Copyright © 2016年 by.huang. All rights reserved.
//

#import "AccountManager.h"

#define User_Ticket @"_ticket"
#define User_Token @"_token"
#define Auth_Token @"auth_token"


@implementation AccountManager

SINGLETON_IMPLEMENTION(AccountManager)

-(void)saveUserInfo:(UserInfoModel *)userinfo
{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    [userDefault setObject:userinfo.auth_token forKey:Auth_Token];
    [userDefault setObject:userinfo.ticket forKey:User_Ticket];
    [userDefault setObject:userinfo.access_token forKey:User_Token];
    [userDefault synchronize];
}


-(UserInfoModel *)getUserInfo
{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    UserInfoModel *model = [[UserInfoModel alloc]init];
    model.auth_token = [userDefault objectForKey:Auth_Token];
    model.ticket = [userDefault objectForKey:User_Ticket];
    model.access_token = [userDefault objectForKey:User_Token];
    return model;
}

@end
