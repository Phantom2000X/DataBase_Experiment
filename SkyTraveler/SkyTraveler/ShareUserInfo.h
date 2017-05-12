//
//  ShareUserInfo.h
//  SkyTraveller
//
//  Created by PhantomX on 2017/5/11.
//  Copyright © 2017年 chenzhesi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShareUserInfo : NSObject

+ (instancetype)shareUserInfo;

@property (nonatomic ,strong) NSString *userName;
@property (nonatomic ,strong) NSNumber *userId;

@end
