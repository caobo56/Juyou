//
//  TPBasicViewController.m
//  triprice
//
//  Created by caobo56 on 16/3/6.
//
//

#import "TPBasicViewController.h"
#import "OCconstant.h"

@implementation TPBasicViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    JYNavBarViewController * nav = (JYNavBarViewController *)TabVC;
    [nav hidesBottomBar:YES];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];

}

@end
