//
//  MTChangePassWordController.m
//  MeridianTravel
//
//  Created by mary on 15/7/13.
//  Copyright (c) 2015年 mary. All rights reserved.
//

#import "MTChangePassWordController.h"
#import "NSString+MD5.h"
#import "TPPushDemandTopView.h"
#import "OCconstant.h"

#import "YYAccountTool.h"
#import "MTUser.h"
@interface MTChangePassWordController ()
@property (weak, nonatomic) IBOutlet UITextField *oldPasswardField;
@property (weak, nonatomic) IBOutlet UITextField *passwardField;
@property (weak, nonatomic) IBOutlet UITextField *confirmPasswordField;
- (IBAction)complentBtnClick:(UIButton *)sender;

@end

@implementation MTChangePassWordController{
    TPPushDemandTopView * topView;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
//    UIButton *btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
//    [btn setTitle:@"返回" forState:UIControlStateNormal];
//    [btn setTitleEdgeInsets:UIEdgeInsetsMake(0, -20, 0, 0)];
//    btn.titleLabel.font = [UIFont systemFontOfSize:16];
//    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    [btn setImage:[UIImage imageNamed:@"fanhui"] forState:(UIControlStateNormal)];
//    btn.size = CGSizeMake(80, 44);
//    [btn addTarget:self action:@selector(backBtnClick) forControlEvents:UIControlEventTouchUpInside];
//    UIBarButtonItem *leftBaritem = [[UIBarButtonItem alloc] initWithCustomView:btn];
//    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
//                                                                                   target:nil action:nil];
//    negativeSpacer.width = -20;//这个数值可以根据情况自由变化
//    self.navigationItem.leftBarButtonItems = @[negativeSpacer, leftBaritem];
//    self.title = @"修改密码";
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

-(void)initUI{
    topView = [[TPPushDemandTopView alloc]init];
    [topView setBackBtnTitle:@"返回"];
    [topView setTitle:@"修改密码"];
//    [topView setRightTitle:@"保存"];
    topView.top = 0;
    [topView.backBtn addTarget:self action:@selector(backBtnPress) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:topView];
    //    self.navigationItem.hidesBackButton = YES;
}

- (void)backBtnPress
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
/**
 *  完成
 */

- (IBAction)complentBtnClick:(UIButton *)sender {
     MTUser *user = [YYAccountTool account];
    if (self.oldPasswardField.text.length) {
            if (self.passwardField.text.length) {
                if (self.confirmPasswordField.text.length) {
                     if ([self.oldPasswardField.text isEqualToString:user.password]) {
                         if ([self.passwardField.text isEqualToString:self.confirmPasswordField.text]) {
                             [self postChangePasswordRequest];
                         }else
                         {
                              [self showHUDWithText:@"新密码和确认密码不一致"];
                         }
                     }else
                     {
                          [self showHUDWithText:@"您输入的旧密码不正确"];
                     }

                }else
                {
                     [self showHUDWithText:@"请输入确认密码"];
                }
            }else
            {
                  [self showHUDWithText:@"请输入新密码"];
            }
    }else
    {
         [self showHUDWithText:@"请输入旧密码"];
    }
   
}
- (void)postChangePasswordRequest
{
    MTUser *user = [YYAccountTool account];
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
    [dic setValue:user.userId forKey:@"userInfo.userId"];
    [dic setValue:user.nickName forKey:@"userInfo.nickName"];
     NSString *md5PW = [self.passwardField.text MD5Hash];
    [dic setValue:md5PW forKey:@"userInfo.password"];
    __block MTChangePassWordController * blkSelf = self;
//    [[JDDAPIs sharedJDDAPIs]updateUserInfoWithParameters:dic WithBlock:^(NSDictionary *dict, NSString *error) {
//        [blkSelf hideAllHUD];
//        if (dict) {
//            [blkSelf showHUDWithText:@"修改密码成功"];
//            MTUser *user = [YYAccountTool account];
//            user.password = self.passwardField.text;
//            [YYAccountTool saveAccount:user];
//            [self.navigationController popViewControllerAnimated:YES];
//        }else{
//            if (error) {
//                [blkSelf showHUDWithText:error];
//            }else{
//                [blkSelf showHUDWithText:@"加载失败，请稍后重试"];
//            }
//        }
//    }];
    
    
//    [MTHttpRequest httpRequestUpdateUserInfo:dic success:^(id responseObj) {
//        [MBProgressHUD hideHUD];
//        [MBProgressHUD showSuccess:@"修改密码成功"];
//        MTUser *user = [YYAccountTool account];
//        user.password = self.passwardField.text;
//        [YYAccountTool saveAccount:user];
//        
//        [self.navigationController popViewControllerAnimated:YES];
//    } failure:^(NSError *error) {
//         [MBProgressHUD hideHUD];
//        NSString *str =  error.userInfo[NSLocalizedDescriptionKey];
//        [MBProgressHUD showError:str];
////        [MBProgressHUD showSuccess:@"修改密码失败"];
//    }];
}
@end
