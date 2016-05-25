//
//  NSString+NSPredicate.h
//  SaleTool
//
//  Created by Edward on 15/4/23.
//  Copyright (c) 2015年 Yonyouup Information Technology Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (NSPredicate)

/** 判断是否是手机号*/
+ (BOOL)isMobileNumber:(NSString *)mobileNum;
/** 字符串字节数*/
+ (NSUInteger)unicodeLengthOfString:(NSString *)text;
//密码判断
+(BOOL)isCorrect:(NSString *)string;
//简体中文
+(BOOL)isChinest:(NSString *)china;
/** 判断身份证号*/
+ (BOOL)isIdCardNum:(NSString *)cardNum;
@end
