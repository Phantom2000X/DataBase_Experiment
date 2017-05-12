
//
//  NetworkManager.m
//  ShowPay
//
//  Created by PhantomX on 2017/3/16.
//  Copyright © 2017年 PhantomX. All rights reserved.
//

#import "NetworkManager.h"

#define ServerURL "http://192.168.199.112:8080/Database_Experiment/MainServlet"

@implementation NetworkManager

static NetworkManager *_networkManager;
+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        _networkManager = [super allocWithZone:zone];

    });
    return _networkManager;
}

+ (instancetype)networkManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _networkManager = [[self alloc]init];
        _networkManager.manager = [AFHTTPSessionManager manager];
        _networkManager.manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    });
    return _networkManager;
}

- (id)copyWithZone:(NSZone *)zone {
    return _networkManager;
}

- (void)connectServerWithPathString:(NSString *)pt JSONDictionary:(NSDictionary *)dictionary returnDataWithBlock: (void (^)(NSData *)) rDB{
//    NSString *urlString = [@ServerURL stringByAppendingString:pt];
//    NSDictionary *jsonDictionary = [dictionary copy];
//    NSURL *url = [[NSURL alloc] initWithString:urlString];
//    NSError *jsonSerializationError;
//    //NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:1000];
//    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:jsonDictionary
//                                                       options:NSJSONWritingPrettyPrinted
//                                                         error: &jsonSerializationError];
//    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
//                                                           cachePolicy:NSURLRequestReloadIgnoringLocalCacheData
//                                                       timeoutInterval:10];
//    [request setHTTPMethod:@"POST"];
//    NSLog(@"%@", request.HTTPMethod);
//    [request setHTTPBody:jsonData];
//    NSURLSession *session = [NSURLSession sharedSession];
//    NSURLSessionDataTask *uploadTask = [session dataTaskWithURL:url
//                                              completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//                                                  if (data) {
//                                                      [delegate networkManagerReturnData:data];
//                                                  }else{
//                                                      NSLog(@"网络返回出现错误，请检查");
//                                                  }
//                                              }];
//    [uploadTask resume];
//    if (jsonSerializationError) {
//        NSLog(@"JSON数据序列化出现错误，请检查传入内容是否包含不合法项");
//    }

    [_manager POST:@ServerURL parameters:dictionary progress:^(NSProgress * _Nonnull uploadProgress) {
        
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSString *str = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        NSLog(@"%@", str);
        rDB(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"网络连接错误");
    }];
}

+ (NSURL *)getImageURLWithString:(NSString *)str {
    return [[NSURL alloc] initWithString:[@ServerURL stringByAppendingString:str]];
}

@end
