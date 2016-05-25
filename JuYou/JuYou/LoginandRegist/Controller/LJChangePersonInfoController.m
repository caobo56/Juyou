//
//  LJChangePersonInfoController.m
//  MeridianTravel
//
//  Created by mary on 15/6/14.
//  Copyright (c) 2015年 mary. All rights reserved.
//

#import "LJChangePersonInfoController.h"
#import "LvUIPickerViewOne.h"
#import "LvInputView.h"
#import "LJFindPasswordViewController.h"
#import "TPPushDemandTopView.h"
#import "OCconstant.h"

#import "MTUser.h"
#import "YYAccountTool.h"

#import "NSString+NSPredicate.h"
#import "UIButton+WebCache.h"
#import "MTChangePassWordController.h"
#import "MTColor.h"

@interface LJChangePersonInfoController ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate,UIActionSheetDelegate>
@property (weak, nonatomic) IBOutlet UIButton *headImageViewBtn;
@property (weak, nonatomic) IBOutlet UITextField *nickNameField;
@property (weak, nonatomic) IBOutlet UITextField *sexField;
@property (weak, nonatomic) IBOutlet UITextField *cityField;
@property (weak, nonatomic) IBOutlet UITextField *birthField;
@property (weak, nonatomic) IBOutlet UITextField *phoneField;
@property (nonatomic,strong) UIImage *headImage;
//0 女 1男
@property (nonatomic,assign) int genderNum;
@property (weak, nonatomic) IBOutlet UITableViewCell *changePwdCell;



//头像
- (IBAction)headImageViewBtnClick:(UIButton *)sender;
@end

