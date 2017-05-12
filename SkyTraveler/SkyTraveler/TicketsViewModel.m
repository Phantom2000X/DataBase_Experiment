//
//  TicketsViewModel.m
//  SkyTraveller
//
//  Created by PhantomX on 2017/5/11.
//  Copyright © 2017年 chenzhesi. All rights reserved.
//

#import "TicketsViewModel.h"

@implementation TicketsViewModel
{
    void (^ticketsFinishLoadBlock)(void);
    void (^finishedBuyTicketBlock)(void);
    void (^orderFailBlock)(void);
    TicketsModel *ticketModel;
    NSString *departPlace;
    NSString *arrivePlace;
}

- (instancetype)initWithTicketsFinishLoadBlock:(void (^)(void))tflb finishedBuyTicketBlock:(void (^)(void))fbtb orderFailBlock:(void (^)(void))ofb {
    if (self = [super init]) {
        ticketsFinishLoadBlock = tflb;
        finishedBuyTicketBlock = fbtb;
        orderFailBlock = ofb;
        _ticketsCellDatas = [NSMutableArray array];
        ticketModel = [[TicketsModel alloc] initWithTicketsFinishLoadBlock:^(NSArray *ary) {
            [self loadTicketsData:[ary copy]];
        } finishedBuyTicketBlock:^(NSDictionary *dic) {
            [self finishBuyTicket:dic];
        } orderFailBlock:^{
            orderFailBlock();
        }];
    }
    return self;
}

- (void)orderTicketWithIndexOfCell:(NSIndexPath *)idp {
    
}

- (void)searchForTicketsWithDepartTime:(NSString *)dpt departPlace:(NSString *)dpp arrivePlace:(NSString *)arvp {
    departPlace = dpp;
    arrivePlace = arvp;
    [ticketModel searchForTicketsWithDepartTime:dpp departPlace:dpt arrivePlace:arvp];
}

- (void)finishBuyTicket: (NSDictionary *)ticketInfo {
    
}

- (void)loadTicketsData: (NSArray<NSDictionary *> *)ticketsData {
    for (NSDictionary *dic in ticketsData) {
        TicketCellData *cellData = [[TicketCellData alloc] init];
        cellData.arrivePlace = arrivePlace;
        cellData.arriveTime = dic[@"Arrive_Time"];
        cellData.departPlace = departPlace;
        cellData.departTime = dic[@"Depart_Time"];
        cellData.companyName = dic[@"Company_Name"];
        cellData.seatType = dic[@"Seat_Type"];
        cellData.seatRemain = dic[@"Seat_Remain"];
        cellData.price = dic[@"price"];
        cellData.flightId = dic[@"Flight_Id"];
        [_ticketsCellDatas addObject:cellData];
    }
}

@end
