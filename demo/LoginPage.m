//
//  LoginPage.m
//  demo
//
//  Created by by.huang on 2016/12/6.
//  Copyright © 2016年 by.huang. All rights reserved.
//

#import "LoginPage.h"
#import "PalTextField.h"
#import "ByUtils.h"
#import "LoginPresenter.h"
#import <MBProgressHUD/MBProgressHUD.h>
#import "ILoginProtrol.h"

#define ImageWidth 80

@interface LoginPage ()<PalTextFieldChanged,ILoginProtrol>

@property (strong , nonatomic) UIImageView *loginImageView;

@property (strong , nonatomic) UILabel *loginLabel;

@property (strong , nonatomic) PalTextField *phoneTextField;

@property (strong , nonatomic) PalTextField *verifyTextField;

@property (strong , nonatomic) UIButton *verifyBtn;

@property (strong , nonatomic) UIButton *loginBtn;


@end

@implementation LoginPage
{
    LoginPresenter *presenter;
    BOOL phoneNumCompelete;
    BOOL verifyNumCompelete;
    int second;
    NSTimer *timer;
}

+(void)show : (UIViewController *)page
{
    LoginPage *loginPage = [[LoginPage alloc]init];
    [page.navigationController pushViewController:loginPage animated:YES];
}


-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:Str_Login_Register];
    [self.view setBackgroundColor:BACKGROUND_COLOR];
    presenter = [[LoginPresenter alloc]init];
    presenter.delegate = self;
    [self initView];
}

