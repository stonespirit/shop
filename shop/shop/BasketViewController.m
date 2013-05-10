//
//  SecondViewController.m
//  shop
//
//  Created by Деяров Руслан on 5/8/13.
//  Copyright (c) 2013 Деяров Руслан. All rights reserved.
//

#import "BasketViewController.h"
#import "Goods.h"

@interface BasketViewController ()

@end

@implementation BasketViewController

static NSString *cellIdentifier = @"cell";

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

#pragma mark -
#pragma mark UITableViewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
  return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return [Goods count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  
  UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
  cell.textLabel.text = [[[Goods all] objectAtIndex: indexPath.row] title];
  return cell;
}

- (void) reload
{
  NSMutableArray *old_rows = [NSMutableArray new];
  
  for (NSInteger i = 0; i < [self.tableView numberOfRowsInSection:0]; ++i)
  {
    [old_rows addObject:[NSIndexPath indexPathForRow:i inSection:0]];
  }
  
  NSMutableArray *new_rows = [NSMutableArray new];
  
  for (NSInteger i = 0; i < [Goods count]; ++i)
  {
    [new_rows addObject:[NSIndexPath indexPathForRow:i inSection:0]];
  }
  
  [self.tableView beginUpdates];
  [self.tableView deleteRowsAtIndexPaths:old_rows withRowAnimation:UITableViewRowAnimationNone];
  [self.tableView insertRowsAtIndexPaths:new_rows withRowAnimation:UITableViewRowAnimationNone];
  [self.tableView endUpdates];
  
}

- (void)viewWillAppear:(BOOL)animated {
  [self reload];
}

-(IBAction)dropAllGoods
{
  [Goods removeAll];
  [self reload];
}

#pragma mark -
#pragma mark Memory Management

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
}

@end
