//
//  CallPage.m
//  demo
//
//  Created by by.huang on 2016/12/16.
//  Copyright © 2016年 by.huang. All rights reserved.
//

#import "CallPage.h"
#import "CooTekVoipSDK.h"
#import "ByUtils.h"
#import "AppDelegate.h"
@interface CallPage ()

@property (strong, nonatomic) UIImageView *bgImageView;

@property (strong, nonatomic) UILabel *phoneNumLabel;

@property (strong, nonatomic) UILabel *timestatuLabel;

@property (strong, nonatomic) UIButton *hungUpBtn;

@end

@implementation CallPage


+(void)show : (UIViewController *)page phoneNum : (NSString *)phoneNum
{
    CallPage *callPage = [[CallPage alloc]init];
    callPage.phoneNum = phoneNum;
    [page.navigationController pushViewController:callPage animated:YES];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES];
    NSString *phoneNum = [ByUtils generatePhoneNum:_phoneNum];

    [((AppDelegate *)([UIApplication sharedApplication].delegate)).cooTekVoipSDK callVoip:phoneNum];
    [self initView];
}

-(void)viewDidAppear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(OnConnectCallBack:) name:Notify_ConnectTime object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onHangupCallBack) name:Notify_Hungup object:nil];

}

-(void)viewDidDisappear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:Notify_ConnectTime object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:Notify_Hungup object:nil];

}

-(void)initView
{
    _bgImageView = [[UIImageView alloc]init];
    _bgImageView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    _bgImageView.image = [UIImage imageNamed:@"outgoing_bg"];
    [self.view addSubview:_bgImageView];
    
    _phoneNumLabel = [[UILabel alloc]init];
    _phoneNumLabel.textColor = [UIColor whiteColor];
    _phoneNumLabel.text = _phoneNum;
    _phoneNumLabel.font = [UIFont systemFontOfSize:30.0f];
    _phoneNumLabel.textAlignment = NSTextAlignmentCenter;
    _phoneNumLabel.frame = CGRectMake(0, 120, SCREEN_WIDTH, _phoneNumLabel.contentSize.height);
    [self.view addSubview:_phoneNumLabel];
    
    _timestatuLabel = [[UILabel alloc]init];
    _timestatuLabel.textColor = [UIColor whiteColor];
    _timestatuLabel.text = @"正在呼叫...";
    _timestatuLabel.font = [UIFont systemFontOfSize:20.0f];
    _timestatuLabel.textAlignment = NSTextAlignmentCenter;
    _timestatuLabel.frame = CGRectMake(0, 180, SCREEN_WIDTH, _timestatuLabel.contentSize.height);
    [self.view addSubview:_timestatuLabel];
    
    _hungUpBtn = [[UIButton alloc]init];
    [_hungUpBtn setImage:[UIImage imageNamed:@"ic_shutdown"] forState:UIControlStateNormal];
    _hungUpBtn.frame = CGRectMake((SCREEN_WIDTH - 64)/2, SCREEN_HEIGHT - 160, 64, 64);
    [_hungUpBtn addTarget:self action:@selector(OnTapHungUp) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_hungUpBtn];
    
   
}

-(void)OnConnectCallBack : (NSNotification *)notification
{
    int time = [notification.object intValue];
    NSString *reslut = [ByUtils generateCallingTime:time];
    _timestatuLabel.text = reslut;
}

-(void)OnTapHungUp
{
     [((AppDelegate *)([UIApplication sharedApplication].delegate)).cooTekVoipSDK hungUp];
}

-(void)onHangupCallBack
{
    _timestatuLabel.text = @"通话结束...";
    [self performSelector:@selector(closeCallPage) withObject:self afterDelay:1.0f];
}

-(void)closeCallPage
{
    [self.navigationController popViewControllerAnimated:YES];
}


@end
