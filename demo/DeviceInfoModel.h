//
//  DeviceInfoModel.h
//  demo
//
//  Created by by.huang on 2016/12/12.
//  Copyright © 2016年 by.huang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DeviceInfoModel : NSObject

@property (copy, nonatomic) NSString *app_name;

@property (copy, nonatomic) NSString *app_version;

@property (copy, nonatomic) NSString *package_name;

@property (copy, nonatomic) NSString *os_name;

@property (copy, nonatomic) NSString *os_version;

@property (copy, nonatomic) NSString *device_info;

@property (copy, nonatomic) NSString *channel_code;

@property (copy, nonatomic) NSString *imei;

@property (copy, nonatomic) NSString *simid;

@property (copy, nonatomic) NSString *locale;

@property (copy, nonatomic) NSString *mnc;

@property (copy, nonatomic) NSString *manufacturer;

@property (copy, nonatomic) NSString *api_level;

@property (copy, nonatomic) NSString *resolution;

@property (copy, nonatomic) NSString *dpi;

@property (copy, nonatomic) NSString *physical_size;

@property (copy, nonatomic) NSString *identifier;

//@property (copy, nonatomic) NSString *release;

@property (copy, nonatomic) NSString *activate_type;



+(DeviceInfoModel *)buildDeviceModel;

@end
