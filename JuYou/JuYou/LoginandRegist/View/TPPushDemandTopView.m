//
//  TPPushDemandTopView.m
//  triprice
//
//  Created by caobo56 on 16/2/20.
//
//

#import "TPPushDemandTopView.h"
#import "OCconstant.h"


@implementation TPPushDemandTopView{
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
    [self addSubview:_backBtn];
    _backBtn.size = CGSizeMake(50, back.size.height*3);
    _backBtn.left = 10.2;
    _backBtn.centerY = (self.height-20)/2+20-2;
    [_backBtn setHorizontalLeftImage:back withTitle:@"返回" forState:UIControlStateNormal andWithFont:15];
    [_backBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    
    _rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:_rightBtn];
    _rightBtn.size = CGSizeMake(50, 44);
    _rightBtn.left = Screen_weight-15-_rightBtn.width;
    _rightBtn.centerY = _backBtn.centerY;
    _rightBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    _rightBtn.titleLabel.textAlignment = NSTextAlignmentRight;
    [_rightBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    titleLable = [[UILabel alloc]init];
    [self addSubview:titleLable];
    titleLable.size = CGSizeMake(Screen_weight, NavBarH);
    titleLable.bottom = 0;
    titleLable.centerX = self.width/2;
    titleLable.textAlignment = NSTextAlignmentCenter;
    titleLable.textColor = HexRGBAlpha(0xFFFFFF, 1.0);
    titleLable.font = [UIFont fontWithName:@"Helvetica-Bold" size:18.0f];
    titleLable.text = @"";
    
}

-(void)setBackBtnTitle:(NSString *)backTitle{
    [_backBtn setTitle:backTitle forState:UIControlStateNormal];
}

-(void)setRightTitle:(NSString *)rightTitle{
    [_rightBtn setTitle:rightTitle forState:UIControlStateNormal];
    
}

-(void)setTitle:(NSString *)title{
    titleLable.text = title;
}


@end
