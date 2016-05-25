//
//  LvUIPickerViewOne.m
//  QMB
//
//  Created by LC_MAC-1 on 14-8-28.
//  Copyright (c) 2014年 MLJ. All rights reserved.
//

#import "LvUIPickerViewOne.h"

@implementation LvUIPickerViewOne

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

-(void)creatLvUIPickerViewOne:(NSArray *)array
{
    if (array.count) {
        self.str = [array objectAtIndex:0];
        self.UIPickerOne.delegate = self;
        self.UIPickerOne.dataSource = self;
        self.dataArray = array;
    }
}

#pragma mark - UIPickerViewDelegate
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return _dataArray.count;
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [_dataArray objectAtIndex:row];
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    _str = [_dataArray objectAtIndex:row];
    self.selectRow = row;
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view

{
        UILabel *myView = nil;
    
        myView = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0,320, 30)];
        
        myView.textAlignment = NSTextAlignmentCenter;
        
        myView.text = [_dataArray objectAtIndex:row];
        
        myView.font = [UIFont systemFontOfSize:14];         //用label来设置字体大小
        
        myView.backgroundColor = [UIColor clearColor];
        
    return myView;
    
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component

{
//    CGFloat componentWidth = 0.0;
//    if (component == 0)
//        componentWidth = 200.0; // 第一个组键的宽度
//    else
//        componentWidth = 120.0; // 第2个组键的宽度
//    return componentWidth;
    return 320;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 40.0;
}

#pragma mark - UIPickerViewDataSource

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
