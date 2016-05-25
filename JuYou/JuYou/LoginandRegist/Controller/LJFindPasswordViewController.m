//
//  LJFindPasswordViewController.m
//  MeridianTravel
//
//  Created by Edward Xu on 15/6/28.
//  Copyright (c) 2015年 mary. All rights reserved.
//

#import "LJFindPasswordViewController.h"
#import "LJChangePassWordViewController.h"
#import "NSString+NSPredicate.h"
#import "OCconstant.h"

//#import "MBProgressHUD+MJ.h"
//#import "MTHttpRequest.h"
#import "TPWeekRecommendTopView.h"

@interface LJFindPasswordViewController ()

/** 验证码*/
@property (nonatomic , copy) NSString *authCode;
/** 获取验证码成功的手机号*/
@property (nonatomic , copy) NSString *phoneNum;

@end

@implementation LJFindPasswordViewController{
    TPWeekRecommendTopView * topView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initUI];
    

}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationItem.hidesBackButton = YES;
    [self.navigationController.navigationBar addSubview:topView];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [topView removeFromSuperview];
    self.navigationItem.hidesBackButton = NO;
}

-(void)initUI{
    topView = [[TPWeekRecommendTopView alloc]init];
    [topView setBackBtnTitle:@"返回"];
    [topView setTitle:@"忘记密码"];
    topView.top = -20;
    [topView.backBtn addTarget:self action:@selector(backBtnPress) forControlEvents:UIControlEventTouchUpInside];
}

-(void)backBtnPress{
    [self.navigationController popViewControllerAnimated:YES];
}


- (IBAction)authBtnClicked:(id)sender
{
    if (![NSString isMobileNumber:self.phoneTextField.text]) {
        [self showHUDWithText:@"请输入正确的手机号"];
        return;
    }
    
    [self showLoadingHUDWithText:nil];
    __block LJFindPasswordViewController * weakSelf = self;
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setValue:self.phoneTextField.text forKey:@"userInfo.mobileNum"];
//    [[JDDAPIs sharedJDDAPIs]getAuthCodeWithParameters:dic WithBlock:^(NSDictionary *dict, NSString *error) {
//        [self hideAllHUD];
//        if (dict) {
//            self.phoneNum = self.phoneTextField.text;
//            self.authCode = [dict objectForKeyNotNull:@"authCode"];
//            self.authCodeBtn.userInteractionEnabled = NO;
//            [weakSelf showHUDWithText:@"验证码已发送到手机，请耐心等待"];
//        }else{
//            if (error) {
//                [weakSelf showHUDWithText:error];
//            }else{
//                [weakSelf showHUDWithText:@"加载失败，请稍后重试"];
//            }
//        }
//    }];
}

- (IBAction)nextStep:(id)sender
{
    if ([self.authCode isEqualToString:self.authCodeTextField.text]) {
        LJChangePassWordViewController *vc = [[LJChangePassWordViewController alloc] init];
        vc.phoneNum = self.phoneNum;
        [self.navigationController pushViewController:vc animated:YES];
    }else
    {
        [self showHUDWithText:@"验证码输入有误"];
    }
}


@end
