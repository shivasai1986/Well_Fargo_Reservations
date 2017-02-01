//
//  ScheduleDateCell.m
//  Reservation
//
//  Created by Shiva Sai Rudra on 01/02/17.
//  Copyright © 2017 Shiva. All rights reserved.
//

#import "ScheduleDateCell.h"

@implementation ScheduleDateCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(id)init
{
    self = [super init];
    
    self.layer.borderColor = (__bridge CGColorRef _Nullable)([UIColor darkGrayColor]);
    
    return self;
}

@end
