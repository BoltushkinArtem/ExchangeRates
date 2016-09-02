//
//  OtherUtility.m
//  ExchangeRates
//
//  Created by Artem Boltushkin on 01.09.16.
//  Copyright © 2016 ArtemBoltushkin. All rights reserved.
//

#import "OtherUtility.h"

@implementation OtherUtility

+ (NSInteger)pluralForm:(NSInteger)n
{
    //	One - 1, 21, 31, ...
    //	Some - 2-4, 22-24, 32-34, ...
    //	Many - 5-20, 25-30, ...
    NSInteger n10 = n % 10;
    if ((n10 == 1) && ((n == 1) || (n > 20))) {
        return 0;
    }
    else if ((n10 > 1) && (n10 < 5) && ((n > 20) || (n < 10)))
    {
        return 1;
    }
    else {
        return 2;
    }
}

@end
