//
//  GoodsEngine.h
//  shop
//
//  Created by Deyarov Ruslan on 09.05.13.
//  Copyright (c) 2013 Деяров Руслан. All rights reserved.
//
typedef void (^IDBlock)(NSArray *object);

#import "MKNetworkEngine.h"

@interface GoodsEngine : MKNetworkEngine
-(id) initWithDefaultSettings;

-(MKNetworkOperation*) loadGoods:(IDBlock) completionBlock;
-(MKNetworkOperation*) loadGood:(NSString*) good_id completion:(IDBlock) completionBlock;
@end
