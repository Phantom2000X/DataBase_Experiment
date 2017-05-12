//
//  OrderedTicketCellData.h
//  SkyTraveller
//
//  Created by PhantomX on 2017/5/11.
//  Copyright © 2017年 chenzhesi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OrderedTicketCellData : NSObject

@property (nonatomic ,strong) NSNumber *flightId;
@property (nonatomic ,strong) NSString *departPlace;
@property (nonatomic ,strong) NSString *departTime;
@property (nonatomic ,strong) NSString *arrivePlace;
@property (nonatomic ,strong) NSString *arriveTime;
@property (nonatomic ,strong) NSString *seatType;
@property (nonatomic ,strong) NSString *companyName;
@property (nonatomic ,strong) NSNumber *seatNumber;
@property (nonatomic ,strong) NSNumber *price;

@end
