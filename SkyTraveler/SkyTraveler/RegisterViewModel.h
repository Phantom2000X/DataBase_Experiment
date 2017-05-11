//
//  RegisterViewModel.h
//  SkyTraveler
//
//  Created by PhantomX on 2017/5/10.
//  Copyright © 2017年 chenzhesi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RegisterModel.h"

@interface RegisterViewModel : NSObject

- (instancetype)initWithFailResultBlock:(void (^)(NSString *))frb successBlock:(void (^)(void))sb;
- (void)registerWithUserName: (NSString *)usn withPassword: (NSString *)psw withComfirmPassword: (NSString *)cpsw;

@end
