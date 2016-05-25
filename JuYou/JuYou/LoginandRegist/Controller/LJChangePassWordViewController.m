//
//  LJChangePassWordViewController.m
//  MeridianTravel
//
//  Created by Edward Xu on 15/6/28.
//  Copyright (c) 2015年 mary. All rights reserved.
//

#import "LJChangePassWordViewController.h"
//#import "MTHttpRequest.h"
//#import "MBProgressHUD+MJ.h"
#import "NSString+MD5.h"
#import "OCconstant.h"
//#import "MJExtension.h"
//#import "LJChangePersonInfoController.h"
#import "TPWeekRecommendTopView.h"

@interface LJChangePassWordViewController ()

@end

@implementation LJChangePassWordViewController{
    TPWeekRecommendTopView * topView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initUI];
}



-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.navigationItem.hidesBackButton = YES;
    self.title = @"";
    self.navigationItem.leftBarButtonItem.title = @"";
    self.navigationController.navigationBarHidden = YES;
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [topView removeFromSuperview];
//    self.navigationItem.hidesBackButton = NO;
}

-(void)initUI{
    topView = [[TPWeekRecommendTopView alloc]init];
    [topView setBackBtnTitle:@"返回"];
    [topView setTitle:@"重置密码"];
    topView.top = -20;
    [topView.backBtn addTarget:self action:@selector(backBtnPress) forControlEvents:UIControlEventTouchUpInside];
    [self.navigationController.navigationBar addSubview:topView];
    [self.navigationController.navigationBar bringSubviewToFront:topView];
}

-(void)backBtnPress{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)nextStep:(id)sender
{
    if (self.pw1TextField.text.length == 0) {
        [self showHUDWithText:@"密码不能为空"];
        return;
    }
    
    if (![self.pw1TextField.text isEqualToString:self.pw2TextField.text]) {
        [self showHUDWithText:@"两次密码输入不一致"];
        return;
    }
    [self showLoadingHUDWithText:nil];
    NSString *md5PW = [self.pw2TextField.text MD5Hash];
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
    [dic setValue:self.phoneNum forKey:@"userInfo.mobileNum"];
    [dic setValue:md5PW forKey:@"userInfo.password"];
    __block LJChangePassWordViewController * blkSelf = self;
//    [[JDDAPIs sharedJDDAPIs]resetPasswordByMobileNumWithParameters:dic WithBlock:^(NSDictionary *dict, NSString *error) {
//        [blkSelf hideAllHUD];
//        if (dict) {
//            [blkSelf showHUDWithText:@"修改成功"];
//            [blkSelf.navigationController popToRootViewControllerAnimated:YES];
//        }else{
//            if (error) {
//                [blkSelf showHUDWithText:error];
//            }else{
//                [blkSelf showHUDWithText:@"加载失败，请稍后重试"];
//            }
//        }
//    }];
}

@end
