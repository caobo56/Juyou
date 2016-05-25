//
//  LJRegisterViewController.h
//  MeridianTravel
//
//  Created by Edward Xu on 15/6/28.
//  Copyright (c) 2015年 mary. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TPBasicViewController.h"

@interface LJRegisterViewController : TPBasicViewController
/** 手机号*/
@property (weak, nonatomic) IBOutlet UITextField *phoneNumTextField;
/** 昵称*/
@property (weak, nonatomic) IBOutlet UITextField *nickNameTextField;
/** 验证码*/
@property (weak, nonatomic) IBOutlet UITextField *authCodeTextField;
/** 密码*/
@property (weak, nonatomic) IBOutlet UITextField *pwTextField;

/** 获取验证码按钮*/
@property (weak, nonatomic) IBOutlet UIButton *authCodeBtn;
/** 注册按钮*/
@property (weak, nonatomic) IBOutlet UIButton *registerBtn;

/** 获取验证码按钮点击*/
- (IBAction)authCodeBtnClick:(id)sender;
/** 注册按钮点击*/
- (IBAction)regiterBtnClick:(id)sender;
@end
