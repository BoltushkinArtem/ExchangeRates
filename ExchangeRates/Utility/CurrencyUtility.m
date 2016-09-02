//
//  CurrencyUtility.m
//  ExchangeRates
//
//  Created by Artem Boltushkin on 31.08.16.
//  Copyright © 2016 ArtemBoltushkin. All rights reserved.
//

#import "CurrencyUtility.h"
#import "NSString+Extensions.h"

#define USD_STRING @"USD"
#define EUR_STRING @"EUR"
#define RUB_STRING @"RUB"

#define USD_RUB_STRING @"USD → RUB"
#define USD_EUR_STRING @"USD → EUR"
#define EUR_RUB_STRING @"EUR → RUB"
#define EUR_USD_STRING @"EUR → USD"
#define RUB_USD_STRING @"RUB → USD"
#define RUB_EUR_STRING @"RUB → EUR"

@implementation CurrencyUtility

+ (NSString*)getCurrencyString:(Currency)currency {
    NSString *currencyString;
    switch (currency) {
        case USD:
            currencyString = USD_STRING;
            break;
            
        case EUR:
            currencyString = EUR_STRING;
            break;
            
        case RUB:
            currencyString = RUB_STRING;
            break;
            
        default:
            currencyString = nil;
            break;
    }
    
    return currencyString;
}

+ (void)currencyForTitle:(NSString*)title block:(void (^)(Currency base, Currency secondary))block {
    Currency base = RUB;
    Currency secondary = RUB;
    
    if (![NSString isNilOrEmpty:title]) {
        if ([title isEqualToString:USD_RUB_STRING]) {
            base = USD;
            secondary = RUB;
        } else if ([title isEqualToString:USD_EUR_STRING]) {
            base = USD;
            secondary = EUR;
        } else if ([title isEqualToString:EUR_RUB_STRING]) {
            base = EUR;
            secondary = RUB;
        } else if ([title isEqualToString:EUR_USD_STRING]) {
            base = EUR;
            secondary = USD;
        } else if ([title isEqualToString:RUB_USD_STRING]) {
            base = RUB;
            secondary = USD;
        } else if ([title isEqualToString:RUB_EUR_STRING]) {
            base = RUB;
            secondary = EUR;
        }
    }
    
    block(base, secondary);
}

+ (NSString*)getLocalizedStringForTitle:(NSString*)title {
    NSString *localizedStrin;
    if (![NSString isNilOrEmpty:title]) {
        if ([title isEqualToString:USD_STRING]) {
            localizedStrin = NSLocalizedString(@"dollar", nil);
        } else if ([title isEqualToString:EUR_STRING]){
            localizedStrin = NSLocalizedString(@"euro", nil);
        } else if ([title isEqualToString:RUB_STRING]){
            localizedStrin = NSLocalizedString(@"ruble", nil);
        } else {
            localizedStrin = nil;
        }
    } else {
        localizedStrin = nil;
    }
    
    return localizedStrin;
}


@end
