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
@interface CallPage ()

@property (strong, nonatomic) UIImageView *bgImageView;

@property (strong, nonatomic) UILabel *phoneNumLabel;

@property (strong, nonatomic) UILabel *timestatuLabel;

@property (strong, nonatomic) UIButton *hungUpBtn;

//回拨
@property (strong, nonatomic) UIButton *callbackBtn;

//静音
@property (strong, nonatomic) UIButton *muteBtn;

//免提
@property (strong, nonatomic) UIButton *speakerBtn;

//拨号盘
@property (strong, nonatomic) UIButton *numBtn;


@end

@implementation CallPage
{
    Boolean isCallBack;
}


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

    [[CooTekVoipSDK sharedCooTekVoipSDK] callVoip:phoneNum callback:NO];
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
    
    int width  = (SCREEN_WIDTH - 200) /3 ;
    
    _hungUpBtn= [[UIButton alloc]init];
    _hungUpBtn.frame = CGRectMake(100+width, SCREEN_HEIGHT - 140, width, width);
    [_hungUpBtn setTitle:@"挂断" forState:UIControlStateNormal];
    _hungUpBtn.titleLabel.font = [UIFont systemFontOfSize:13.0f];
    _hungUpBtn.layer.borderColor = [[UIColor whiteColor]CGColor];
    _hungUpBtn.layer.borderWidth = 0.5;
    _hungUpBtn.layer.cornerRadius = width/2;
    _hungUpBtn.layer.masksToBounds = YES;
    [_hungUpBtn addTarget:self action:@selector(OnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_hungUpBtn];
    
    _callbackBtn = [[UIButton alloc]init];
    _callbackBtn.frame = CGRectMake(80, SCREEN_HEIGHT - 240, width, width);
    [_callbackBtn setTitle:@"回拨" forState:UIControlStateNormal];
    _callbackBtn.titleLabel.font = [UIFont systemFontOfSize:13.0f];
    _callbackBtn.layer.borderColor = [[UIColor whiteColor]CGColor];
    _callbackBtn.layer.borderWidth = 0.5;
    _callbackBtn.layer.cornerRadius = width/2;
    _callbackBtn.layer.masksToBounds = YES;
    [_callbackBtn addTarget:self action:@selector(OnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_callbackBtn];
    
    _muteBtn = [[UIButton alloc]init];
    _muteBtn.frame = CGRectMake(100+width, SCREEN_HEIGHT - 240, width, width);
    [_muteBtn setTitle:@"静音" forState:UIControlStateNormal];
    _muteBtn.titleLabel.font = [UIFont systemFontOfSize:13.0f];
    _muteBtn.layer.borderColor = [[UIColor whiteColor]CGColor];
    _muteBtn.layer.borderWidth = 0.5;
    _muteBtn.layer.cornerRadius = width/2;
    _muteBtn.layer.masksToBounds = YES;
    [_muteBtn addTarget:self action:@selector(OnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_muteBtn];
    
    _speakerBtn = [[UIButton alloc]init];
    _speakerBtn.frame = CGRectMake(SCREEN_WIDTH - 80- width, SCREEN_HEIGHT - 240, width, width);
    [_speakerBtn setTitle:@"免提" forState:UIControlStateNormal];
    _speakerBtn.titleLabel.font = [UIFont systemFontOfSize:13.0f];
    _speakerBtn.layer.borderColor = [[UIColor whiteColor]CGColor];
    _speakerBtn.layer.borderWidth = 0.5;
    _speakerBtn.layer.cornerRadius = width/2;
    _speakerBtn.layer.masksToBounds = YES;
    [_speakerBtn addTarget:self action:@selector(OnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_speakerBtn];
    
    
   
}

-(void)updateButtonStatu : (UIButton *)button clicked : (Boolean)isClick
{
    button.backgroundColor = isClick ? [UIColor whiteColor] : [UIColor clearColor];
    [button setTitleColor : isClick ? [UIColor blueColor] : [UIColor whiteColor] forState:UIControlStateNormal];
}

-(void)OnConnectCallBack : (NSNotification *)notification
{
    int time = [notification.object intValue];
    NSString *reslut = [ByUtils generateCallingTime:time];
    _timestatuLabel.text = reslut;
}

-(void)OnClick : (id)sender
{

    UIButton *button = sender;
    if(button == _hungUpBtn)
    {
        isCallBack = NO;
        [[CooTekVoipSDK sharedCooTekVoipSDK] hungUp];
    }
    else if(button == _callbackBtn)
    {
        isCallBack = YES;
        [[CooTekVoipSDK sharedCooTekVoipSDK] hungUp];
        [[CooTekVoipSDK sharedCooTekVoipSDK] callVoip:_phoneNum callback:YES];
        
        _timestatuLabel.hidden = YES;
        _muteBtn.hidden = YES;
        _callbackBtn.hidden = YES;
        _speakerBtn.hidden = YES;
        [_hungUpBtn setTitle:@"隐藏" forState:UIControlStateNormal];
    }
    else if(button == _muteBtn)
    {
        Boolean isMute = [[CooTekVoipSDK sharedCooTekVoipSDK] mute];
        [self updateButtonStatu:_muteBtn clicked:isMute];
    }
    else if(button == _speakerBtn)
    {
        Boolean isSpeaker = [[CooTekVoipSDK sharedCooTekVoipSDK] speaker];
        [self updateButtonStatu:_speakerBtn clicked:isSpeaker];
    }
}

-(void)onHangupCallBack 
{
    if(!isCallBack){
        _timestatuLabel.text = @"通话结束...";
        [self performSelector:@selector(closeCallPage) withObject:self afterDelay:1.0f];
    }
}

-(void)closeCallPage
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
