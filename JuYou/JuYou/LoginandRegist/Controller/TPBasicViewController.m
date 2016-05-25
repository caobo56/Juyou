//
//  TPBasicViewController.m
//  triprice
//
//  Created by caobo56 on 16/3/6.
//
//

#import "TPBasicViewController.h"
//#import "JDDTabBarController.h"


@implementation TPBasicViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
//    [TabVC bottomView].hidden = YES;
#warning 隐藏tabbar
}

@end