@implementation LJChangePersonInfoController{
    TPPushDemandTopView * topView;
}
- (NSMutableDictionary *)dataDict
{
    if (_dataDict==nil) {
        _dataDict = [[NSMutableDictionary alloc]init];
    }
    return _dataDict;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

-(void)initUI{
    topView = [[TPPushDemandTopView alloc]init];
    [topView setBackBtnTitle:@"返回"];
    [topView setTitle:@"修改个人信息"];
    [topView setRightTitle:@"保存"];
    topView.top = -20;
    [topView.backBtn addTarget:self action:@selector(backBtnPress) forControlEvents:UIControlEventTouchUpInside];
    [topView.rightBtn addTarget:self action:@selector(saveBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:topView];
//    self.navigationItem.hidesBackButton = YES;
}

-(void)backBtnPress{
//    [topView removeFromSuperview];
    [self.navigationController popViewControllerAnimated:YES];
//    self.navigationItem.hidesBackButton = NO;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"保存" style:(UIBarButtonItemStylePlain) target:self action:@selector(saveBtnClick)];
//    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
//    self.title = @"修改个人信息";
    
    //性别field
    LvUIPickerViewOne *sexPick = [[[NSBundle mainBundle]loadNibNamed:@"LvUIPickerViewOne" owner:self options:nil]lastObject];;
    NSArray *sexarray = [NSArray arrayWithObjects:@"女",@"男",nil];
    [sexPick creatLvUIPickerViewOne:sexarray];
    self.sexField.inputView = sexPick;
    [self creatKeyBoardWith:self.sexField andBtnTag:1];
    
    //生日
    [self setdateView:self.birthField andWithTag:2];
    [self creatKeyBoardWith:self.birthField andBtnTag:2];
    [self fuzhi];
    
    //是否隐藏修改密码这个功能
   NSNumber *num = [[NSUserDefaults standardUserDefaults]objectForKey:@"loginType"];
//    [num boolValue];
    self.changePwdCell.hidden = [num boolValue];
}


- (void)fuzhi
{
    NSString *headImage = self.dataDict[@"avatar"];
    NSString *nickStr = self.dataDict[@"nickName"];
    NSString *cityStr = self.dataDict[@"city"];
    NSNumber *genderNum = self.dataDict[@"genders"];
    NSString *birthStr = self.dataDict[@"birthday"];
    NSString *phoneStr = self.dataDict[@"mobileNum"];
//    NSString *passwardStr  = self.dataDict[@"password"];
    if (![headImage isEqual:[NSNull null]]) {
        [self.headImageViewBtn sd_setBackgroundImageWithURL:[NSURL URLWithString:headImage] forState:(UIControlStateNormal) placeholderImage:[UIImage imageNamed:@"touxiang"]];
    }
    if (![nickStr isEqual:[NSNull null]]) {
        self.nickNameField.text = nickStr;
    }
    if (![cityStr isEqual:[NSNull null]]) {
         self.cityField.text = cityStr;
    }
    if (![genderNum isEqual:[NSNull null]]) {
        if ([genderNum intValue]==0) {
            self.sexField.text = @"女";
            self.genderNum = 0;
        }else
        {
             self.sexField.text = @"男";
            self.genderNum = 1;
        }
        
    }
    if (![birthStr isEqual:[NSNull null]]) {
        self.birthField.text = birthStr;
    }
    if (![phoneStr isEqual:[NSNull null]]) {
        self.phoneField.text = phoneStr;
    }
}

-(void)setdateView:(UITextField *)field andWithTag:(NSInteger)tag
{
    //13.出生日期
    UIDatePicker *datePicker = [[UIDatePicker alloc]initWithFrame:CGRectMake(0,20, 320, 216)];
    datePicker.tag = tag;
    datePicker.alpha = 0.8;
    datePicker.backgroundColor = [UIColor whiteColor];
    [datePicker setDatePickerMode:UIDatePickerModeDate];
//    NSDate* minDate = [NSDate date];
    //    NSDate* maxDate = [[NSDate alloc]initWithString:@"2099-01-01 00:00:00 -0500"];
//    datePicker.minimumDate = minDate;
    //    datePicker.maximumDate = maxDate;
    // 2) 设置区域：指定是中国地区
    [datePicker setLocale:[[NSLocale alloc]initWithLocaleIdentifier:@"zh_Hans"]];
    //    datePicker.maximumDate = [NSDate date];
    field.inputView = datePicker;
    // 3) 增加监听方法
    [datePicker addTarget:self action:@selector(dateValueChanged:) forControlEvents:UIControlEventValueChanged];
    
}
- (void)dateValueChanged:(UIDatePicker *)datePicker
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    self.birthField.text = [formatter stringFromDate:datePicker.date];
}
#pragma mark - 创建键盘上边的view
-(void)creatKeyBoardWith:(UITextField *)field andBtnTag:(NSInteger)tag
{
    LvInputView *view = [LvInputView creatInputView];
    view.cancelBtn.tag = tag;
    view.completeBtn.tag = tag;
    view.titlelabel.text = @"";
    [view.cancelBtn addTarget:self action:@selector(cancelBtnClick:) forControlEvents:(UIControlEventTouchUpInside)];
    [view.completeBtn addTarget:self action:@selector(completeBtnClick:) forControlEvents:(UIControlEventTouchUpInside)];
    field.inputAccessoryView = view;
}
//取消
- (void)cancelBtnClick:(UIButton *)btn
{
    [self.view endEditing:YES];
}
//完成
- (void)completeBtnClick:(UIButton *)btn
{
    [self.view endEditing:YES];
    if (btn.tag==1) {//性别
        LvUIPickerViewOne *pick = (LvUIPickerViewOne *)self.sexField.inputView;
        self.sexField.text = pick.str;
        self.genderNum = pick.selectRow;
    }else if (btn.tag ==2)
    {
        UIDatePicker *pick = (UIDatePicker *)self.birthField.inputView;
        NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
        [formatter setDateFormat:@"yyyy-MM-dd"];
        self.birthField.text = [formatter stringFromDate:pick.date];
    }
}
#pragma mark - UIActionSheetDelegate
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0:
            //从相册选择
            [self LocalPhoto];
            break;
        case 1:
            //拍照
            [self takePhoto];
            break;
        default:
            break;
    }
}
/**
 *  从相册选择
 */
