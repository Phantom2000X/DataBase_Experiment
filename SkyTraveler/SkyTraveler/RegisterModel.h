//
//  RegisterModel.h
//  SkyTraveler
//
//  Created by PhantomX on 2017/5/10.
//  Copyright © 2017年 chenzhesi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetworkManager.h"

@interface RegisterModel : NSObject <NetworkManagerDelegate>

- (instancetype)initRegisterModelWithResultBlock: (void(^)(BOOL, NSString *))rb;
- (void)registerWithUserName: (NSString *)usn withPassword: (NSString *)psw;

@end
