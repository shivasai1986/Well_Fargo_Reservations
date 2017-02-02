//
//  ReservationCell.h
//  Reservation
//
//  Created by Manoj Kumar Nelluri on 03/02/17.
//  Copyright © 2017 Shiva. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReservationCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lblDate;
@property (weak, nonatomic) IBOutlet UILabel *lblTime;
@property (weak, nonatomic) IBOutlet UILabel *lblServiceName;
@property (weak, nonatomic) IBOutlet UILabel *lblDuration;
@property (weak, nonatomic) IBOutlet UILabel *lblPartySize;
@property (weak, nonatomic) IBOutlet UILabel *lblDescription;

@end
