//
//  FirstViewController.h
//  shop
//
//  Created by Деяров Руслан on 5/8/13.
//  Copyright (c) 2013 Деяров Руслан. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailGoodViewController.h"
#import "EGORefreshTableHeaderView.h"

@interface GoodViewController : UITableViewController <EGORefreshTableHeaderDelegate, UITableViewDelegate, UITableViewDataSource> {
  
  EGORefreshTableHeaderView *_refreshHeaderView;
  
  //  Reloading var should really be your tableviews datasource
  //  Putting it here for demo purposes
  BOOL _reloading;
  NSArray *_goods;
}

- (void)reloadTableViewDataSource;
- (void)doneLoadingTableViewData;
@end
