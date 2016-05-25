//
//  LJRegisterViewController.m
//  MeridianTravel
//
//  Created by Edward Xu on 15/6/28.
//  Copyright (c) 2015年 mary. All rights reserved.
//

#import "LJRegisterViewController.h"
//#import "MTHttpRequest.h"
//#import "MBProgressHUD+MJ.h"
#import "NSString+NSPredicate.h"
#import "NSString+MD5.h"
//#import "MJExtension.h"
#import "OCconstant.h"

#import "TPWeekRecommendTopView.h"

@interface LJRegisterViewController ()

/** 验证码*/
@property (nonatomic , copy) NSString *authCode;
/** 获取验证码成功的手机号*/
@property (nonatomic , copy) NSString *phoneNum;

@end

@implementation LJRegisterViewController{
    TPWeekRecommendTopView * topView;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"";
    self.navigationItem.leftBarButtonItem.title = @"";
    [self initUI];
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.authCodeBtn.userInteractionEnabled = YES;
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [topView removeFromSuperview];
//    self.navigationItem.hidesBackButton = NO;
}

-(void)initUI{
    topView = [[TPWeekRecommendTopView alloc]init];
    [topView setBackBtnTitle:@"返回"];
    [topView setTitle:@"注 册"];
    [self.navigationController.navigationBar addSubview:topView];
    [self.navigationController.navigationBar bringSubviewToFront:topView];
    topView.top = -20;
    [topView.backBtn addTarget:self action:@selector(backBtnPress) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItems = nil;
    self.navigationItem.hidesBackButton = YES;
}

-(void)backBtnPress{
//    [topView removeFromSuperview];
    [self.navigationController popViewControllerAnimated:YES];
//    self.navigationItem.hidesBackButton = NO;
}

- (IBAction)authCodeBtnClick:(id)sender
{
    if (![NSString isMobileNumber:self.phoneNumTextField.text]){
        [self showHUDWithText:@"请输入正确的手机号"];
        return;
    }
    [self showLoadingHUD];
    __block LJRegisterViewController * weakSelf = self;
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setValue:self.phoneNumTextField.text forKey:@"userInfo.mobileNum"];
//    [[JDDAPIs sharedJDDAPIs]getAuthCodeWithParameters:dic WithBlock:^(NSDictionary *dict, NSString *error) {
//        [self hideAllHUD];
//        if (dict) {
//            self.phoneNum = self.phoneNumTextField.text;
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

- (IBAction)regiterBtnClick:(id)sender
{
    NSInteger nickNameLength = self.nickNameTextField.text.length;
    
    if (nickNameLength == 0) {
        [self showHUDWithText:@"昵称不能为空"];
        return;
    }
    
    if (![self.authCodeTextField.text isEqualToString:self.authCode]) {
        [self showHUDWithText:@"验证码错误"];
        return;
    }
    
    if (![self.phoneNumTextField.text isEqualToString:self.phoneNum]) {
        [self showHUDWithText:@"手机号错误"];
        return;
    }
    
    if (self.pwTextField.text.length == 0) {
        [self showHUDWithText:@"请输入密码"];
        return;
    }
    
    NSString *md5PW = [self.pwTextField.text MD5Hash];
    [self showLoadingHUDWithText:nil];
    
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
    [dic setObject:self.phoneNumTextField.text forKey:@"userInfo.mobileNum"];
    [dic setObject:self.authCodeTextField.text forKey:@"userInfo.authCode"];
    [dic setObject:md5PW forKey:@"userInfo.password"];
    [dic setObject:self.nickNameTextField.text forKey:@"userInfo.nickName"];
    __block LJRegisterViewController * blkSelf = self;
//    [[JDDAPIs sharedJDDAPIs]userRegistWithParameters:dic WithBlock:^(NSDictionary *dict, NSString *error) {
//        [blkSelf hideAllHUD];
//        if (dict) {
//            [blkSelf showHUDWithText:@"注册成功"];
//            
//            [blkSelf.navigationController popViewControllerAnimated:YES];
//        }else{
//            if (error) {
//                [blkSelf showHUDWithText:error];
//            } else {
//                [blkSelf showHUDWithText:@"加载失败，请稍后重试"];
//            }
//        }
//    }];
    
    //
//    [MTHttpRequest httpRequestRegist:self.phoneNumTextField.text nickName:self.nickNameTextField.text checkCode:self.authCodeTextField.text password:md5PW success:^(id responseObj)
//    {
//        [MBProgressHUD hideHUDForView:self.view];
//        MLJLog(@"%@",responseObj);
//        NSDictionary *result = (NSDictionary *)responseObj;
//            [MBProgressHUD showSuccess:@"注册成功"];
//            MTUser *userInfo = [MTUser objectWithKeyValues:[result objectForKey:@"userInfo"]];
//            [YYAccountTool saveAccount:userInfo];
//        [self.navigationController popViewControllerAnimated:YES];
//        
//    } failure:^(NSError *error) {
//       NSString *str =  error.userInfo[NSLocalizedDescriptionKey];
//        [MBProgressHUD showError:str];
//        [MBProgressHUD hideHUDForView:self.view];
//    }];
}



@end
