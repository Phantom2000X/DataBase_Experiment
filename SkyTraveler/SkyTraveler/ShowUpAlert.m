//
//  ShowUpAlert.m
//  SkyTraveller
//
//  Created by PhantomX on 2017/5/10.
//  Copyright © 2017年 chenzhesi. All rights reserved.
//

#import "ShowUpAlert.h"

@implementation ShowUpAlert

+ (void)showLoadingAlertControllerWithController: (UIViewController *)vc {
    UIAlertController *loadingAlertController = [UIAlertController alertControllerWithTitle:@"正在载入" message:@"\n\n\n\n\n\n\n\n\n\n" preferredStyle:UIAlertControllerStyleAlert];
    UIActivityIndicatorView *indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    CGAffineTransform transform = CGAffineTransformMakeScale(4.0f, 4.0f);
    indicatorView.transform = transform;
    [indicatorView startAnimating];
    [loadingAlertController.view addSubview:indicatorView];
    [indicatorView setFrame:CGRectMake(loadingAlertController.view.frame.size.width/2 - 53, 130.0, 0.0, 0.0)];
    [vc presentViewController:loadingAlertController animated:true completion:nil];
}

+ (void)showWarningResultAlertControllerWithString: (NSString *)str withViewController: (UIViewController *) vc {
    [[vc presentedViewController] dismissViewControllerAnimated:true completion:^{
        UIAlertController *resultAlertController = [UIAlertController alertControllerWithTitle:@"失败" message:str preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"确定" style: UIAlertActionStyleCancel handler:nil];
        [resultAlertController addAction:alertAction];
        [vc presentViewController:resultAlertController animated:true completion:nil];
    }];
}


@end
