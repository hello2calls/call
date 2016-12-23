//
//  HttpRequest.h
//  demo
//
//  Created by by.huang on 2016/12/12.
//  Copyright © 2016年 by.huang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HttpRequest : NSObject

SINGLETON_DECLARATION(HttpRequest)

typedef void(^SuccessCallback)(id respondObj);

typedef void(^FailCallback)(id respondObj,NSError *error);

-(void) get : (NSString *)url parameters : (NSMutableDictionary *)parameters
    success : (SuccessCallback)success fail : (FailCallback)fail;


-(void) post : (NSString *)url content : (NSString *)jsonStr
     success : (SuccessCallback)success fail : (FailCallback)fail;


@end
