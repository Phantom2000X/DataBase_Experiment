//
//  NetworkManager.h
//  ShowPay
//
//  Created by PhantomX on 2017/3/16.
//  Copyright © 2017年 PhantomX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetworkManagerDelegate.h"
#import <AFNetworking.h>

@interface NetworkManager : NSObject

@property(nonatomic, strong) AFHTTPSessionManager *manager;


+ (instancetype)networkManager;
- (void)connectServerWithPathString:(NSString *)pt JSONDictionary:(NSDictionary *)dictionary returnDataWithBlock: (void (^)(NSData *)) rDB;
+ (NSURL *)getImageURLWithString:(NSString *)str;

@end