-(void)LocalPhoto{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    //资源类型为图片库
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.delegate = self;
    //设置选择后的图片可被编辑
    picker.allowsEditing = YES;
    [self presentViewController:picker animated:YES completion:nil];
    
}
/**
 *  拍照
 */
-(void)takePhoto{
    //资源类型为照相机
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    //判断是否有相机
    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera]){
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        //设置拍照后的图片可被编辑
        picker.allowsEditing = YES;
        //资源类型为照相机
        picker.sourceType = sourceType;
        [self presentViewController:picker animated:YES completion:nil];
    }else {
        //        [self showAlertViewWithMessage:@"不支持拍照功能"];
        //        MyLog(@"该设备无摄像头");
//        [ showToastErrorMessage:@"该设备不支持拍照功能"];
        
    }
}
#pragma mark - UIImagePickerControllerDelegate
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo{
    if (image != nil) {
        [self.headImageViewBtn setBackgroundImage:image forState:(UIControlStateNormal)];
//        [_personCell.changHeadImagebtn setBackgroundImage:image forState:UIControlStateNormal];
        //        NSData* imageData = UIImagePNGRepresentation(image);
        //base64
        self.headImage = image;
        //        MyLog(@"%@",imageStr);
        //上传头像
        //        [self uploadHeadImage:imageStr];
    }
    //关闭相册界面
    [picker dismissModalViewControllerAnimated:YES];
}


- (IBAction)headImageViewBtnClick:(UIButton *)sender {
    UIActionSheet *sheet = [[UIActionSheet alloc]initWithTitle:@"选择头像" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"从相册中选择",@"拍照", nil];
    [sheet showInView:self.view];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==2) {
        //跳到修改密码页面
        MTChangePassWordController *vc = [[MTChangePassWordController alloc]init];
//        [[NSUserDefaults standardUserDefaults]setBool:YES forKey:@"ischangeInfoViewController"];
//        [[NSUserDefaults standardUserDefaults]synchronize];
        [self.navigationController pushViewController:vc animated:YES];
        
    }
}
//保存信息
-(void)saveBtnClick
{
    NSString *imageStr = nil;
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
    if (self.headImage) {
        NSData* imageData = UIImageJPEGRepresentation(self.headImage,0.1f);
        imageStr = [imageData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
        [dic setValue:imageStr forKey:@"userInfo.avatar"];
    }
    MTUser *user = [YYAccountTool account];
    [dic setValue:user.userId forKey:@"userInfo.userId"];
    [dic setValue:self.nickNameField.text forKey:@"userInfo.nickName"];
    [dic setValue:self.cityField.text forKey:@"userInfo.city"];
    [dic setValue:@(self.genderNum) forKey:@"userInfo.genders"];
    if (self.phoneField.text.length) {
        if ([NSString isMobileNumber:self.phoneField.text]) {
            [dic setValue:self.phoneField.text forKey:@"userInfo.mobileNum"];
        }else
        {
            [self showHUDWithText:@"请输入正确的手机号"];
            return;
        }
    }
    [self showLoadingHUDWithText:nil];
    __block LJChangePersonInfoController * blkSelf = self;
    [dic setValue:self.birthField.text forKey:@"userInfo.birthday"];
//    [[JDDAPIs sharedJDDAPIs]updateUserInfoWithParameters:dic WithBlock:^(NSDictionary *dict, NSString *error) {
//        [blkSelf hideAllHUD];
//        if (dict) {
//            [blkSelf showHUDWithText:@"保存信息成功"];
//            [self.navigationController popViewControllerAnimated:YES];
//        }else{
//            if (error) {
//                [blkSelf showHUDWithText:error];
//            }else{
//                [blkSelf showHUDWithText:@"加载失败，请稍后重试"];
//            }
//        }
//    }];
}
@end
