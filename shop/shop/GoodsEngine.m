//
//  GoodsEngine.m
//  shop
//
//  Created by Deyarov Ruslan on 09.05.13.
//  Copyright (c) 2013 Деяров Руслан. All rights reserved.
//

#import "GoodsEngine.h"

@implementation GoodsEngine

-(id) initWithDefaultSettings {
  
  if(self = [super initWithHostName:@"localhost" customHeaderFields:@{@"x-client-identifier" : @"iOS"}]) {
    self.portNumber = 3000;    
  }
  
  return self;
}

-(MKNetworkOperation*) loadWithCompletionHandler:(IDBlock) completionBlock {
  
  MKNetworkOperation *op = [self operationWithPath:@"goods"
                                            params:nil
                                        httpMethod:@"GET"];
  
  [op addCompletionHandler:^(MKNetworkOperation *completedOperation)
   {
     // the completionBlock will be called twice.
     // if you are interested only in new values, move that code within the else block
     
     NSString *valueString = [[completedOperation responseString] componentsSeparatedByString:@","][1];
     DLog(@"%@", valueString);
     
     if([completedOperation isCachedResponse]) {
       DLog(@"Data from cache %@", [completedOperation responseString]);
     }
     else {
       //DLog(@"Data from server %@", [completedOperation responseJSON]);
       completionBlock([completedOperation responseJSON]);
     }
     
     //completionBlock([valueString doubleValue]);
     
   }errorHandler:^(MKNetworkOperation *errorOp, NSError* error) {
     
     //errorBlock(error);
   }];
  
  [self enqueueOperation:op];
  
  return op;
}

@end
