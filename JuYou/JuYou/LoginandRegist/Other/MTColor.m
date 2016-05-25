//
//  MTColor.m
//  MeridianTravel
//
//  Created by mary on 15/6/13.
//  Copyright (c) 2015年 mary. All rights reserved.
//

#import "MTColor.h"
#import "UIColor+LJ.h"

#define MLColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]


@implementation MTColor
+(UIColor *)mtColorWithTheme
{
    return [UIColor colorWithHex:0X268cff];
//    return MLColor(16, 128, 255);268cff  0X258fe5
}
+ (UIColor *)demandBtnBackColor
{
    return MLColor(197, 207, 220);
}
+ (UIColor *)likeOrangeColor
{
    return [UIColor colorWithHex:0Xff7f05];
}
+ (UIColor *)contentNormalColor
{
    return [UIColor colorWithHex:0X26323a];
}
+ (UIColor *)contentAssistColor
{
     return [UIColor colorWithHex:0X9fa9b0];
}
+ (UIColor *)cellLineColor
{
    return [UIColor colorWithHex:0Xd1d8df];
}
+(UIColor *)Mt_UnbleColor
{
    return [UIColor colorWithHex:0xc0c6cc];
}
@end
