//
//  IncomingCallPage.h
//  demo
//
//  Created by by.huang on 2016/12/22.
//  Copyright © 2016年 by.huang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IncomingCallPage : UIViewController

@property (copy, nonatomic) NSString *number;

+(void)show : (NSString *)number;

@end
