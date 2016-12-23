//
//  IncomingCallPage.m
//  demo
//
//  Created by by.huang on 2016/12/22.
//  Copyright © 2016年 by.huang. All rights reserved.
//

#import "IncomingCallPage.h"
#import "ByUtils.h"
#import "CooTekVoipSDK.h"
#import "CallRingUtil.h"

@interface IncomingCallPage ()

@property (strong, nonatomic) UIImageView *bgImageView;

@property (strong, nonatomic) UILabel *phoneNumLabel;

@property (strong, nonatomic) UILabel *timestatuLabel;

@property (strong, nonatomic) UIButton *acceptBtn;

@property (strong, nonatomic) UIButton *hungUpBtn;

@end

@implementation IncomingCallPage
{
    NSTimer *timer;
    int seconds;
    int width;
}

+(void)show : (NSString *)number
{
    IncomingCallPage *page = [[IncomingCallPage alloc]init];
    page.number = number;
    UIViewController *currentPage = [ByUtils getCurrentViewControlelr];
    [currentPage presentViewController:page animated:YES completion:nil];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
}

-(void)viewDidAppear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onHangupCallBack) name:Notify_Hungup object:nil];
}

-(void)viewDidDisappear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:Notify_Hungup object:nil];
    
}

-(void)initView
{
    width  = (SCREEN_WIDTH - 300) /2 ;

    _bgImageView = [[UIImageView alloc]init];
    _bgImageView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    _bgImageView.image = [UIImage imageNamed:@"outgoing_bg"];
    [self.view addSubview:_bgImageView];
    
    _phoneNumLabel = [[UILabel alloc]init];
    _phoneNumLabel.textColor = [UIColor whiteColor];
    _phoneNumLabel.text = _number;
    _phoneNumLabel.font = [UIFont systemFontOfSize:30.0f];
    _phoneNumLabel.textAlignment = NSTextAlignmentCenter;
    _phoneNumLabel.frame = CGRectMake(0, 120, SCREEN_WIDTH, _phoneNumLabel.contentSize.height);
    [self.view addSubview:_phoneNumLabel];
    
    _timestatuLabel = [[UILabel alloc]init];
    _timestatuLabel.textColor = [UIColor whiteColor];
    _timestatuLabel.text = @"来电中...";
    _timestatuLabel.font = [UIFont systemFontOfSize:20.0f];
    _timestatuLabel.textAlignment = NSTextAlignmentCenter;
    _timestatuLabel.frame = CGRectMake(0, 180, SCREEN_WIDTH, _timestatuLabel.contentSize.height);
    [self.view addSubview:_timestatuLabel];
    
    
    _acceptBtn= [[UIButton alloc]init];
    _acceptBtn.frame = CGRectMake(200 + width, 600, width, width);
    [_acceptBtn setTitle:@"接听" forState:UIControlStateNormal];
    _acceptBtn.titleLabel.font = [UIFont systemFontOfSize:13.0f];
    _acceptBtn.layer.borderColor = [[UIColor whiteColor]CGColor];
    _acceptBtn.layer.borderWidth = 0.5;
    _acceptBtn.layer.cornerRadius = width/2;
    _acceptBtn.layer.masksToBounds = YES;
    [_acceptBtn addTarget:self action:@selector(OnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_acceptBtn];
    
    
    _hungUpBtn= [[UIButton alloc]init];
    _hungUpBtn.frame = CGRectMake(100, 600, width, width);
    [_hungUpBtn setTitle:@"挂断" forState:UIControlStateNormal];
    _hungUpBtn.titleLabel.font = [UIFont systemFontOfSize:13.0f];
    _hungUpBtn.layer.borderColor = [[UIColor whiteColor]CGColor];
    _hungUpBtn.layer.borderWidth = 0.5;
    _hungUpBtn.layer.cornerRadius = width/2;
    _hungUpBtn.layer.masksToBounds = YES;
    [_hungUpBtn addTarget:self action:@selector(OnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_hungUpBtn];
    
    Boolean isAnswer = [[CooTekVoipSDK sharedCooTekVoipSDK] isAnswer];
    if(!isAnswer)
    {
        [CallRingUtil playIncomingRingTone];
    }

}

-(void)OnClick : (id)sender
{
    UIButton *button = sender;
    if(button == _acceptBtn)
    {
        [self hideAcceptButton];
        [CallRingUtil stop];
        [[CooTekVoipSDK sharedCooTekVoipSDK] acceptAnswer];
        _timestatuLabel.text = @"00:00";
        [self startTimer];
    }
    else if(button == _hungUpBtn)
    {
        [timer invalidate];
        [[CooTekVoipSDK sharedCooTekVoipSDK]hungUp];
        [CallRingUtil audioEnd];
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}


#pragma mark 通话计时
-(void)startTimer
{
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateTime) userInfo:nil repeats:YES];
    [timer fire];
}


-(void)updateTime
{
    seconds ++ ;
    _timestatuLabel.text = [ByUtils generateCallingTime:seconds];;
}

-(void)hideAcceptButton
{
    [UIView animateWithDuration:0.3 animations:^{
        _acceptBtn.frame = CGRectMake((SCREEN_WIDTH -  width)/2, 600, width, width);
        _hungUpBtn.frame = CGRectMake((SCREEN_WIDTH -  width)/2, 600, width, width);;
    } completion:^(BOOL finished) {
        _acceptBtn.hidden = YES;
    }];
}

-(void)onHangupCallBack
{
    _timestatuLabel.text = @"通话结束...";
    [self dismissViewControllerAnimated:YES completion:nil];
}



@end
