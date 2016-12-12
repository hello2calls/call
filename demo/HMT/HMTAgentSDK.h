//
//  HMTAgentSDK.h
//  HMTAgentSDK
//
//  Created by yufeng on 16/3/11.
//  Copyright © 2016年 Hypers. All rights reserved.
//

#ifndef HMTAgentSDK_h
#define HMTAgentSDK_h

typedef enum {
    HMT_BATCH    = 0,  //启动时发送
    HMT_REALTIME = 1   //实时发送
} HMTReportPolicy;     //发送模式

#import <Foundation/Foundation.h>

@interface HMTAgentSDK : NSObject

//初始化SDK
//appkey:App唯一标识
//channel:发布渠道,默认为@"App Store"
//reportPolicy:发送模式,默认为启动时发送
//unTracked:不提交的数据属性名
//trackedUrl:要监测的网络请求Host,@"*"代表全部监测
+ (void)initWithAppKey:(NSString *)appkey channel:(NSString *)channel;
+ (void)initWithAppKey:(NSString *)appkey reportPolicy:(HMTReportPolicy)reportPolicy channel:(NSString *)channel;
+ (void)initWithAppKey:(NSString *)appkey channel:(NSString *)channel unTracked:(NSArray<NSString *> *)unTracked;
+ (void)initWithAppKey:(NSString *)appkey reportPolicy:(HMTReportPolicy)reportPolicy channel:(NSString *)channel unTracked:(NSArray<NSString *> *)unTracked;
+ (void)initWithAppKey:(NSString *)appkey channel:(NSString *)channel trackedUrl:(NSArray<NSString *> *)trackedUrl;
+ (void)initWithAppKey:(NSString *)appkey reportPolicy:(HMTReportPolicy)reportPolicy channel:(NSString *)channel trackedUrl:(NSArray<NSString *> *)trackedUrl;
+ (void)initWithAppKey:(NSString *)appkey channel:(NSString *)channel unTracked:(NSArray<NSString *> *)unTracked trackedUrl:(NSArray<NSString *> *)trackedUrl;
+ (void)initWithAppKey:(NSString *)appkey reportPolicy:(HMTReportPolicy)reportPolicy channel:(NSString *)channel unTracked:(NSArray<NSString *> *)unTracked trackedUrl:(NSArray<NSString *> *)trackedUrl;

//如果需要配置服务器地址,在调用initWithAppKey初始化SDK方法后调用setServerHost,参数值格式为:@"https://xxx.com"
+ (BOOL)setServerHost:(NSString *)host;

//Activity页面加载布码调用(activity:页面名称)
+ (BOOL)startTracPage:(NSString *)activity;
//Activity页面离开布码调用(结束上一次调用startTracPage的页面)
+ (BOOL)endTracPage;

//发送自定义事件(action:事件名称,acc:事件发生次数,acc默认为1)
+ (BOOL)postAction:(NSString *)action;
+ (BOOL)postAction:(NSString *)action acc:(NSInteger)acc;

//发送客户端信息
+ (BOOL)postClientData;

//发送用户Tag(用户标签,例如:运动,数学,购物等)
+ (BOOL)postTag:(NSString *)tag;

//绑定用户ID(用户的ID,只是作为一个扩展接口,可以不用处理)
+ (BOOL)bindUserIdentifier:(NSString *)userid;

//设置调试模式(release版本暂不处理)
+ (void)setDebug:(BOOL)debug;

@end

#endif