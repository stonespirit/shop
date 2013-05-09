//
//  DetailGoodViewController.h
//  shop
//
//  Created by Деяров Руслан on 5/8/13.
//  Copyright (c) 2013 Деяров Руслан. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailGoodViewController : UIViewController {
  NSDictionary *good;
  IBOutlet UILabel *_price_label;
  IBOutlet UILabel *_description_label;
}

@property (nonatomic, strong) NSDictionary *good;
@end
