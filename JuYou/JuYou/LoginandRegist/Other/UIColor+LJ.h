//
//  UIColor+LJ.h
//  commontFrameWork
//
//  Created by mary on 15/4/28.
//  Copyright (c) 2015年 MLJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (LJ)
/**
 *  传入16进制 返回颜色
 */
+ (UIColor*) colorWithHex: (NSUInteger) hex;
@end
