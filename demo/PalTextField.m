//
//  PalTextField.m
//  demo
//
//  Created by by.huang on 2016/12/7.
//  Copyright © 2016年 by.huang. All rights reserved.
//

#import "PalTextField.h"


@interface PalTextField()<UITextFieldDelegate>

@property (strong , nonatomic) UITextField *textField;

@property (strong , nonatomic) UIView *lineTopView;

@property (strong , nonatomic) UIView *lineBottomView;

@property (strong, nonatomic) UIImageView *clearImageView;

@property (assign, nonatomic) float width;


@end

@implementation PalTextField

-(instancetype)initWithImageAndHint:(CGRect)frame image:(UIImage *)image hint:(NSString *)hint
{
    if(self == [super initWithFrame:frame]){
        _width = frame.size.width;
        [self initView:image hint:hint];
    }
    return self;
}


-(void)initView : (UIImage *)image
           hint : (NSString *)hint{
    
    
    UIImageView *showImg = [[UIImageView alloc]init];
    showImg.frame = CGRectMake(0, (PalTextFieldHeight - image.size.height)/2, image.size.width, image.size.height);
    [showImg setImage:image];
    [self addSubview:showImg];
    
    
    
    _textField = [[UITextField alloc]init];
    _textField.frame = CGRectMake(image.size.width , 0, _width - image.size.width + 10, PalTextFieldHeight);
    _textField.placeholder = hint;
    _textField.delegate = self;
    [self addSubview:_textField];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldChanged:) name:UITextFieldTextDidChangeNotification object:_textField];
    
    _lineTopView = [[UIView alloc]init];
    _lineTopView.backgroundColor = LINE_COLOR;
    _lineTopView.frame = CGRectMake(0, 0, _width, 1);
    [self addSubview:_lineTopView];
    
    _lineBottomView = [[UIView alloc]init];
    _lineBottomView.backgroundColor = LINE_COLOR;
    _lineBottomView.frame = CGRectMake(0,PalTextFieldHeight - 1 , _width, 1);
    [self addSubview:_lineBottomView];
    
    _clearImageView = [[UIImageView alloc]init];
    _clearImageView.image = [UIImage imageNamed:@"ic_clear"];
    _clearImageView.frame = CGRectMake(_width - image.size.width, (PalTextFieldHeight - image.size.height ) /2, image.size.width, image.size.height);
    UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(OnClearTap:)];
    [_clearImageView setHidden:YES];
    _clearImageView.userInteractionEnabled = YES;
    [_clearImageView addGestureRecognizer:recognizer];
    [self addSubview:_clearImageView];
    
}


-(void)setText:(NSString *)text{
    _textField.text = text;
}

-(NSString *)getText{
    return _textField.text;
}

-(UITextField *)getTextField
{
    return _textField;
}


-(void)textFieldChanged : (NSNotification *)notification
{
    UITextField *textField = notification.object;
    NSString *temp = textField.text;
    if(IS_NS_STRING_EMPTY(temp)){
        [_clearImageView setHidden:YES];
    }
    else{
        [_clearImageView setHidden:NO];
    }
    if(self.delegate)
    {
        [self.delegate textFieldChanged:self text:temp];
    }
}


-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    _lineTopView.backgroundColor = LINE_SELECT_COLOR;
    _lineBottomView.backgroundColor = LINE_SELECT_COLOR;
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    _lineTopView.backgroundColor = LINE_COLOR;
    _lineBottomView.backgroundColor = LINE_COLOR;
}


-(void)OnClearTap : (UIGestureRecognizer *)recognizer
{
    [_textField setText:@""];
    [_clearImageView setHidden:YES];
    if(self.delegate)
    {
        [self.delegate textFieldChanged:self text:@""];
    }
}
@end
