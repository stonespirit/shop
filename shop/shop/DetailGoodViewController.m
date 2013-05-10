//
//  DetailGoodViewController.m
//  shop
//
//  Created by Деяров Руслан on 5/8/13.
//  Copyright (c) 2013 Деяров Руслан. All rights reserved.
//

#import "DetailGoodViewController.h"
#import "AppDelegate.h"
#import "Goods.h"

@interface DetailGoodViewController ()

@end

@implementation DetailGoodViewController
@synthesize good = _good;

- (void)viewDidLoad
{
  [super viewDidLoad];
  self.title = [_good objectForKey:@"title"];
  [self loadGood];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (void)loadGood{
  [ApplicationDelegate.goodsEngine loadGood:[_good objectForKey:@"id"] completion:^(id new_good) {
    _price_label.text = [NSString stringWithFormat:@"Price: %@", [new_good objectForKey: @"price"]];
    _description_label.text = [NSString stringWithFormat:@"Description: %@", [new_good objectForKey: @"description"]];
    
    full_good = new_good;
  } ];
  
}

-(IBAction)putGoodInBasket
{
  if (full_good) {
    //DLog(@"good=%@", full_good);
      DLog(@"goods=%@", [Goods all]);
    
    [Goods saveGood:full_good];
    
      DLog(@"goods=%@", [Goods all]);
  } else {
    DLog(@"not_loaded yet");
  }
  


}

@end
