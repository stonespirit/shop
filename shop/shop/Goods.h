//
//  Goods.h
//  shop
//
//  Created by Deyarov Ruslan on 10.05.13.
//  Copyright (c) 2013 Деяров Руслан. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Goods : NSManagedObject

@property (nonatomic, retain) NSString * desc;
@property (nonatomic, retain) NSString * price;
@property (nonatomic, retain) NSString * title;

+ (int) countAllObjects;
+ (void) saveGood:(NSDictionary *)good;

@end
