//
//  LJHeadImageCell.m
//  MeridianTravel
//
//  Created by mary on 15/6/14.
//  Copyright (c) 2015年 mary. All rights reserved.
//

#import "LJHeadImageCell.h"
#import "OCconstant.h"
#import <QuartzCore/QuartzCore.h>

@implementation LJHeadImageCell
+(instancetype)headCell
{
    return [[[NSBundle mainBundle]loadNibNamed:@"LJHeadImageCell" owner:nil options:nil]lastObject];

}
- (void)awakeFromNib {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.headImageView.layer.borderColor = [UIColor whiteColor].CGColor;
    self.headImageView.layer.borderWidth = 2.0f;
    self.headImageView.layer.masksToBounds = YES;
    self.headImageView.layer.cornerRadius = self.headImageView.width/2;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

@implementation PresonalHeadView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initUI];
    }
    return self;
}

-(void)initUI{
    self.size = CGSizeMake(Screen_weight, 85);
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    UILabel * leftName = [[UILabel alloc]init];
    leftName.size = CGSizeMake(Screen_weight/2, 30);
    leftName.textAlignment = NSTextAlignmentCenter;
    leftName.left = 0;
    leftName.centerY = self.height/2;
    leftName.textColor = lightTextColor;
    leftName.font = [UIFont systemFontOfSize:14.0f];
    leftName.text = @"本月待还";
    [self addSubview:leftName];
    
    _monthPayLable = [[UILabel alloc]init];
    _monthPayLable.size = CGSizeMake(Screen_weight/2, 30);
    _monthPayLable.textAlignment = NSTextAlignmentCenter;
    _monthPayLable.left = 0;
    _monthPayLable.top = leftName.bottom;
    _monthPayLable.textColor = HexRGBAlpha(0xFF7F05, 1.0);
    _monthPayLable.font = [UIFont systemFontOfSize:14.0f];
    _monthPayLable.text = @"¥ 0";
    [self addSubview:_monthPayLable];
    
    UILabel * rightName = [[UILabel alloc]init];
    [self addSubview:rightName];
    rightName.size = CGSizeMake(Screen_weight/2, 30);
    rightName.textAlignment = NSTextAlignmentCenter;
    rightName.right = 0;
    rightName.centerY = self.height/2;
    rightName.textColor = lightTextColor;
    rightName.font = [UIFont systemFontOfSize:14.0f];
    rightName.text = @"可用额度";
    
    _enableCreditLable = [[UILabel alloc]init];
    _enableCreditLable.size = CGSizeMake(Screen_weight/2, 30);
    _enableCreditLable.textAlignment = NSTextAlignmentCenter;
    _enableCreditLable.left = rightName.left;
    _enableCreditLable.top = rightName.bottom;
    _enableCreditLable.textColor = HexRGBAlpha(0xFF7F05, 1.0);
    _enableCreditLable.font = [UIFont systemFontOfSize:14.0f];
    _enableCreditLable.text = @"¥ 0";
    [self addSubview:_enableCreditLable];

}

@end

