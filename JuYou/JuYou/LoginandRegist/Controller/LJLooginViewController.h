//
//  LJLooginViewController.h
//  MeridianTravel
//
//  Created by mary on 15/6/14.
//  Copyright (c) 2015年 mary. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TPBasicViewController.h"
typedef void (^JDDLoginMannger)(BOOL isLogin);


@interface LJLooginViewController : TPBasicViewController
@property (weak, nonatomic) IBOutlet UITextField *phoneNumTextField;
@property (weak, nonatomic) IBOutlet UITextField *pwTextField;

@property(nonatomic,copy)JDDLoginMannger LoginMannger;


@end
