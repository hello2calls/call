//
//  BaseParams.m
//  demo
//
//  Created by by.huang on 2016/12/12.
//  Copyright © 2016年 by.huang. All rights reserved.
//

#import "BaseParams.h"
#import "ByUtils.h"


#define Key_Token @"_token"
#define Key_Ts @"_ts"
#define Key_V @"_v"
#define Key_Sign @"_sign"

@implementation BaseParams

//-(instancetype)init
//{
//  if(self == [super init])
//  {
//      [self initBaseParams];
//  }
//  return self;
//}
////
//-(void)initBaseParams
//{
//    [self setObject:@"e380c55c-5dcb-4c5e-8ed4-07c5f0e00d47" forKey:Key_Token];
//    [self setObject:[ByUtils getCurrentTime] forKey:Key_Ts];
//    [self setObject:@"1" forKey:Key_V];
//    [self setObject:@"" forKey:Key_Sign];
//
//}

-(NSString *)getUrl : (NSString *)prefixUrl
{
    NSString *token = @"e380c55c-5dcb-4c5e-8ed4-07c5f0e00d47";
    NSString *ts = [ByUtils getCurrentTime];
    NSString *v = @"1";
    NSString *sign = @"";
    NSString *temp =[NSString stringWithFormat:@"?_token=%@&_ts=%@&_v=%@&_sign=%@",token,ts,v,sign];
    return [prefixUrl stringByAppendingString:temp];

}

@end
