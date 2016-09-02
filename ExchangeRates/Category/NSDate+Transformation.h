//
//  NSDate+Transformation.h
//  ExchangeRates
//
//  Created by Artem Boltushkin on 31.08.16.
//  Copyright © 2016 ArtemBoltushkin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Transformation)

- (NSString*)dateToString:(NSString*)dateFormat;

- (NSDate*)subtractNumberDays:(NSInteger)numberDays;

+ (NSDate*)dateFromString:(NSString*)string dateFormat:(NSString*)dateFormat;

@end
