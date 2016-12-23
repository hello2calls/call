//
//  AccountInfoModel.h
//  demo
//
//  Created by by.huang on 2016/12/23.
//  Copyright © 2016年 by.huang. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface AccountInfoModel : NSObject

@property (copy, nonatomic) NSString *invitation_code;

@property (copy, nonatomic) NSString *account_name;

@property (copy, nonatomic) NSString *user_type;

@property (copy, nonatomic) NSString *qualification;

@property (assign, nonatomic) int invitation_used;

@property (assign, nonatomic) int queue;

@property (assign, nonatomic) long temporary_time;

@property (assign, nonatomic) long balance;

@property (assign, nonatomic) int bonus_today;

@property (assign, nonatomic) int register_time;

@property (assign, nonatomic) int deadline;

@property (assign, nonatomic) int new_account;

@property (assign, nonatomic) int share_time;


@end
