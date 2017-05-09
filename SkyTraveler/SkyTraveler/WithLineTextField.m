//
//  UITextFieldWithLine.m
//  ShowPay
//
//  Created by PhantomX on 2017/2/18.
//  Copyright © 2017年 PhantomX. All rights reserved.
//

#import "WithLineTextField.h"

@implementation WithLineTextField


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [UIColor colorWithRed:187.0/255.0 green:221.0/255.0 blue:211.0/255.0 alpha:1.0].CGColor);
    CGContextFillRect(context, CGRectMake(0, CGRectGetHeight(self.frame)-2, CGRectGetWidth(self.frame), 2));
}


@end
