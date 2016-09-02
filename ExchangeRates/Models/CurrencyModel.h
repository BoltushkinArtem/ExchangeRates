//
//  CurrencyModel.h
//  ExchangeRates
//
//  Created by Artem Boltushkin on 30.08.16.
//  Copyright © 2016 ArtemBoltushkin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"

@interface CurrencyModel : JSONModel

@property (nonatomic) NSString *base;
@property (nonatomic) NSString *date;
@property (nonatomic) NSDictionary *rates;

@end
