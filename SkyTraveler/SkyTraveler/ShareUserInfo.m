//
//  ShareUserInfo.m
//  SkyTraveller
//
//  Created by PhantomX on 2017/5/11.
//  Copyright © 2017年 chenzhesi. All rights reserved.
//

#import "ShareUserInfo.h"

@implementation ShareUserInfo

static ShareUserInfo *_shareUserInfo;
+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        _shareUserInfo = [super allocWithZone:zone];
    });
    return _shareUserInfo;
}

+ (instancetype)shareUserInfo {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shareUserInfo = [[self alloc]init];
    });
    return _shareUserInfo;
}

- (id)copyWithZone:(NSZone *)zone {
    return _shareUserInfo;
}

@end
