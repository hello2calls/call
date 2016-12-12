//
//  LoginResondModel.h
//  demo
//
//  Created by by.huang on 2016/12/12.
//  Copyright © 2016年 by.huang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseRespondModel.h"

@interface LoginResondModel : BaseRespondModel

@property (copy, nonatomic) NSString *access_token;

@property (copy, nonatomic) NSString *ticket;

@end
