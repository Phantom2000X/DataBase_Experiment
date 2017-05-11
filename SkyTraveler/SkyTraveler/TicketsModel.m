//
//  TicketsModel.m
//  SkyTraveller
//
//  Created by PhantomX on 2017/5/11.
//  Copyright © 2017年 chenzhesi. All rights reserved.
//

#import "TicketsModel.h"

@implementation TicketsModel

- (void)searchForTicketsWithDepartTime:(NSString *)dpt departPlace:(NSString *)dpp arrivePlace:(NSString *)arvp {
    NSDictionary *dic = @{
                          @"Depart_Time" :dpt,
                          @"Depart_Place":dpp,
                          @"Arrive_Place":arvp
                          };
    [NetworkManager connectServerWithPathString:<#(NSString *)#> JSONDictionary:dic];
}

@end
