//
//  MTUser.m
//  MeridianTravel
//
//  Created by mary on 15/6/14.
//  Copyright (c) 2015年 mary. All rights reserved.
//

#import "MTUser.h"

@implementation MTUser

#pragma mark - NSCoding Delegate

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.ID forKey:@"ID"];
    [aCoder encodeObject:self.ageGroup forKey:@"ageGroup"];
    [aCoder encodeObject:self.authCode forKey:@"authCode"];
    [aCoder encodeObject:self.avatar forKey:@"avatar"];
    [aCoder encodeObject:self.birthday forKey:@"birthday"];
    [aCoder encodeObject:self.city forKey:@"city"];
    [aCoder encodeObject:self.createTime forKey:@"createTime"];
    [aCoder encodeObject:self.credit forKey:@"credit"];
    [aCoder encodeObject:self.creditUserId forKey:@"creditUserId"];
    [aCoder encodeObject:self.deviceToken forKey:@"deviceToken"];
    [aCoder encodeObject:self.dorm forKey:@"dorm"];
    [aCoder encodeObject:self.enableCredit forKey:@"enableCredit"];
    [aCoder encodeObject:self.extendType forKey:@"extendType"];
    [aCoder encodeObject:[NSNumber numberWithInt:self.genders] forKey:@"genders"];
    [aCoder encodeObject:self.isEnable forKey:@"isEnable"];
    [aCoder encodeObject:self.isGuider forKey:@"isGuider"];
    [aCoder encodeObject:[NSNumber numberWithBool:self.isOnline] forKey:@"isOnline"];
    [aCoder encodeObject:self.lat forKey:@"lat"];
    [aCoder encodeObject:self.level forKey:@"level"];
    [aCoder encodeObject:self.lng forKey:@"lng"];
    [aCoder encodeObject:self.mobileNum forKey:@"mobileNum"];
    [aCoder encodeObject:self.month forKey:@"month"];
    [aCoder encodeObject:self.nickName forKey:@"nickName"];
    [aCoder encodeObject:self.openId forKey:@"openId"];
    [aCoder encodeObject:self.password forKey:@"password"];
    [aCoder encodeObject:self.photos forKey:@"photos"];
    [aCoder encodeObject:self.room forKey:@"room"];
    [aCoder encodeObject:self.school forKey:@"school"];
    [aCoder encodeObject:self.status forKey:@"status"];
    [aCoder encodeObject:self.truthName forKey:@"truthName"];
    [aCoder encodeObject:[NSNumber numberWithInt:self.userAge] forKey:@"userAge"];
    [aCoder encodeObject:self.userId forKey:@"userId"];
}


- (id)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super init]) {
        self.ID  = [aDecoder decodeObjectForKey:@"ID"];
        self.ageGroup  = [aDecoder decodeObjectForKey:@"ageGroup"];
        self.authCode  = [aDecoder decodeObjectForKey:@"authCode"];
        self.avatar  = [aDecoder decodeObjectForKey:@"avatar"];
        self.birthday  = [aDecoder decodeObjectForKey:@"birthday"];
        self.city  = [aDecoder decodeObjectForKey:@"city"];
        self.createTime  = [aDecoder decodeObjectForKey:@"createTime"];
        self.credit  = [aDecoder decodeObjectForKey:@"credit"];
        self.creditUserId  = [aDecoder decodeObjectForKey:@"creditUserId"];
        self.deviceToken  = [aDecoder decodeObjectForKey:@"deviceToken"];
        self.dorm  = [aDecoder decodeObjectForKey:@"dorm"];
        self.enableCredit  = [aDecoder decodeObjectForKey:@"enableCredit"];
        self.extendType  = [aDecoder decodeObjectForKey:@"extendType"];
        self.genders  = [[aDecoder decodeObjectForKey:@"genders"] intValue];
        self.isEnable  = [aDecoder decodeObjectForKey:@"isEnable"];
        self.isGuider  = [aDecoder decodeObjectForKey:@"isGuider"];
        self.isOnline  = [[aDecoder decodeObjectForKey:@"isOnline"] boolValue];
        self.lat  = [aDecoder decodeObjectForKey:@"lat"];
        self.level  = [aDecoder decodeObjectForKey:@"level"];
        self.lng  = [aDecoder decodeObjectForKey:@"lng"];
        self.mobileNum  = [aDecoder decodeObjectForKey:@"mobileNum"];
        self.month  = [aDecoder decodeObjectForKey:@"month"];
        self.nickName  = [aDecoder decodeObjectForKey:@"nickName"];
        self.openId  = [aDecoder decodeObjectForKey:@"openId"];
        self.password  = [aDecoder decodeObjectForKey:@"password"];
        self.photos  = [aDecoder decodeObjectForKey:@"photos"];
        self.room  = [aDecoder decodeObjectForKey:@"room"];
        self.school  = [aDecoder decodeObjectForKey:@"school"];
        self.status  = [aDecoder decodeObjectForKey:@"status"];
        self.truthName  = [aDecoder decodeObjectForKey:@"truthName"];
        self.userAge  = [[aDecoder decodeObjectForKey:@"userAge"] intValue];
        self.userId  = [aDecoder decodeObjectForKey:@"userId"];
    }
    return self;
}


@end
