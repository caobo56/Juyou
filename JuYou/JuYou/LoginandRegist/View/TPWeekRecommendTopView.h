//
//  TPWeekRecommendTopView.h
//  triprice
//
//  Created by caobo56 on 16/2/15.
//
//

#import <UIKit/UIKit.h>

@interface TPWeekRecommendTopView : UIView

@property(nonatomic,strong)UIButton * backBtn;

-(void)setBackBtnTitle:(NSString *)backTitle;

-(void)setTitle:(NSString *)title;

@end
