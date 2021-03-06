//
//  MainPage.m
//  demo
//
//  Created by by.huang on 2016/12/6.
//  Copyright © 2016年 by.huang. All rights reserved.
//

#import "MainPage.h"
#import "LoginPage.h"
#import "IMainProtrol.h"
#import "MainPresenter.h"
#import "AccountManager.h"
#import "CooTekVoipSDK.h"
#import "ByUtils.h"
#import "CodeManager.h"
#import "CallPage.h"

@interface MainPage ()<IMainProtrol>

@property (strong, nonatomic) UIButton *unBindBtn;

@property (strong, nonatomic) UILabel *userLabel;

@property (strong, nonatomic) UILabel *remainLabel;

@property (strong, nonatomic) UITextField *phoneTextField;

@property (strong, nonatomic) UIButton *callBtn;

@property (strong , nonatomic) UIButton *checkOnlineBtn;

@property (strong , nonatomic) UIButton *recordListBtn;

@property (strong , nonatomic) UIButton *settingBtn;


@end

@implementation MainPage
{
    MainPresenter *present;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    present = [[MainPresenter alloc]initWithDelegate:self];
    [present active];
    [self initView];
}

-(void)viewWillAppear:(BOOL)animated
{
    if([[AccountManager sharedAccountManager] isLogin])
    {
        [present getAccountInfo];
    }
}


-(void)initView
{
    [self.view setBackgroundColor:BACKGROUND_COLOR];
    [self setTitle:AppName];
    
    _unBindBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    _unBindBtn.frame = CGRectMake(50, NavigationBar_And_StatuBar_Height + 20,  SCREEN_WIDTH - 100, 50);
    _unBindBtn.backgroundColor = [UIColor blueColor];
    if([[AccountManager sharedAccountManager] isLogin])
    {
        [_unBindBtn setTitle:@"解绑" forState:UIControlStateNormal];
    }else{
        [_unBindBtn setTitle:@"绑定" forState:UIControlStateNormal];
    }
    [_unBindBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_unBindBtn addTarget:self action:@selector(OnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_unBindBtn];
    
    _userLabel = [[UILabel alloc]init];
    _userLabel.text = @"当前用户为：";
    _userLabel.textColor = [UIColor blackColor];
    _userLabel.frame = CGRectMake(50, NavigationBar_And_StatuBar_Height + 70, SCREEN_WIDTH - 100 , 50);
    [self.view addSubview:_userLabel];
    
    _remainLabel = [[UILabel alloc]init];
    _remainLabel.text = @"剩余分钟为：";
    _remainLabel.textColor = [UIColor blackColor];
    _remainLabel.frame = CGRectMake(50, NavigationBar_And_StatuBar_Height + 120, SCREEN_WIDTH - 100 , 50);
    [self.view addSubview:_remainLabel];
    
    _phoneTextField = [[UITextField alloc]init];
    [_phoneTextField setBackgroundColor:[UIColor lightGrayColor]];
    _phoneTextField.frame = CGRectMake(50, NavigationBar_And_StatuBar_Height + 170, SCREEN_WIDTH - 160, 50);
    _phoneTextField.keyboardType = UIKeyboardTypeNumberPad;
    _phoneTextField.text = @"18680686420";
    [self.view addSubview:_phoneTextField];
    
    _callBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _callBtn.frame = CGRectMake(SCREEN_WIDTH - 100, NavigationBar_And_StatuBar_Height + 170, 50, 50);
    _callBtn.backgroundColor = [UIColor blueColor];
    [_callBtn setTitle:@"拨号" forState:UIControlStateNormal];
    [_callBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_callBtn addTarget:self action:@selector(OnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_callBtn];
    
    
    _checkOnlineBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    _checkOnlineBtn.frame = CGRectMake(50, NavigationBar_And_StatuBar_Height + 230, SCREEN_WIDTH - 100, 50);
    [_checkOnlineBtn setTitle:@"检测在线" forState:UIControlStateNormal];
    [_checkOnlineBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _checkOnlineBtn.backgroundColor = [UIColor blueColor];
    _checkOnlineBtn.layer.cornerRadius = 4;
    _checkOnlineBtn.layer.masksToBounds = YES;
    [_checkOnlineBtn addTarget:self action:@selector(OnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_checkOnlineBtn];
    
    _recordListBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    _recordListBtn.frame = CGRectMake(50, NavigationBar_And_StatuBar_Height + 290, SCREEN_WIDTH - 100, 50);
    [_recordListBtn setTitle:@"查看录音记录" forState:UIControlStateNormal];
    [_recordListBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _recordListBtn.backgroundColor = [UIColor blueColor];
    _recordListBtn.layer.cornerRadius = 4;
    _recordListBtn.layer.masksToBounds = YES;
    [_recordListBtn addTarget:self action:@selector(OnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_recordListBtn];
    
    
    _settingBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    _settingBtn.frame = CGRectMake(50, NavigationBar_And_StatuBar_Height + 350, SCREEN_WIDTH - 100, 50);
    [_settingBtn setTitle:@"设置" forState:UIControlStateNormal];
    [_settingBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _settingBtn.backgroundColor = [UIColor blueColor];
    _settingBtn.layer.cornerRadius = 4;
    _settingBtn.layer.masksToBounds = YES;
    [_settingBtn addTarget:self action:@selector(OnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_settingBtn];
    
}


-(void)OnClick : (id)sender
{
    UIView *view = sender;
    if(view == _unBindBtn)
    {
        if([[AccountManager sharedAccountManager] isLogin])
        {
            [present logout];
        }
        else
        {
            [LoginPage show:self];
        }
    }
    else if(view == _callBtn)
    {
        if([[AccountManager sharedAccountManager] isLogin])
        {
            NSString *phoneNum = _phoneTextField.text;
            //            if([ByUtils isPhoneNumVaild:phoneNum])
            //            {
            [_phoneTextField resignFirstResponder];
            [CallPage show:self phoneNum : phoneNum];
            //            }
        }
        else{
            [ByToast showWarnToast:@"请登录"];
        }
        
    }
    else if(view == _checkOnlineBtn)
    {
        [ByToast showNormalToast:@"开发中..."];
    }
    else if(view == _recordListBtn)
    {
        [ByToast showNormalToast:@"开发中..."];
    }
    else if(view == _settingBtn)
    {
        [ByToast showNormalToast:@"开发中..."];
    }
}

-(void)OnLogoutSuccess
{
    [[AccountManager sharedAccountManager] unBindAccount];
    [_unBindBtn setTitle:@"绑定" forState:UIControlStateNormal];
    [ByToast showNormalToast:@"解绑成功！"];
}

-(void)OnLogoutFail
{
    [ByToast showErrorToast:@"解绑失败"];
}

-(void)OnGetAccountInfoSuccess:(AccountInfoModel *)model
{
    _userLabel.text = [NSString stringWithFormat:@"当前用户为：%@",model.account_name];
    _remainLabel.text = [NSString stringWithFormat:@"剩余分钟为：%ld",model.balance/60];
    [_unBindBtn setTitle:@"解绑" forState:UIControlStateNormal];
}

-(void)OnGetAccountInfoFail : (NSString *)errorMsg  code : (long)errorCode
{
    if(errorCode == 4004)
    {
        [[AccountManager sharedAccountManager] unBindAccount];
        _userLabel.text = @"当前用户为：";
        _remainLabel.text = @"剩余分钟为：";
        [_unBindBtn setTitle:@"绑定" forState:UIControlStateNormal];
    }
    [ByToast showErrorToast:errorMsg];
}

-(void)OnLoginSuceess
{
    [present getAccountInfo];
}
@end
