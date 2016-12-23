//
//  IMainProtrol.h
//  demo
//
//  Created by by.huang on 2016/12/12.
//  Copyright © 2016年 by.huang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AccountInfoModel.h"

@protocol IMainProtrol <NSObject>

-(void)OnLogoutSuccess;

-(void)OnLogoutFail;

-(void)OnGetAccountInfoSuccess : (AccountInfoModel *)model;

-(void)OnGetAccountInfoFail : (NSString *)errorMsg;

@end
