//
//  NSString+NSPredicate.m
//  SaleTool
//
//  Created by Edward on 15/4/23.
//  Copyright (c) 2015年 Yonyouup Information Technology Co., Ltd. All rights reserved.
//

#import "NSString+NSPredicate.h"

@implementation NSString (NSPredicate)

+ (BOOL)isMobileNumber:(NSString *)mobileNum
{
   
    NSString * MOBILE = @"^1[34578]\\d{9}$";
   
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    
    if ([regextestmobile evaluateWithObject:mobileNum] == YES)
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

/** 判断身份证号*/
+ (BOOL)isIdCardNum:(NSString *)cardNum
{
    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex2];
    return [regextestmobile evaluateWithObject:cardNum];
}

+ (NSUInteger)unicodeLengthOfString:(NSString *)text {
    NSUInteger asciiLength = 0;
    
    for (NSUInteger i = 0; i < text.length; i++) {
        
        unichar uc = [text characterAtIndex: i];
        asciiLength += isascii(uc) ? 1 : 2;
    }
    
    NSUInteger unicodeLength = asciiLength / 2;
    
    if(asciiLength % 2) {
        unicodeLength++;
    }
    
    return unicodeLength;
}
//密码判断
+(BOOL)isCorrect:(NSString *)string
{
    NSString *mimaString = @"[A-Za-z0-9]{4,20}";
    NSPredicate *mimaTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",mimaString];
    return [mimaTest evaluateWithObject:string];
}
//匹配简体中文
+(BOOL)isChinest:(NSString *)china
{
    
    NSString *letterRegex = @"^[\u4E00-\u9FA5]*$";
    NSPredicate *letterTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",letterRegex];
    //    NSString *str =[NSString stringWithFormat:@"%d",[letterTest evaluateWithObject:china]] ;
    
    return [letterTest evaluateWithObject:china];
}
@end
