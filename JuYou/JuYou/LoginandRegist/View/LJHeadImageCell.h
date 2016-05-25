//
//  LJHeadImageCell.h
//  MeridianTravel
//
//  Created by mary on 15/6/14.
//  Copyright (c) 2015年 mary. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LJHeadImageCell : UITableViewCell
+(instancetype)headCell;
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
@property (weak, nonatomic) IBOutlet UILabel *nickLabel;

@end
