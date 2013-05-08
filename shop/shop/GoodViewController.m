//
//  FirstViewController.m
//  shop
//
//  Created by Деяров Руслан on 5/8/13.
//  Copyright (c) 2013 Деяров Руслан. All rights reserved.
//

#import "GoodViewController.h"

@interface GoodViewController ()

@end

@implementation GoodViewController

static NSString *cellIdentifier = @"cell";

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
  return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  //set UITableView
//  [VariableStore sharedInstance].logsTableView = tableView;
//  
//  if ([VariableStore sharedInstance].logs == nil) {
//    return 0;
//  } else {
//    return [[VariableStore sharedInstance].logs count];
//  }
  return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  
  UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
  
  //отключаем выделение ячеек
  //cell.selectionStyle = UITableViewCellSelectionStyleNone;
  cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
  
  //cell.textLabel.text = [[[VariableStore sharedInstance].logs objectAtIndex: indexPath.row] objectForKey:@"socket_name"];
  
  return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

  NSLog(@"select");
  
  DetailGoodViewController* controller = [DetailGoodViewController new];
  //[[self presentViewController:viewController animated:YES];
  controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
  
   [self presentViewController:controller animated:YES completion:nil];
  
}

@end
