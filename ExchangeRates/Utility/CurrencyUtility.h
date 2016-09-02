//
//  CurrencyUtility.h
//  ExchangeRates
//
//  Created by Artem Boltushkin on 31.08.16.
//  Copyright © 2016 ArtemBoltushkin. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum { USD, EUR, RUB } Currency;

@interface CurrencyUtility : NSObject

+ (NSString*)getCurrencyString:(Currency)currency;

+ (void)currencyForTitle:(NSString*)title block:(void (^)(Currency base, Currency secondary))block;

+ (NSString*)getLocalizedStringForTitle:(NSString*)title;

@end
