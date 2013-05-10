//
//  Goods.m
//  shop
//
//  Created by Deyarov Ruslan on 10.05.13.
//  Copyright (c) 2013 Деяров Руслан. All rights reserved.
//

#import "Goods.h"


@implementation Goods

@dynamic desc;
@dynamic price;
@dynamic title;

+ (void) saveGood:(NSDictionary *)good
{
  NSManagedObjectContext *moc = [[VPPCoreData sharedInstance] createManagedObjectContext];
  Goods *g = [[VPPCoreData sharedInstance] getNewObjectForEntity:@"Goods" managedObjectContext:moc];

  
  g.title = [good objectForKey:@"title"];
  g.desc  = [good objectForKey:@"description"];
  g.price = [good objectForKey:@"price"];
  
  [[VPPCoreData sharedInstance] saveManagedObjectContext:moc error:NULL]; 
}

@end
