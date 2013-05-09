//
//  FirstViewController.m
//  shop
//
//  Created by Деяров Руслан on 5/8/13.
//  Copyright (c) 2013 Деяров Руслан. All rights reserved.
//

#import "GoodViewController.h"
#import "AppDelegate.h"

@interface GoodViewController ()

@end

@implementation GoodViewController

static NSString *cellIdentifier = @"cell";

- (void)viewDidLoad
{
  [super viewDidLoad];
  if (_refreshHeaderView == nil) {
    
		EGORefreshTableHeaderView *view = [[EGORefreshTableHeaderView alloc] initWithFrame:CGRectMake(0.0f, 0.0f - self.tableView.bounds.size.height, self.view.frame.size.width, self.tableView.bounds.size.height)];
		view.delegate = self;
		[self.tableView addSubview:view];
		_refreshHeaderView = view;
	}
  
	//  update the last update date
	[_refreshHeaderView refreshLastUpdatedDate];
  
  
  _goods = [NSArray new];
  
  [self loadGoods];
}

#pragma mark -
#pragma mark UITableViewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
  return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return [_goods count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  
  UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
  cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
  return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  [self performSegueWithIdentifier:@"detail" sender:self];
}

#pragma mark -
#pragma mark Data Source Loading / Reloading Methods

- (void)reloadTableViewDataSource{
  
	//  should be calling your tableviews data source model to reload
	//  put here just for demo
	_reloading = YES;
}

- (void)doneLoadingTableViewData{
  
	//  model should call this when its done loading
	_reloading = NO;
	[_refreshHeaderView egoRefreshScrollViewDataSourceDidFinishedLoading:self.tableView];
  [self loadGoods];
}

- (void)loadGoods{
  [ApplicationDelegate.goodsEngine loadWithCompletionHandler:^(NSArray *new_goods) {
    
    _old_goods_count = [_goods count];
    _goods = new_goods;
    [self reloadRowsWithOld:_old_goods_count andNewGoods: [_goods count]];
  } ];
}

- (void) reloadRowsWithOld:(NSInteger) old_goods_count andNewGoods:(NSInteger) new_goods_count
{
  
  NSMutableArray *old_rows = [NSMutableArray new];
  
  for (NSInteger i = 0; i < old_goods_count; ++i)
  {
    [old_rows addObject:[NSIndexPath indexPathForRow:i inSection:0]];
  }
  
  NSMutableArray *new_rows = [NSMutableArray new];
  
  for (NSInteger i = 0; i < new_goods_count; ++i)
  {
    [new_rows addObject:[NSIndexPath indexPathForRow:i inSection:0]];
  }
  
  [self.tableView beginUpdates];
  [self.tableView deleteRowsAtIndexPaths:old_rows withRowAnimation:UITableViewRowAnimationNone];
  [self.tableView insertRowsAtIndexPaths:new_rows withRowAnimation:UITableViewRowAnimationNone];
  [self.tableView endUpdates];
  
}

- (void) appendNewRows
{
  
  NSMutableArray *rows = [NSMutableArray new];
  
  for (NSInteger i = 0; i < [_goods count]; ++i)
  {
    [rows addObject:[NSIndexPath indexPathForRow:i inSection:0]];
  }
  
  [self.tableView beginUpdates];
  [self.tableView insertRowsAtIndexPaths:rows withRowAnimation:UITableViewRowAnimationNone];
  [self.tableView endUpdates];
}

#pragma mark -
#pragma mark UIScrollViewDelegate Methods

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
  
	[_refreshHeaderView egoRefreshScrollViewDidScroll:scrollView];
  
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
  
	[_refreshHeaderView egoRefreshScrollViewDidEndDragging:scrollView];
  
}


#pragma mark -
#pragma mark EGORefreshTableHeaderDelegate Methods

- (void)egoRefreshTableHeaderDidTriggerRefresh:(EGORefreshTableHeaderView*)view{
  
	[self reloadTableViewDataSource];
	[self performSelector:@selector(doneLoadingTableViewData) withObject:nil afterDelay:3.0];
  
}

- (BOOL)egoRefreshTableHeaderDataSourceIsLoading:(EGORefreshTableHeaderView*)view{
  
	return _reloading; // should return if data source model is reloading
  
}

- (NSDate*)egoRefreshTableHeaderDataSourceLastUpdated:(EGORefreshTableHeaderView*)view{
  
	return [NSDate date]; // should return date data source was last changed
  
}

#pragma mark -
#pragma mark Memory Management

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
	_refreshHeaderView=nil;
}

- (void)dealloc {
  
	_refreshHeaderView = nil;
}

@end
