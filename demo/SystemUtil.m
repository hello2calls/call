//
//  SystemUtil.m
//  demo
//
//  Created by by.huang on 2016/12/12.
//  Copyright © 2016年 by.huang. All rights reserved.
//

#import "SystemUtil.h"

@implementation SystemUtil

+(NSString *)getPackageName
{
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    return [infoDictionary objectForKey:@"CFBundleDisplayName"];
}

@end
