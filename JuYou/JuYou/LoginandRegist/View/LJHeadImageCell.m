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
