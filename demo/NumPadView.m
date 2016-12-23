
//
//  NumPadView.m
//  demo
//
//  Created by by.huang on 2016/12/21.
//  Copyright © 2016年 by.huang. All rights reserved.
//

#import "NumPadView.h"
#import "PJSIPManager.h"

@interface NumPadView()

@property (strong, nonatomic) UILabel *phoneNumLabel;

@property (strong, nonatomic) UIButton *num1;

@property (strong, nonatomic) UIButton *num2;

@property (strong, nonatomic) UIButton *num3;

@property (strong, nonatomic) UIButton *num4;

@property (strong, nonatomic) UIButton *num5;

@property (strong, nonatomic) UIButton *num6;

@property (strong, nonatomic) UIButton *num7;

@property (strong, nonatomic) UIButton *num8;

@property (strong, nonatomic) UIButton *num9;

@property (strong, nonatomic) UIButton *numstar;

@property (strong, nonatomic) UIButton *num0;

@property (strong, nonatomic) UIButton *numpound;

@end

@implementation NumPadView
{
    NSString *inputText;
}


-(instancetype)init
{
    if(self == [super init])
    {
        [self initView];
    }
    return self;
}

-(void)initView
{
    self.frame = CGRectMake(0, 0, SCREEN_WIDTH, 600);
//    self.backgroundColor = [UIColor blackColor];
    
    _phoneNumLabel = [[UILabel alloc]init];
    _phoneNumLabel.font = [UIFont systemFontOfSize:30.0f];
    _phoneNumLabel.textColor = [UIColor whiteColor];
    _phoneNumLabel.textAlignment = NSTextAlignmentCenter;
    _phoneNumLabel.lineBreakMode = NSLineBreakByTruncatingMiddle;
    _phoneNumLabel.frame = CGRectMake(20, 100, SCREEN_WIDTH - 40, 30);
    [self addSubview:_phoneNumLabel];
    
    [self setKeyPosition:_num1 position:0 height:200 title:@"1"];
    [self setKeyPosition:_num2 position:1 height:200 title:@"2"];
    [self setKeyPosition:_num3 position:2 height:200 title:@"3"];
    
    [self setKeyPosition:_num4 position:0 height:300 title:@"4"];
    [self setKeyPosition:_num5 position:1 height:300 title:@"5"];
    [self setKeyPosition:_num6 position:2 height:300 title:@"6"];
    
    [self setKeyPosition:_num7 position:0 height:400 title:@"7"];
    [self setKeyPosition:_num8 position:1 height:400 title:@"8"];
    [self setKeyPosition:_num9 position:2 height:400 title:@"9"];
    
    [self setKeyPosition:_numstar position:0 height:500 title:@"*"];
    [self setKeyPosition:_num0 position:1 height:500 title:@"0"];
    [self setKeyPosition:_numpound position:2 height:500 title:@"#"];
}


-(void)setKeyPosition : (UIButton *)button position : (int)position height : (int)height title : (NSString *)title
{
    if(position > 2)
        return;
    
    int width  = (SCREEN_WIDTH - 200) /3 ;
    
    button = [[UIButton alloc]init];
    switch (position) {
        case 0:
            button.frame = CGRectMake(80,height,width, width);
            break;
        case 1:
            button.frame = CGRectMake(100+width,height,width, width);
            break;
        case 2:
            button.frame = CGRectMake(SCREEN_WIDTH - 80- width,height,width, width);
            break;
            
        default:
            break;
    }
    [button setTitle:title forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:24.0f];
    button.layer.borderColor = [[UIColor whiteColor]CGColor];
    button.layer.borderWidth = 0.5;
    button.layer.cornerRadius = width/2;
    button.layer.masksToBounds = YES;
    [button addTarget:self action:@selector(OnClick:) forControlEvents:UIControlEventTouchUpInside];
    [button addTarget:self action:@selector(OnTouchUp:) forControlEvents:UIControlEventTouchUpOutside];
    [button addTarget:self action:@selector(OnTouchDown:) forControlEvents:UIControlEventTouchDown];
    
    [self addSubview:button];
    
}

-(void)OnClick : (id)sender
{
    UIButton *button = sender;
    button.backgroundColor = [UIColor clearColor];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
}

-(void)OnTouchDown : (id)sender
{
    UIButton *button = sender;
    button.backgroundColor = [UIColor whiteColor];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    
    inputText = IS_NS_STRING_EMPTY(inputText)?button.titleLabel.text :[inputText stringByAppendingString:button.titleLabel.text];
    _phoneNumLabel.text = inputText;
    [PJSIPManager sendDTMF:button.titleLabel.text];

}

-(void)OnTouchUp : (id)sender
{
    UIButton *button = sender;
    button.backgroundColor = [UIColor clearColor];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
}



@end
