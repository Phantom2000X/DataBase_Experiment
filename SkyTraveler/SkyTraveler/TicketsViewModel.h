//
//  TicketsViewModel.h
//  SkyTraveller
//
//  Created by PhantomX on 2017/5/11.
//  Copyright © 2017年 chenzhesi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TicketCellData.h"
#import "TicketsModel.h"

@interface TicketsViewModel : NSObject

@property (nonatomic ,strong) NSNumber *seletedIndex;
@property (nonatomic ,strong) NSString *pickupTime;
@property (nonatomic ,strong) NSString *pickupPlace;
@property (nonatomic ,strong) NSString *ticketId;
@property (nonatomic ,strong) NSMutableArray<TicketCellData *> *ticketsCellDatas;


- (instancetype)initWithTicketsFinishLoadBlock:(void (^)(void))tflb
                        finishedBuyTicketBlock:(void (^)(void))fbtb
                                orderFailBlock:(void (^)(void))ofb;
- (void)searchForTicketsWithDepartTime: (NSString *)dpt
                           departPlace: (NSString *)dpp
                           arrivePlace: (NSString *)arvp;
- (void)orderTicketWithIndexOfCell: (NSIndexPath *)idp;

@end
