//
//  ShowUpAlert.h
//  SkyTraveller
//
//  Created by PhantomX on 2017/5/10.
//  Copyright © 2017年 chenzhesi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShowUpAlert : NSObject

+ (void)showLoadingAlertControllerWithController: (UIViewController *)vc;
+ (void)showWarningResultAlertControllerWithString: (NSString *)str withViewController: (UIViewController *) vc;

@end
