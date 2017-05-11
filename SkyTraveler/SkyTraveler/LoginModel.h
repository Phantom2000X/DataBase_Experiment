//
//  LoginModel.h
//  SkyTraveler
//
//  Created by PhantomX on 2017/5/10.
//  Copyright © 2017年 chenzhesi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetworkManager.h"
#import "NetworkManagerDelegate.h"

@interface LoginModel : NSObject <NetworkManagerDelegate>

- (instancetype)initLoginModelWithResultBlock: (void(^)(BOOL, NSString *))rb;
- (void)loginWithUserName: (NSString *)usn withPassword: (NSString *)psw;

@end
