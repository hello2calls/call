//
//  CallPage.h
//  demo
//
//  Created by by.huang on 2016/12/16.
//  Copyright © 2016年 by.huang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CallPage : UIViewController

@property (copy, nonatomic) NSString *phoneNum;

+(void)show : (UIViewController *)page phoneNum : (NSString *)phoneNum;

@end
