//
//  ScheduleDateCell.h
//  Reservation
//
//  Created by Shiva Sai Rudra on 01/02/17.
//  Copyright © 2017 Shiva. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScheduleDateCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *lblDayOfTheWeek;
@property (weak, nonatomic) IBOutlet UILabel *lblDay;
-(void)selectCell;
@property (weak, nonatomic) IBOutlet UIView *selectedView;
@end
