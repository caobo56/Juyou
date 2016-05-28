//
//  TPRatingStart.m
//  triprice
//
//  Created by caobo56 on 16/2/19.
//
//

#import "TPRatingStart.h"
#import "OCconstant.h"

@implementation TPRatingStart{

    UIButton * start0;
    UIButton * start1;
    UIButton * start2;
    UIButton * start3;
    UIButton * start4;
    
    BOOL enable;
    UIImage * startImg;
    UIImage * startHalf;
    UIImage * startSelectImg;
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
    enable = YES;
    self.size = CGSizeMake(80, 30);
    self.backgroundColor = [UIColor clearColor];
    startImg = [UIImage imageNamed:@"d_star"];
    startSelectImg = [UIImage imageNamed:@"d_star_p"];
    startHalf = [UIImage imageNamed:@"d_star_n"];
    start0 = [UIButton buttonWithType:UIButtonTypeCustom];
    start0.width = self.width/5;
    start0.height = self.height;
    start0.left = 0;
    start0.top = 0;
    [start0 setShowsTouchWhenHighlighted:YES];
    start0.tag = 1000;
    [start0 addTarget:self action:@selector(startClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:start0];
    
    
    start1 = [UIButton buttonWithType:UIButtonTypeCustom];
    start1.width = self.width/5;
    start1.height = self.height;
    start1.left = start0.right;
    start1.top = 0;
    [start1 setShowsTouchWhenHighlighted:YES];
    start1.tag = 1001;
    [start1 addTarget:self action:@selector(startClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:start1];
    
    start2 = [UIButton buttonWithType:UIButtonTypeCustom];
    start2.width = self.width/5;
    start2.height = self.height;
    start2.left = start1.right;
    start2.top = 0;
    [start2 setShowsTouchWhenHighlighted:YES];
    start2.tag = 1002;
    [start2 addTarget:self action:@selector(startClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:start2];
    
    start3 = [UIButton buttonWithType:UIButtonTypeCustom];
    start3.width = self.width/5;
    start3.height = self.height;
    start3.left = start2.right;
    start3.top = 0;
    [start3 setShowsTouchWhenHighlighted:YES];
    start3.tag = 1003;
    [start3 addTarget:self action:@selector(startClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:start3];
    
    start4 = [UIButton buttonWithType:UIButtonTypeCustom];
    start4.width = self.width/5;
    start4.height = self.height;
    start4.left = start3.right;
    start4.top = 0;
    [start4 setShowsTouchWhenHighlighted:YES];
    start4.tag = 1004;
    [start4 addTarget:self action:@selector(startClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:start4];

}

-(void)startClick:(id)sender{
    UIButton * btn = (UIButton *)sender;
    if (!enable) {
        return;
    }
    switch (btn.tag) {
        case 1000:
        {
            start0.selected = YES;
            start1.selected = NO;
            start2.selected = NO;
            start3.selected = NO;
            start4.selected = NO;
        }
            break;
        case 1001:
        {
            start0.selected = YES;
            start1.selected = YES;
            start2.selected = NO;
            start3.selected = NO;
            start4.selected = NO;
        }
            break;
        case 1002:
        {
            start0.selected = YES;
            start1.selected = YES;
            start2.selected = YES;
            start3.selected = NO;
            start4.selected = NO;
        }
            break;
        case 1003:
        {
            start0.selected = YES;
            start1.selected = YES;
            start2.selected = YES;
            start3.selected = YES;
            start4.selected = NO;
        }
            break;
        case 1004:
        {
            start0.selected = YES;
            start1.selected = YES;
            start2.selected = YES;
            start3.selected = YES;
            start4.selected = YES;
        }
            break;
        default:
            break;
    }
}


-(void)setRatingStartLeval:(float)leval{
    if (leval == 0) {
        [start0 setImage:startSelectImg forState:UIControlStateNormal];
        [start1 setImage:startSelectImg forState:UIControlStateNormal];
        [start2 setImage:startSelectImg forState:UIControlStateNormal];
        [start3 setImage:startSelectImg forState:UIControlStateNormal];
        [start4 setImage:startSelectImg forState:UIControlStateNormal];
    }else if(leval == 0.5) {
        [start0 setImage:startHalf forState:UIControlStateNormal];
        [start1 setImage:startSelectImg forState:UIControlStateNormal];
        [start2 setImage:startSelectImg forState:UIControlStateNormal];
        [start3 setImage:startSelectImg forState:UIControlStateNormal];
        [start4 setImage:startSelectImg forState:UIControlStateNormal];
    }else if(leval == 1.0) {
        [start0 setImage:startImg forState:UIControlStateNormal];
        [start1 setImage:startSelectImg forState:UIControlStateNormal];
        [start2 setImage:startSelectImg forState:UIControlStateNormal];
        [start3 setImage:startSelectImg forState:UIControlStateNormal];
        [start4 setImage:startSelectImg forState:UIControlStateNormal];
    }else if(leval == 1.5) {
        [start0 setImage:startImg forState:UIControlStateNormal];
        [start1 setImage:startHalf forState:UIControlStateNormal];
        [start2 setImage:startSelectImg forState:UIControlStateNormal];
        [start3 setImage:startSelectImg forState:UIControlStateNormal];
        [start4 setImage:startSelectImg forState:UIControlStateNormal];
    }else if (leval == 2.0){
        [start0 setImage:startImg forState:UIControlStateNormal];
        [start1 setImage:startImg forState:UIControlStateNormal];
        [start2 setImage:startSelectImg forState:UIControlStateNormal];
        [start3 setImage:startSelectImg forState:UIControlStateNormal];
        [start4 setImage:startSelectImg forState:UIControlStateNormal];
    }else if (leval == 2.5){
        [start0 setImage:startImg forState:UIControlStateNormal];
        [start1 setImage:startImg forState:UIControlStateNormal];
        [start2 setImage:startHalf forState:UIControlStateNormal];
        [start3 setImage:startSelectImg forState:UIControlStateNormal];
        [start4 setImage:startSelectImg forState:UIControlStateNormal];
    }else if (leval == 3.0){
        [start0 setImage:startImg forState:UIControlStateNormal];
        [start1 setImage:startImg forState:UIControlStateNormal];
        [start2 setImage:startImg forState:UIControlStateNormal];
        [start3 setImage:startSelectImg forState:UIControlStateNormal];
        [start4 setImage:startSelectImg forState:UIControlStateNormal];
    }else if (leval == 3.5){
        [start0 setImage:startImg forState:UIControlStateNormal];
        [start1 setImage:startImg forState:UIControlStateNormal];
        [start2 setImage:startImg forState:UIControlStateNormal];
        [start3 setImage:startHalf forState:UIControlStateNormal];
        [start4 setImage:startSelectImg forState:UIControlStateNormal];
    }else if (leval == 4.0){
        [start0 setImage:startImg forState:UIControlStateNormal];
        [start1 setImage:startImg forState:UIControlStateNormal];
        [start2 setImage:startImg forState:UIControlStateNormal];
        [start3 setImage:startImg forState:UIControlStateNormal];
        [start4 setImage:startSelectImg forState:UIControlStateNormal];
    }else if (leval == 4.5){
        [start0 setImage:startImg forState:UIControlStateNormal];
        [start1 setImage:startImg forState:UIControlStateNormal];
        [start2 setImage:startImg forState:UIControlStateNormal];
        [start3 setImage:startImg forState:UIControlStateNormal];
        [start4 setImage:startHalf forState:UIControlStateNormal];
    }else{
        [start0 setImage:startImg forState:UIControlStateNormal];
        [start1 setImage:startImg forState:UIControlStateNormal];
        [start2 setImage:startImg forState:UIControlStateNormal];
        [start3 setImage:startImg forState:UIControlStateNormal];
        [start4 setImage:startImg forState:UIControlStateNormal];
    }
}

//-(void)setUserEnable:(BOOL)isEnable{
//    enable = isEnable;
//}

//-(NSInteger)getStartLevelCount{
//    NSInteger count = 0;
//    if (start0.selected) {
//        count++;
//    }
//    if (start1.selected) {
//        count++;
//    }
//    if (start2.selected) {
//        count++;
//    }
//    if (start3.selected) {
//        count++;
//    }
//    if (start4.selected) {
//        count++;
//    }
//    return count;
//}

@end
