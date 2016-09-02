//
//  NSDate+Transformation.m
//  ExchangeRates
//
//  Created by Artem Boltushkin on 31.08.16.
//  Copyright © 2016 ArtemBoltushkin. All rights reserved.
//

#import "NSDate+Transformation.h"

@implementation NSDate (Transformation)

- (NSString*)dateToString:(NSString*)dateFormat {
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:dateFormat];
    
    NSString *dateString;
    @try {
        dateString = [format stringFromDate:self];
    } @catch (NSException *exception) {
        dateString = nil;
    }
    return dateString;
}

- (NSDate*)subtractNumberDays:(NSInteger)numberDays
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:self];
    [components setDay:components.day - numberDays];
    return [calendar dateFromComponents:components];
}

+ (NSDate*)dateFromString:(NSString*)string dateFormat:(NSString*)dateFormat {
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:dateFormat];
    
    NSDate *date;
    @try {
        date = [format dateFromString:string];
    } @catch (NSException *exception) {
        date = nil;
    }
    return date;
}

@end
