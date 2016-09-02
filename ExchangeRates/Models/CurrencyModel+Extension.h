//
//  CurrencyModel+Extension.h
//  ExchangeRates
//
//  Created by Artem Boltushkin on 31.08.16.
//  Copyright © 2016 ArtemBoltushkin. All rights reserved.
//

#import "CurrencyModel.h"

@interface CurrencyModel (Extension)

@property (assign, nonatomic, readonly) NSString *exchangeRateString;
@property (assign, nonatomic, readonly) NSNumber *exchangeRateNumber;

@end