-(void)initView
{
    _loginImageView = [[UIImageView alloc]init];
    _loginImageView.frame = CGRectMake((SCREEN_WIDTH - ImageWidth ) /2, 100, ImageWidth, ImageWidth);
    [_loginImageView setImage:[UIImage imageNamed:@"ic_test"]];
    _loginImageView.layer.cornerRadius = ImageWidth/2;
    _loginImageView.layer.masksToBounds = YES;
    [self.view addSubview:_loginImageView];
    
    _loginLabel = [[UILabel alloc]init];
    _loginLabel.text = Str_Login_Tips;
    _loginLabel.textColor = [UIColor lightGrayColor];
    _loginLabel.font = [UIFont systemFontOfSize:14.0f];
    _loginLabel.frame = CGRectMake((SCREEN_WIDTH - _loginLabel.contentSize.width ) /2 ,_loginImageView.height + _loginImageView.y + 20, _loginLabel.contentSize.width, _loginLabel.contentSize.height);
    [self.view addSubview:_loginLabel];
    
    
    CGRect phoneFrame = CGRectMake(0, _loginLabel.height + _loginLabel.y + 10, SCREEN_WIDTH, PalTextFieldHeight);
    _phoneTextField =  [[PalTextField alloc]initWithImageAndHint:phoneFrame image:[UIImage imageNamed:@"ic_phone"]  hint:Str_Login_Phone_Hint];
    [_phoneTextField.getTextField setKeyboardType:UIKeyboardTypePhonePad];
    _phoneTextField.delegate = self;
    [self.view addSubview:_phoneTextField];
    
    
    CGRect pswFrame = CGRectMake(0, _phoneTextField.height + _phoneTextField.y + 10, SCREEN_WIDTH-80, PalTextFieldHeight);
    _verifyTextField = [[PalTextField alloc]initWithImageAndHint:pswFrame image:[UIImage imageNamed:@"ic_psw"] hint:Str_Login_Verify_Hint];
    [_verifyTextField.getTextField setKeyboardType:UIKeyboardTypePhonePad];
    _verifyTextField.delegate = self;
    [self.view addSubview:_verifyTextField];
    
    _verifyBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    _verifyBtn.frame = CGRectMake(SCREEN_WIDTH-80, _phoneTextField.height + _phoneTextField.y + 10, 80, PalTextFieldHeight);
    [_verifyBtn setTitle:Str_Login_Verify forState:UIControlStateNormal];
    [_verifyBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _verifyBtn.backgroundColor = LINE_COLOR;
    _verifyBtn.titleLabel.font = [UIFont systemFontOfSize:13.0f];
    [_verifyBtn addTarget:self action:@selector(OnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_verifyBtn];
    
    
    _loginBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    _loginBtn.frame = CGRectMake((SCREEN_WIDTH - 200)/2, _verifyBtn.y + _verifyBtn.height + 20, 200, PalTextFieldHeight);
    [_loginBtn setTitle:Str_Login forState:UIControlStateNormal];
    [_loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _loginBtn.backgroundColor = LINE_COLOR;
    _loginBtn.layer.cornerRadius = 4;
    _loginBtn.layer.masksToBounds = YES;
    [_loginBtn addTarget:self action:@selector(OnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_loginBtn];
    
    
}


-(void)checkLoginBtnStatu
{
    
    if(verifyNumCompelete && phoneNumCompelete)
    {
        _loginBtn.enabled = YES;
        _loginBtn.backgroundColor = [UIColor blueColor];
    }
    else
    {
        _loginBtn.enabled = NO;
        _loginBtn.backgroundColor = LINE_COLOR;
    }
}

-(void)textFieldChanged:(PalTextField *)textField text:(NSString *)text
{
    if(textField == _phoneTextField){
        if(!IS_NS_STRING_EMPTY(text)){
            phoneNumCompelete = YES;
            _verifyBtn.backgroundColor = [UIColor blueColor];
            _verifyBtn.enabled = YES;
        }
        else{
            phoneNumCompelete = NO;
            _verifyBtn.backgroundColor = LINE_COLOR;
            _verifyBtn.enabled = NO;
        }
    }
    else if(textField == _verifyTextField){
        if(!IS_NS_STRING_EMPTY(text)){
            verifyNumCompelete = YES;
        }
        else{
            verifyNumCompelete = NO;
        }
    }
    
    [self checkLoginBtnStatu];
}


-(void)OnClick : (id)sender
{
    UIView *view = sender;
    if(view == _verifyBtn)
    {
        NSString *phoneNum = [_phoneTextField getText];
        if([ByUtils isPhoneNumVaild:phoneNum])
        {
            //获取验证码
            [[_phoneTextField getTextField] resignFirstResponder];
            [[_verifyTextField getTextField]resignFirstResponder];
            _verifyBtn.enabled = NO;
            _verifyBtn.backgroundColor = LINE_COLOR;
            NSString *phoneNum = [_phoneTextField getText];
            phoneNum = [ByUtils generatePhoneNum:phoneNum];
            [presenter getVerifyCode : phoneNum];
            
            [self startTimer];
        }
        else{
            [ByToast showErrorToast:Str_Login_Phone_Input_Error];
        }
    }
    else if(view == _loginBtn)
    {
        [[_phoneTextField getTextField] resignFirstResponder];
        [[_verifyTextField getTextField]resignFirstResponder];
        
        NSString *phoneNum = [_phoneTextField getText];
        phoneNum = [ByUtils generatePhoneNum:phoneNum];
        NSString *verifyCode = [_verifyTextField getText];
        [presenter login : phoneNum verifyCode:verifyCode];
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        
    }
}


-(void)startTimer
{
    second = 60;
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateVerifyBtn) userInfo:nil repeats:YES];
    [timer fire];
}

-(void)updateVerifyBtn
{
    second -- ;
    if(second == 0)
    {
        [timer invalidate];
        timer = nil;
        _verifyBtn.enabled = YES;
        [_verifyBtn setTitle:Str_Login_Verify forState:UIControlStateNormal];
        _verifyBtn.backgroundColor = [UIColor blueColor];
        return;
    }
    [_verifyBtn setTitle:[NSString stringWithFormat:@"%d 秒",second] forState:UIControlStateNormal];
}



-(void)OnLoginSuccess:(LoginResondModel *)model
{
    [ByToast showNormalToast:@"登录成功"];
    [MBProgressHUD hideHUDForView:self.view animated:YES];

}

-(void)OnLoginFail:(NSString *)errorMsg
{
    [ByToast showErrorToast:errorMsg];
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}

-(void)OnSendVerifyCodeSuccess:(BaseRespondModel *)model
{
    [ByToast showNormalToast:@"验证码发送成功"];
}

-(void)OnSendVerifyCodeFail:(NSString *)errorMsg
{
    [ByToast showErrorToast:@"验证码发送失败"];
}
@end
