//
//  MTColor.h
//  MeridianTravel
//
//  Created by mary on 15/6/13.
//  Copyright (c) 2015年 mary. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MTColor : NSObject
//主题颜色
+(UIColor *)mtColorWithTheme;
//发布需求按钮颜色
+ (UIColor *)demandBtnBackColor;
//类似橙色
+ (UIColor *)likeOrangeColor;
/**
 *  主内容颜色
 */
+ (UIColor *)contentNormalColor;
/**
 *  辅助颜色
 */
+ (UIColor *)contentAssistColor;
/**
 * cell分割线颜色
 */
+ (UIColor *)cellLineColor;
/**
 *  按钮不可点击的颜色
 */
+ (UIColor *)Mt_UnbleColor;

@end
