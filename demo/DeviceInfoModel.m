//
//  DeviceInfoModel.m
//  demo
//
//  Created by by.huang on 2016/12/12.
//  Copyright © 2016年 by.huang. All rights reserved.
//

#import "DeviceInfoModel.h"
#import "SystemUtil.h"

@implementation DeviceInfoModel


+(DeviceInfoModel *)buildDeviceModel
{
    DeviceInfoModel *model = [[DeviceInfoModel alloc]init];
    model.os_name = @"ios";
    model.package_name = [SystemUtil getPackageName];
    return model;
    
}

@end
