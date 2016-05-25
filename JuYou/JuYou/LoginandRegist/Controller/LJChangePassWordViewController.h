//
//  LJChangePassWordViewController.h
//  MeridianTravel
//
//  Created by Edward Xu on 15/6/28.
//  Copyright (c) 2015年 mary. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TPBasicViewController.h"

@interface LJChangePassWordViewController : TPBasicViewController

/** 需要修改密的手机号*/
@property (nonatomic ,copy)NSString *phoneNum;
@property (weak, nonatomic) IBOutlet UITextField *pw1TextField;
@property (weak, nonatomic) IBOutlet UITextField *pw2TextField;

- (IBAction)nextStep:(id)sender;

@end
