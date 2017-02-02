//
//  ViewController.h
//  Reservation
//
//  Created by Shiva Sai Rudra on 31/01/17.
//  Copyright © 2017 Shiva. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIPageViewControllerDataSource, UIPageViewControllerDelegate, UITableViewDelegate>

@property (strong, nonatomic) UIPageViewController *pageViewController;
@property (strong, nonatomic) NSArray *pageImages;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (weak, nonatomic) IBOutlet UIButton *btnReserve;
@property (weak, nonatomic) IBOutlet UIView *tblServices;
- (IBAction)pageChanged:(id)sender;

@end

