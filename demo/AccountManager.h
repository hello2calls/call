//
//  AccountManager.h
//  demo
//
//  Created by by.huang on 2016/12/12.
//  Copyright © 2016年 by.huang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserInfoModel.h"

@interface AccountManager : NSObject

SINGLETON_DECLARATION(AccountManager)

-(void)saveUserInfo : (UserInfoModel *)userinfo;

-(UserInfoModel *)getUserInfo;

-(Boolean)isLogin;

-(NSString *)getPhoneNum;

@end


