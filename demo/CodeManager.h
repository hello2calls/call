//
//  CodeManager.h
//  demo
//
//  Created by by.huang on 2016/12/15.
//  Copyright © 2016年 by.huang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CodeManager : NSObject

SINGLETON_DECLARATION(CodeManager)

-(void)showErrorMsg : (int)code;

@end
