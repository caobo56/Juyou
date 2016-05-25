//
//  YYAccountTool.m
//  WeiBo
//
//  Created by Edward Xu on 15/3/19.
//  Copyright (c) 2015年 Yonyouup Information Technology Co., Ltd. All rights reserved.
//

#define AccountPath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"account.data"]

#import "YYAccountTool.h"


@implementation YYAccountTool

+ (void)saveAccount:(MTUser *)account
{
   [NSKeyedArchiver archiveRootObject:account toFile:AccountPath];
}

+ (MTUser *)account
{
    MTUser *account = [NSKeyedUnarchiver unarchiveObjectWithFile:AccountPath];
    
    return account;
}

@end
