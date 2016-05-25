
//
//  TPWeekRecommendTopView.m
//  triprice
//
//  Created by caobo56 on 16/2/15.
//
//

#import "TPWeekRecommendTopView.h"
#import "OCconstant.h"

@implementation TPWeekRecommendTopView{
    UILabel * titleLable;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initUI];
    }
    return self;
}

-(void)initUI{
    self.size = CGSizeMake(Screen_weight,NavBarH+StateBarH);
    self.backgroundColor = NavBgColor;
    UIImage * back = [UIImage imageNamed:@"back"];
    _backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _backBtn.size = CGSizeMake(50, back.size.height*3);
    _backBtn.left = 10.2;
    _backBtn.centerY = (self.height-20)/2+20-2;
    [_backBtn setHorizontalLeftImage:back withTitle:@"返回" forState:UIControlStateNormal andWithFont:15];
    [_backBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self addSubview:_backBtn];
    
    titleLable = [[UILabel alloc]init];
    titleLable.size = CGSizeMake(Screen_weight, NavBarH);
    [self addSubview:titleLable];
    titleLable.bottom = 0;
    titleLable.centerX = self.width/2;
    titleLable.textAlignment = NSTextAlignmentCenter;
    titleLable.textColor = HexRGBAlpha(0xFFFFFF, 1.0);
    titleLable.font = [UIFont fontWithName:@"Helvetica-Bold" size:18.0f];
    titleLable.text = @"每周推荐";

}

-(void)setBackBtnTitle:(NSString *)backTitle{
    [_backBtn setTitle:backTitle forState:UIControlStateNormal];
}

-(void)setTitle:(NSString *)title{
    titleLable.text = title;
}

@end
