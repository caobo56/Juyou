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

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.avatar forKey:@"avatar"];
    [aCoder encodeObject:[NSNumber numberWithInt:self.userAge] forKey:@"userAge"];
    [aCoder encodeObject:self.nickName forKey:@"nickName"];
    [aCoder encodeObject:[NSNumber numberWithInt:self.genders] forKey:@"genders"];
    [aCoder encodeObject:self.userId forKey:@"userId"];
    [aCoder encodeObject:self.city forKey:@"city"];
    [aCoder encodeObject:self.birthday forKey:@"birthday"];
    [aCoder encodeObject:self.mobileNum forKey:@"mobileNum"];
    [aCoder encodeObject:self.password forKey:@"password"];
    [aCoder encodeObject:self.createTime forKey:@"createTime"];
    [aCoder encodeObject:[NSNumber numberWithBool:self.isOnline] forKey:@"isOnline"];
    [aCoder encodeObject:self.trueName forKey:@"trueName"];
}
- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        self.avatar = [aDecoder decodeObjectForKey:@"avatar"];
        self.userAge = [[aDecoder decodeObjectForKey:@"userAge"] intValue];
        self.nickName = [aDecoder decodeObjectForKey:@"nickName"];
        self.genders = [[aDecoder decodeObjectForKey:@"genders"] intValue];
        self.userId = [aDecoder decodeObjectForKey:@"userId"];
        self.city = [aDecoder decodeObjectForKey:@"city"];
        self.birthday = [aDecoder decodeObjectForKey:@"birthday"];
        self.mobileNum = [aDecoder decodeObjectForKey:@"mobileNum"];
        self.password = [aDecoder decodeObjectForKey:@"password"];
        self.createTime = [aDecoder decodeObjectForKey:@"createTime"];
        self.trueName = [aDecoder decodeObjectForKey:@"trueName"];
        self.isOnline = [[aDecoder decodeObjectForKey:@"isOnline"] boolValue];
    }
    return self;
}


@end
