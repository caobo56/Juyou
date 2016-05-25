//
//  YYAccountTool.h
//  WeiBo
//
//  Created by Edward Xu on 15/3/19.
//  Copyright (c) 2015年 Yonyouup Information Technology Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MTUser.h"

@interface YYAccountTool : NSObject
/**
 *  存储账号信息
 *
 *  @param account 账号对象
 */
+ (void)saveAccount:(MTUser *)account;

/**
 *  获取账号信息
 *
 *  @return 账号对象
 */
+ (MTUser *)account;

@end
