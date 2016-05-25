//
//  MTUser.h
//  MeridianTravel
//
//  Created by mary on 15/6/14.
//  Copyright (c) 2015年 mary. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef enum sex{
    woman,
    man
}userSex;


@interface MTUser : NSObject<NSCoding>
/**
 *  用户头像
 */
@property (nonatomic,copy) NSString *avatar;
/**
 *  用户年龄
 */
@property (nonatomic,assign) int userAge;
/**
 *  用户昵称
 */
@property (nonatomic,copy) NSString *nickName;
/**
 *  用户性别
 */
@property (nonatomic,assign) userSex genders;
/**
 *  用户id
 */
@property (nonatomic,copy) NSString *userId;
/**
 *  用户所在城市
 */
@property (nonatomic,copy) NSString *city;
/**
 *  用户生日
 */
@property (nonatomic,copy) NSString *birthday;
/**
 *  用户手机号
 */
@property (nonatomic,copy) NSString *mobileNum;
/**
 *  用户密码
 */
@property (nonatomic,copy) NSString *password;
/**
 *  用户注册时间
 */
@property (nonatomic,copy) NSString *createTime;
/**
 *  是否在线
 */
@property (nonatomic,assign) BOOL isOnline;
/**
 *  真实姓名
 */
@property (nonatomic,copy) NSString *trueName;
@end
