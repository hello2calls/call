//
//  HttpRequest.m
//  demo
//
//  Created by by.huang on 2016/12/12.
//  Copyright © 2016年 by.huang. All rights reserved.
//

#import "HttpRequest.h"
#import <AFNetworking/AFNetworking.h>
#import "ByUtils.h"
#import "AccountManager.h"
@implementation HttpRequest

SINGLETON_IMPLEMENTION(HttpRequest)


-(void) get : (NSString *)url parameters : (NSMutableDictionary *)parameters
    success : (SuccessCallback)success fail : (FailCallback)fail
{
    
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    [manager GET:url
//      parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
//          success(responseObject);
//      } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//          fail(operation.responseObject ,error);
//      }];
    
}



-(void)post : (NSString *)url content : (NSString *)jsonStr
    success : (SuccessCallback)success fail : (FailCallback)fail
{
    UserInfoModel *userinfoModel = [[AccountManager sharedAccountManager] getUserInfo];
    if(userinfoModel == nil ||  IS_NS_STRING_EMPTY(userinfoModel.access_token)){
        url = [self generateUrlWithoutAuthToken:url];
    }
    else{
        url = [self generateUrl:url token:userinfoModel.access_token];
    }
    NSMutableURLRequest *request =
    [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:url]];
    [request setHTTPMethod:@"POST"];

    [request setHTTPBody:[jsonStr dataUsingEncoding:NSUTF8StringEncoding]];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    [manager setResponseSerializer:[AFHTTPResponseSerializer serializer]];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    NSOperation *operation =[manager HTTPRequestOperationWithRequest:request
                                                             success:^(AFHTTPRequestOperation *operation, id responseObject) {
                                                                 success(responseObject);
                                                                 NSString *cookieString = [[operation.response allHeaderFields] valueForKey:@"Set-Cookie"];
                                                                 [self setCookie:cookieString];
                                                                 NSLog(@"cookie-> %@", cookieString);

                                                                
                                                             }
                                                             failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                                                  fail(operation.responseObject,error);
                                                             }];
    [manager.operationQueue addOperation:operation];
 
}


-(void)setCookie : (NSString *)cookieStr
{
    NSRange range = [cookieStr rangeOfString:@"="];
    NSUInteger start = range.location + 1;
    range = [cookieStr rangeOfString:@";"];
    NSUInteger end = range.location;
    range = NSMakeRange(start,end - start);
    NSString *cookie =  [cookieStr substringWithRange:range];

    UserInfoModel *model = [[AccountManager sharedAccountManager] getUserInfo];
    model.access_token = cookie;
    [[AccountManager sharedAccountManager] saveUserInfo:model];
}

-(NSString *)generateUrlWithoutAuthToken : (NSString *)prefixUrl
{
    NSString *lac = @"0";
    NSString *cid = @"0";
    NSString *base_id = @"0";
    NSString *temp =[NSString stringWithFormat:@"?lac=%@&cid=%@&base_id=%@",lac,cid,base_id];
    return [prefixUrl stringByAppendingString:temp];

}

-(NSString *)generateUrl : (NSString *)prefixUrl
                   token : (NSString *)token
{
    NSString *ts = [ByUtils getCurrentTime];
    NSString *v = @"1";
    NSString *sign = @"";
    NSString *temp =[NSString stringWithFormat:@"?_token=%@&_ts=%@&_v=%@&_sign=%@",token,ts,v,sign];
    return [prefixUrl stringByAppendingString:temp];
}

@end
