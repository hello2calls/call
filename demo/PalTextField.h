//
//  PalTextField.h
//  demo
//
//  Created by by.huang on 2016/12/7.
//  Copyright © 2016年 by.huang. All rights reserved.
//

#import <UIKit/UIKit.h>

#define PalTextFieldHeight 50



@interface PalTextField : UIView

@property(strong , nonatomic) id delegate;

-(instancetype)initWithImageAndHint  : (CGRect)frame
                               image : (UIImage *)image
                                hint : (NSString *)hint;

-(void)setText : (NSString *)text;

-(NSString *)getText;

-(UITextField *) getTextField;

@end

@protocol PalTextFieldChanged <NSObject>

-(void)textFieldChanged : (PalTextField *)textField text: (NSString *)text;

@end
