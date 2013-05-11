//
//  SecondViewController.h
//  shop
//
//  Created by Деяров Руслан on 5/8/13.
//  Copyright (c) 2013 Деяров Руслан. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BucketViewController : UITableViewController<UITableViewDelegate, UITableViewDataSource>

- (void) reload;
- (IBAction)dropAllGoods;

@end
