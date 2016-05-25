//
//  LvUIPickerViewOne.h
//  QMB
//
//  Created by LC_MAC-1 on 14-8-28.
//  Copyright (c) 2014年 MLJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LvUIPickerViewOne : UIView<UIPickerViewDelegate,UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UIPickerView *UIPickerOne;
@property (nonatomic,strong)NSArray *dataArray;
@property (nonatomic,copy)NSString *str;
@property (nonatomic,assign)int selectRow;
-(void)creatLvUIPickerViewOne:(NSArray *)array;
@end
