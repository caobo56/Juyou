//
//  LJFindPasswordViewController.h
//  MeridianTravel
//
//  Created by Edward Xu on 15/6/28.
//  Copyright (c) 2015年 mary. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TPBasicViewController.h"
//密码找回

@interface LJFindPasswordViewController : TPBasicViewController
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
@property (weak, nonatomic) IBOutlet UITextField *authCodeTextField;
@property (weak, nonatomic) IBOutlet UIButton *authCodeBtn;

@end
