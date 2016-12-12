//
//  MainPresenter.m
//  demo
//
//  Created by by.huang on 2016/12/12.
//  Copyright © 2016年 by.huang. All rights reserved.
//

#import "MainPresenter.h"
#import "HttpRequest.h"
#import "DeviceInfoModel.h"
@implementation MainPresenter


#pragma mark 激活
-(void)active
{
    /*****未完成(缺少设备信息采集)*****/
    
//    DeviceInfoModel *model = [DeviceInfoModel buildDeviceModel];
//    NSString *jsonStr =  model.mj_JSONString;
    
    NSString *jsonStr = @"{\"app_name\": \"cootek.contactplus.android.oem\",\"app_version\": \"54001\",\"package_name\": \"com.cootek.smartdialer_oem_all_module\",\"os_name\": \"Android\",\"os_version\": \"6.0\",\"device_info\": \"LenovoPB2-670N\",\"channel_code\": \"OEMTTTTTTTTT\",\"imei\":\"\",\"simid\": \"\",\"locale\": \"zh-cn\",\"mnc\": \"\",\"manufacturer\": \"LENOVO\",\"api_level\": \"23\",\"resolution\":\"1920*1080\",\"dpi\": \"360\",\"physical_size\": \"6.12\",\"recommend_channel\": \"OEMTTTTTTTTT\",\"identifier\": \"02: 00: 00: 00: 00: 00##ca391a88f7989e46\",\"sys_app\": false,\"release\": \"1478501888\",\"activate_type\": \"new\"}";
    [[HttpRequest sharedHttpRequest]post:Url_Active content:jsonStr success:^(id respondObj) {
        
    } fail:^(id respondObj, NSError *error) {
        NSLog(@"2");

    }];
}

#pragma mark 登出
-(void)logout
{
//    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
//    dic[@"account_type"] = AccountType;
////    dic[@"verification"] = verifyCode;
//    
//    NSString *jsonStr = dic.mj_JSONString;
//    
//    [[HttpRequest sharedHttpRequest] post:Url_Logout content:jsonStr  success:^(id respondObj) {
//        
//        LoginResondModel *model = [LoginResondModel mj_objectWithKeyValues:respondObj];
//        if(API_SUCCESS == model.result_code)
//        {
//            [self.delegate OnLoginSuccess:model];
//        }
//        else{
//            [self.delegate OnLoginFail:model.err_msg];
//        }
//    } fail:^(id respondObj, NSError *error) {
//        BaseRespondModel *model = [BaseRespondModel mj_objectWithKeyValues:respondObj];
//        if(model != nil)
//        {
//            [self.delegate OnLoginFail:model.err_msg];
//        }else{
//            [self.delegate OnLoginFail:Str_UnKnow_Error];
//        }
//    }];
//    
}


@end
