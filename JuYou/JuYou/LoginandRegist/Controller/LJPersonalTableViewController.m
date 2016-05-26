//
//  LJPersonalTableViewController.m
//  MeridianTravel
//
//  Created by mary on 15/6/13.
//  Copyright (c) 2015年 mary. All rights reserved.
//

#import "LJPersonalTableViewController.h"
#import "LJHeadImageCell.h"
#import "LJChangePersonInfoController.h"
#import "TPPushDemandTopView.h"
#import <QuartzCore/QuartzCore.h>

#import "UIImageView+WebCache.h"
#import "LJLooginViewController.h"
#import "OCconstant.h"

#import "YYAccountTool.h"
#import "MTUser.h"

#import "MTColor.h"
//#import "MyOrderListVC.h"
//#import "MyxNeedListVC.h"

@interface LJPersonalTableViewController ()<UIActionSheetDelegate>
@property (nonatomic,strong) LJHeadImageCell *headCell;
@property (nonatomic,strong) NSArray *demandArray;
@property (nonatomic,strong) NSMutableDictionary *dict;
@property (nonatomic,strong) NSArray * monthPayArr;
@end

@implementation LJPersonalTableViewController{
    TPPushDemandTopView * topView;
}

- (NSMutableDictionary *)dict{
    if (_dict==nil) {
        _dict = [[NSMutableDictionary alloc]init];
    }
    return _dict;
}

- (void)viewDidLoad {
    _monthPayArr = [[NSArray alloc]init];
    [super viewDidLoad];
    [self initUI];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _headCell = [LJHeadImageCell headCell];
    _demandArray = @[@"我的订单",@"我的认证"];
    self.navigationController.navigationBar.hidden = YES;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    [self searchUserById];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    JYNavBarViewController * navbar = (JYNavBarViewController *)TabVC;
    [navbar hidesBottomBar:NO];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

-(void)initUI{
    topView = [[TPPushDemandTopView alloc]init];
    [self.view addSubview:topView];
    [topView setBackBtnTitle:@"返回"];
    topView.backBtn.hidden = YES;
    [topView setTitle:@"个 人"];
    topView.top = -20;
    [topView.backBtn addTarget:self action:@selector(backBtnPress) forControlEvents:UIControlEventTouchUpInside];
}

-(void)backBtnPress{
    [self.navigationController popViewControllerAnimated:YES];
}

//查询用户信息
-(void)searchUserById{
    MTUser *user = [YYAccountTool account];
    NSMutableDictionary * dict = [[NSMutableDictionary alloc]init];
    [dict setObject:user.userId forKey:@"userInfo.userId"];
    __block LJPersonalTableViewController * blkSelf = self;
    [JYAPIClient searchUserById:dict sucess:^(id  _Nonnull data) {
        NSDictionary * dict = (NSDictionary *)data;
        if (dict) {
            blkSelf.dict = [NSMutableDictionary dictionaryWithDictionary:dict];
            [blkSelf lodaData];
        }
    } failure:^(id  _Nonnull data) {
        
    }];
    
    [JYAPIClient searchMonthPay:dict sucess:^(id  _Nonnull data) {
        NSArray * arr = (NSArray *)data;
        if (arr) {
            blkSelf.monthPayArr = arr;
            [blkSelf lodaData];
        }
    } failure:^(id  _Nonnull data) {
        
    }];
    
}
- (void)lodaData{
    NSString *headImage = self.dict[@"avatar"];
    NSString *nickStr = self.dict[@"nickName"];
    if (![headImage isEqual:[NSNull null]]) {
        [_headCell.headImageView sd_setImageWithURL:[NSURL URLWithString:headImage] placeholderImage:[UIImage imageNamed:@"mine_bg"]];
    }
    if (![nickStr isEqual:[NSNull null]]) {
        _headCell.nickLabel.text = nickStr;
    }
}

#pragma mark - Table view data source
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section ==1) {
        return 25;
    }else if(section ==2)
    {
        return 20;
    }else
    {
        return 0;
    }
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 20)];
    return view;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 194;
    }else
    {
        return 49;
    }
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    if (section==1) {
        
        return _demandArray.count;
    }else
    {
        return 1;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return _headCell;
    }else
    {
        UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:nil];
        cell.textLabel.textColor = [MTColor contentNormalColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        UIView *topview = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 0.5)];
        topview.backgroundColor = [UIColor lightGrayColor];
        topview.alpha = 0.3;
        
        UIView *buttomview = [[UIView alloc]initWithFrame:CGRectMake(0, 48, self.tableView.frame.size.width, 0.5)];
        buttomview.backgroundColor = [UIColor lightGrayColor];
        buttomview.alpha = 0.3;
        
        if (indexPath.section==1) {
            if (indexPath.row==0) {
                [cell.contentView addSubview:topview];
                [cell.imageView setImage:[UIImage imageNamed:@"price"]];
            }else if(indexPath.row==1)
            {
                [cell.imageView setImage:[UIImage imageNamed:@"my_booking_ic"]];
                [cell.contentView addSubview:topview];
                [cell.contentView addSubview:buttomview];
            }else
            {
                [cell.imageView setImage:[UIImage imageNamed:@"my_booking_ic"]];
                //                [cell.contentView addSubview:topview];
                [cell.contentView addSubview:buttomview];
            }
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.textLabel.text = _demandArray[indexPath.row];
        }else
        {
            cell.textLabel.text = @"退出登录";
            [cell.contentView addSubview:topview];
            [cell.contentView addSubview:buttomview];
            cell.textLabel.textColor = [UIColor redColor];
            cell.textLabel.textAlignment = NSTextAlignmentCenter;
            cell.contentMode = UIViewContentModeCenter;
        }
        return cell;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        //        UIStoryboard *board = [UIStoryboard storyboardWithName:@"changPersonInfn" bundle:nil];
        //        LJChangePersonInfoController *vc = [board instantiateViewControllerWithIdentifier:@"LJChangePersonInfoController"];
        //        vc.dataDict = self.dict;
        ////        [TabVC bottomView].hidden = YES;
        //    [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.section ==1)
    {
        if (indexPath.row == 0){//我的需求
            //            MyOrderListVC *myOrder = [[MyOrderListVC alloc]init];
            //            [self.navigationController pushViewController:myOrder animated:YES];
            
        }else if (indexPath.row==1){
            //            MyNeedListVC *myOrder = [[MyNeedListVC alloc]init];
            //            [self.navigationController pushViewController:myOrder animated:YES];
        }else{
            
        }
    }else{
        UIActionSheet *sheet = [[UIActionSheet alloc]initWithTitle:@"您确定退出登录吗" delegate:self cancelButtonTitle:@"点错了" destructiveButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [sheet showInView:self.view];
        
    }
}

#pragma mark -UIActionSheetDelegte
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex==0) {//确定退出
        //退出登录
        [[NSUserDefaults standardUserDefaults]setBool:NO forKey:@"login"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        __block LJPersonalTableViewController * blkSelf = self;
        LJLooginViewController *vc = [[LJLooginViewController alloc]init];
        vc.LoginMannger = ^(BOOL isLogin){
            if (isLogin){
                [self searchUserById];
            }else{
                [blkSelf.navigationController popViewControllerAnimated:YES];
                //                [TabVC setSelectedIndex:0];
            }
        };
        UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
        [self presentViewController:nav animated:YES completion:nil];
    }
}
@end
