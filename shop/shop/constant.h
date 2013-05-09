//
//  constant.h
//  shop
//
//  Created by Deyarov Ruslan on 09.05.13.
//  Copyright (c) 2013 Деяров Руслан. All rights reserved.
//

#ifdef DEBUG
#   define DLog(fmt, ...) {NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);}
#   define ELog(err) {if(err) DLog(@"%@", err)}
#else
#   define DLog(...)
#   define ELog(err)
#endif

