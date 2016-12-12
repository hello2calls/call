//
//  ILoginProtrol.h
//  demo
//
//  Created by by.huang on 2016/12/12.
//  Copyright © 2016年 by.huang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoginResondModel.h"

@protocol ILoginProtrol <NSObject>

-(void)OnLoginSuccess : (LoginResondModel *)model;

-(void)OnLoginFail : (NSString *)errorMsg;

-(void)OnSendVerifyCodeSuccess : (BaseRespondModel *)model;

-(void)OnSendVerifyCodeFail : (NSString *)errorMsg;

@end
