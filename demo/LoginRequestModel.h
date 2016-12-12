//
//  LoginRequestModel.h
//  demo
//
//  Created by by.huang on 2016/12/12.
//  Copyright © 2016年 by.huang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginRequestModel : NSObject

@property (copy, nonatomic) NSString *account_type;

@property (copy, nonatomic) NSString *account_name;

@property (copy, nonatomic) NSString *verification;

@end
