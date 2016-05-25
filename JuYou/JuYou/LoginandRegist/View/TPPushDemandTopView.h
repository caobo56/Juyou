//
//  TPPushDemandTopView.h
//  triprice
//
//  Created by caobo56 on 16/2/20.
//
//

#import <UIKit/UIKit.h>


@interface TPPushDemandTopView : UIView

@property(nonatomic,strong)UIButton * backBtn;
@property(nonatomic,strong)UIButton * rightBtn;

-(void)setBackBtnTitle:(NSString *)backTitle;

-(void)setRightTitle:(NSString *)rightTitle;

-(void)setTitle:(NSString *)title;



@end
