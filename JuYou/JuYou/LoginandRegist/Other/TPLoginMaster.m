//
//  TPLoginMaster.m
//  triprice
//
//  Created by caobo56 on 16/2/24.
//
//

#import "TPLoginMaster.h"
#import "LJLooginViewController.h"


@implementation TPLoginMaster

static  TPLoginMaster *loginMaster = nil;


//登录
+(void)executionWithCurrentVC:(UIViewController *)currentVC
                     andBlock:(void (^)(BOOL LoginState))block{
    @synchronized(self){
        if (loginMaster == nil) {
            loginMaster = [[self alloc]init];
        }
    }
    BOOL isLogin = [TPLoginMaster isLogin];
    if (isLogin) {

        block([TPLoginMaster isLogin]);
    }else{
        LJLooginViewController * loginVC = [[LJLooginViewController alloc]init];
        UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:loginVC];
        loginVC.LoginMannger = ^(BOOL isLogin){
            if (isLogin){
                block([TPLoginMaster isLogin]);
            }
        };
        [currentVC presentViewController:nav animated:YES completion:nil];
    }
    
}


+(BOOL)isLogin{
    BOOL islogin = [[NSUserDefaults standardUserDefaults] boolForKey:@"login"];
    if (islogin) {
        return YES;
    };
    return NO;
}


@end
