//
//  OCconstant.h
//  JuYou
//
//  Created by caobo56 on 16/5/23.
//  Copyright © 2016年 caobo56. All rights reserved.
//

#ifndef OCconstant_h
#define OCconstant_h


#endif /* OCconstant_h */

#define HexRGBAlpha(rgbValue,a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:(a)]
#define NavBgColor  HexRGBAlpha(0x268cff, 1.0)
#define Screen_weight [UIScreen mainScreen].bounds.size.width
#define Screen_height [UIScreen mainScreen].bounds.size.height

#define rateLangth(a) (a*(Screen_weight/320.0f))
#define kDeviceToken @"deviceToken"

#define StateBarH 20
#define NavBarH 44
#define TabBarH 55
#define middleBarH 45

#define SharedAppDelegate ((AppDelegate*)[[UIApplication sharedApplication] delegate])
#define TabVC  (UIViewController *)([[UIApplication sharedApplication] delegate].window.rootViewController)


#import "JuYou-Swift.h"
#import "YYAccountTool.h"
#import "MTUser.h"
