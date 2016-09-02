//
//  RequestManager.h
//  ExchangeRates
//
//  Created by Artem Boltushkin on 31.08.16.
//  Copyright © 2016 ArtemBoltushkin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CurrencyUtility.h"
#import "CurrencyModel.h"

@interface RequestManager : NSObject

- (void)getYesterdayExchangeRate:(Currency)base secondary:(Currency)secondary block:(void (^)(CurrencyModel *yesterdayCurrencyModel))block;

- (void)getTodayExchangeRate:(Currency)base secondary:(Currency)secondary block:(void (^)(CurrencyModel *todayCurrencyModel))block;

@end
