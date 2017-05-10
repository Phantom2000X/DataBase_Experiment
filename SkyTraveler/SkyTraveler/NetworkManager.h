//
//  NetworkManager.h
//  ShowPay
//
//  Created by PhantomX on 2017/3/16.
//  Copyright © 2017年 PhantomX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetworkManagerDelegate.h"

@interface NetworkManager : NSObject

+ (void)connectServerWithPathString:(NSString *)pt JSONDictionary: (NSDictionary *)dictionary;
+ (NSURL *)getImageURLWithString:(NSString *)str;

@end
