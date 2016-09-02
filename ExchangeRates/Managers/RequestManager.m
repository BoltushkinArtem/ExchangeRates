//
//  RequestManager.m
//  ExchangeRates
//
//  Created by Artem Boltushkin on 31.08.16.
//  Copyright © 2016 ArtemBoltushkin. All rights reserved.
//

#import "RequestManager.h"
#import "NetworkManager.h"
#import "CurrencyUtility.h"
#import "NSDate+Transformation.h"

#define DATE_FORMAT @"yyyy-MM-dd"

@implementation RequestManager

- (void)getYesterdayExchangeRate:(Currency)base secondary:(Currency)secondary block:(void (^)(CurrencyModel *yesterdayCurrencyModel))block {
    [[NetworkManager new] getExchangeRate:[[[NSDate new] subtractNumberDays:1] dateToString:DATE_FORMAT]
                                      base:[CurrencyUtility getCurrencyString:base]
                                 secondary:[CurrencyUtility getCurrencyString:secondary]
                                     block:^(NSDictionary *data, NSError *error) {
                                         CurrencyModel *currencyModel = [[CurrencyModel alloc] initWithDictionary:data error:nil];
                                         block(currencyModel);
                                     }];
}

- (void)getTodayExchangeRate:(Currency)base secondary:(Currency)secondary block:(void (^)(CurrencyModel *todayCurrencyModel))block {
    [[NetworkManager new] getExchangeRate:[[NSDate new] dateToString:DATE_FORMAT]
                                      base:[CurrencyUtility getCurrencyString:base]
                                 secondary:[CurrencyUtility getCurrencyString:secondary]
                                     block:^(NSDictionary *data, NSError *error) {
                                         CurrencyModel *currencyModel = [[CurrencyModel alloc] initWithDictionary:data error:nil];
                                         block(currencyModel);
                                     }];
}

@end
