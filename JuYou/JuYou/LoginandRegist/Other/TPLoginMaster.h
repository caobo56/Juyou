//
//  TPLoginMaster.h
//  triprice
//
//  Created by caobo56 on 16/2/24.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface TPLoginMaster : NSObject

//LoginState  YES 登录成功 NO 登录失败
+(void)executionWithCurrentVC:(UIViewController *)currentVC
                     andBlock:(void (^)(BOOL LoginState))block;

+(BOOL)isLogin;

@end
