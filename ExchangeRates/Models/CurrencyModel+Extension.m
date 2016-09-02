//
//  CurrencyModel+Extension.m
//  ExchangeRates
//
//  Created by Artem Boltushkin on 31.08.16.
//  Copyright © 2016 ArtemBoltushkin. All rights reserved.
//

#import "CurrencyModel+Extension.h"

@implementation CurrencyModel (Extension)

- (NSString*)exchangeRateString {
    NSString *result;
    if (self.rates != nil && self.rates.count > 0) {
        
        NSNumber *value = self.rates.allValues[0];
        
        if (value != nil) {
            @try {
                result = [[self formatter] stringFromNumber:value];
            } @catch (NSException *exception) {
                result = nil;
            }
        }
    }
    return result;
}

- (NSNumber*)exchangeRateNumber {
    NSNumber *result;
    @try {
        result = [[self formatter] numberFromString:self.exchangeRateString];
    } @catch (NSException *exception) {
        result = nil;
    }
    return result;
}

- (NSNumberFormatter*)formatter {
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setGroupingSeparator:@""];
    [formatter setDecimalSeparator:@","];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    [formatter setMinimumFractionDigits:3];
    return formatter;
}

@end
