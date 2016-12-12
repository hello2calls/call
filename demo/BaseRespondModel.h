//
//  BaseRespondModel.h
//  demo
//
//  Created by by.huang on 2016/12/12.
//  Copyright © 2016年 by.huang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseRespondModel : NSObject

@property (copy, nonatomic) NSString *err_msg;

@property (assign, nonatomic) long req_id;

@property (assign, nonatomic) long result_code;

@property (copy, nonatomic) NSString *result;

@end
