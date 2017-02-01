//
//  PageContentViewController.h
//  Reservation
//
//  Created by Shiva Sai Rudra on 01/02/17.
//  Copyright © 2017 Shiva. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PageContentViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;

@property NSUInteger pageIndex;
@property NSString *imageFile;

@end
