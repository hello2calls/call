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
#import "BaseRespondModel.h"
#import "AccountInfoModel.h"
#import "ByUtils.h"
#import "IMainProtrol.h"
@implementation MainPresenter

-(instancetype)initWithDelegate : (id)delegate
{
    if(self == [super init])
    {
        _delegate = delegate;
    }
    return self;
}


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
    [[HttpRequest sharedHttpRequest] post:Url_Logout content:@"" success:^(id respondObj) {
        BaseRespondModel *model = [BaseRespondModel mj_objectWithKeyValues:respondObj];
        if(model != nil)
        {
            if(API_SUCCESS == model.result_code){
                [self.delegate OnLogoutSuccess];
            }
            else{
                [self.delegate OnLogoutFail];
            }
        }
        else{
            [self.delegate OnLogoutFail];
        }
    } fail:^(id respondObj, NSError *error) {
        BaseRespondModel *model = [BaseRespondModel mj_objectWithKeyValues:respondObj];
        if(model != nil)
        {
            if(API_SUCCESS == model.result_code){
                [self.delegate OnLogoutSuccess];
            }
            else{
                [self.delegate OnLogoutFail];
            }
        }
        else{
            [self.delegate OnLogoutFail];
        }
    }];
}


#pragma mark 获取账户信息
-(void)getAccountInfo
{
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
    dic[@"_token"] = [[AccountManager sharedAccountManager] getUserInfo].access_token;
    dic[@"_ts"] = [ByUtils getCurrentTime];
    dic[@"_v"] = @"1";
    dic[@"_sign"] = @"";
    dic[@"_channel_code"] = @"";
    dic[@"_new_account"] = @"1";
    [[HttpRequest sharedHttpRequest] get:Url_AccountInfo parameters:dic success:^(id respondObj) {
        
        BaseRespondModel *resondModel = [BaseRespondModel mj_objectWithKeyValues:respondObj];
        if(resondModel.result_code == API_SUCCESS)
        {
            AccountInfoModel *model =[AccountInfoModel mj_objectWithKeyValues:resondModel.result];
            [_delegate OnGetAccountInfoSuccess : model];
        }
        else{
            [_delegate OnGetAccountInfoFail : resondModel.err_msg code:resondModel.result_code];
        }
        
        
    } fail:^(id respondObj, NSError *error) {
        BaseRespondModel *resondModel = [BaseRespondModel mj_objectWithKeyValues:respondObj];
        (resondModel == nil) ?
        [_delegate OnGetAccountInfoFail : Error_Unkown code:-1] : [_delegate OnGetAccountInfoFail:resondModel.err_msg code:resondModel.result_code];
        
    }];
}

@end
