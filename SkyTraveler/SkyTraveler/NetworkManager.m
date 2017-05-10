
//
//  NetworkManager.m
//  ShowPay
//
//  Created by PhantomX on 2017/3/16.
//  Copyright © 2017年 PhantomX. All rights reserved.
//

#import "NetworkManager.h"

#define ServerURL "http://120.25.176.231:8880/"

@implementation NetworkManager

+ (void)connectServerWithPathString:(NSString *)pt JSONDictionary:(NSDictionary *)dictionary {
    id<NetworkManagerDelegate> delegate;
    NSString *urlString = [@ServerURL stringByAppendingString:pt];
    NSDictionary *jsonDictionary = [dictionary copy];
    NSURL *url = [[NSURL alloc] initWithString:urlString];
    NSError *jsonSerializationError;
    //NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:1000];
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:jsonDictionary
                                                       options:NSJSONWritingPrettyPrinted
                                                         error: &jsonSerializationError];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    request.HTTPMethod = @"POST";
    [request setHTTPBody:jsonData];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *uploadTask = [session dataTaskWithURL:url
                                              completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                                                  if (data) {
                                                      [delegate networkManagerReturnData:data];
                                                  }else{
                                                      NSLog(@"网络返回出现错误，请检查");
                                                  }
                                              }];
    [uploadTask resume];
    if (jsonSerializationError) {
        NSLog(@"JSON数据序列化出现错误，请检查传入内容是否包含不合法项");
    }
}

+ (NSURL *)getImageURLWithString:(NSString *)str {
    return [[NSURL alloc] initWithString:[@ServerURL stringByAppendingString:str]];
}

@end
