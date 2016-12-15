//
//  CodeManager.m
//  demo
//
//  Created by by.huang on 2016/12/15.
//  Copyright © 2016年 by.huang. All rights reserved.
//

#import "CodeManager.h"
#import "CodeModel.h"
@implementation CodeManager

SINGLETON_IMPLEMENTION(CodeManager)

-(void)showErrorMsg : (int)code
{
    NSString *contentPath = [[NSBundle mainBundle] pathForResource:@"error_code" ofType:@"json"];
    NSString *txtContent = [NSString stringWithContentsOfFile:contentPath encoding:NSUTF8StringEncoding error:nil];
    CodeModel *model = [CodeModel mj_objectWithKeyValues:txtContent];
    NSMutableArray *errorCodes = model.error_code;
    for(NSMutableDictionary *dic : errorCodes)
    {
        NSArray *array =  dic.allKeys;
        if(!IS_NS_COLLECTION_EMPTY(array))
        {
            NSString *key = [array objectAtIndex:0];
            if([key isEqualToString:[NSString stringWithFormat:@"%d",code]])
            {
                id value = [dic objectForKey:key];
                ErrorCodeModel *model = [ErrorCodeModel mj_objectWithKeyValues:value];
                [ByToast showErrorToast:model.title];
                break;
            }
          
        }

    }

    
    
}

@end
