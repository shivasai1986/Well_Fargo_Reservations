//
//  ScheduleViewController.h
//  Reservation
//
//  Created by Shiva Sai Rudra on 01/02/17.
//  Copyright © 2017 Shiva. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScheduleViewController : UIViewController<UICollectionViewDataSource, UICollectionViewDelegate, UIPickerViewDelegate, UIPickerViewDataSource>
- (IBAction)btnReserve_TouchUpInside:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *btnPartySize;
- (IBAction)btnPartySize_TouchUpInside:(id)sender;
@property (weak, nonatomic) IBOutlet UIPickerView *partySizePickerView;
@property (weak, nonatomic) IBOutlet UIView *pickerButtonView;
- (IBAction)btnCancelPickerView:(id)sender;
- (IBAction)btnDonePickerView:(id)sender;
@property (nonatomic, strong) NSString *ServiceName;
@end
