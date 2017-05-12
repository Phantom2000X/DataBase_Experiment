//
//  CompleteViewController.h
//  SkyTraveller
//
//  Created by PhantomX on 2017/5/11.
//  Copyright © 2017年 chenzhesi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CompleteViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *departTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *arriveTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *departPlaceLabel;
@property (weak, nonatomic) IBOutlet UILabel *arrivePlaceLabel;
@property (weak, nonatomic) IBOutlet UILabel *companyNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *seatRemainLabel;
@property (weak, nonatomic) IBOutlet UILabel *seatTypeLabel;
@property (weak, nonatomic) IBOutlet UILabel *pickupPlaceLabel;
@property (weak, nonatomic) IBOutlet UILabel *pickupTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *ticketIdLabel;



@end
