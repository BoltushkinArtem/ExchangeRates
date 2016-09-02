//
//  NSString+Extensions.m
//  ExchangeRates
//
//  Created by Artem Boltushkin on 01.09.16.
//  Copyright © 2016 ArtemBoltushkin. All rights reserved.
//

#import "NSString+Extensions.h"

@implementation NSString (Extensions)

+ (BOOL)isNilOrEmpty:(NSString*)string
{
    BOOL result = NO;
    if (string == nil) {
        result = YES;
    } else if (string.length == 0) {
       result = YES;
    }
    
    return result;
}

@end
