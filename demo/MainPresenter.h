//
//  MainPresenter.h
//  demo
//
//  Created by by.huang on 2016/12/12.
//  Copyright © 2016年 by.huang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MainPresenter : NSObject

@property (strong , nonatomic) id delegate;

-(instancetype)initWithDelegate : (id)delegate;

//激活
-(void)active;

//登出
-(void)logout;

//获取账户信息
-(void)getAccountInfo;

@end
