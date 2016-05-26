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
@property (nonatomic,copy) NSString *ID;
@property (nonatomic,copy) NSString *ageGroup;
@property (nonatomic,copy) NSString *authCode;
/**
 *  用户头像
 */
@property (nonatomic,copy) NSString *avatar;
/**
 *  用户生日
 */
@property (nonatomic,copy) NSString *birthday;
/**
 *  用户所在城市
 */
@property (nonatomic,copy) NSString *city;
/**
 *  用户注册时间
 */
@property (nonatomic,copy) NSString *createTime;
@property (nonatomic,copy) NSString *credit;
@property (nonatomic,copy) NSString *creditUserId;
@property (nonatomic,copy) NSString *deviceToken;
@property (nonatomic,copy) NSString *dorm;
@property (nonatomic,copy) NSString *enableCredit;
@property (nonatomic,copy) NSString *extendType;
/**
 *  用户性别
 */
@property (nonatomic,assign) userSex genders;
@property (nonatomic,copy) NSString *isEnable;
@property (nonatomic,copy) NSString *isGuider;
/**
 *  是否在线
 */
@property (nonatomic,assign) BOOL isOnline;
@property (nonatomic,copy) NSString *lat;
@property (nonatomic,copy) NSString *level;
@property (nonatomic,copy) NSString *lng;
/**
 *  用户手机号
 */
@property (nonatomic,copy) NSString *mobileNum;
@property (nonatomic,copy) NSString *month;
/**
 *  用户昵称
 */
@property (nonatomic,copy) NSString *nickName;
@property (nonatomic,copy) NSString *openId;
/**
 *  用户密码
 */
@property (nonatomic,copy) NSString *password;

@property (nonatomic,copy) NSString *photos;
@property (nonatomic,copy) NSString *room;
@property (nonatomic,copy) NSString *school;
@property (nonatomic,copy) NSString *status;
/**
 *  真实姓名
 */
@property (nonatomic,copy) NSString *truthName;
/**
 *  用户年龄
 */
@property (nonatomic,assign) int userAge;

/**
 *  用户id
 */
@property (nonatomic,copy) NSString *userId;

@end
