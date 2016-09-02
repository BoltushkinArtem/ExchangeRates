//
//  ViewControllerModel.m
//  ExchangeRates
//
//  Created by Artem Boltushkin on 01.09.16.
//  Copyright © 2016 ArtemBoltushkin. All rights reserved.
//

#import "ViewControllerModel.h"
#import "RequestManager.h"
#import "CurrencyModel+Extension.h"
#import "NSDate+Transformation.h"
#import "OtherUtility.h"

#define TIME_FORMAT @"HH:mm"

@implementation ViewControllerModel

- (void)loadingDataForTitle:(NSString*)title block:(void (^)(NSString *currency, NSString *exchangeRate, NSString *message, NSString *update))block {
    [CurrencyUtility currencyForTitle:title block:^(Currency base, Currency secondary) {
        [self loadingData:title base:base secondary:secondary block:block];
    }];
}

- (void)loadingData:(NSString *)title base:(Currency)base secondary:(Currency)secondary block:(void (^)(NSString *currency, NSString *exchangeRate, NSString *message, NSString *update))block {
    [[RequestManager new] getYesterdayExchangeRate:base secondary:secondary block:^(CurrencyModel *yesterdayCurrencyModel) {
        [[RequestManager new] getTodayExchangeRate:base secondary:secondary block:^(CurrencyModel *todayCurrencyModel) {
            NSString *currency;
            NSString *exchangeRate;
            NSString *message;
            NSString *update;
            if (yesterdayCurrencyModel != nil && todayCurrencyModel != nil) {
                currency = title;
                
                exchangeRate = todayCurrencyModel.exchangeRateString;
                
                message = [self formationMessageString:todayCurrencyModel.base
                                                  yesterdayValue:[yesterdayCurrencyModel.exchangeRateNumber floatValue]
                                                      todayValue:[todayCurrencyModel.exchangeRateNumber floatValue]];
                
                update = [NSString stringWithFormat:NSLocalizedString(@"update_in", nil), [[NSDate new] dateToString:TIME_FORMAT]];
                
                block(currency, exchangeRate, message, update);
            }
        }];
    }];
}

- (NSString*)formationMessageString:(NSString*)currency yesterdayValue:(float)yesterdayValue todayValue:(float)todayValue {
    NSString *messageString;
    NSString *currencyString = [CurrencyUtility getLocalizedStringForTitle:currency];
    NSInteger percent = [self formationPercent:yesterdayValue todayValue:todayValue];
    if (percent == 0) {
        messageString = [NSString stringWithFormat:NSLocalizedString(@"exchange_rate_not_changed", nil), currencyString];
    } else {
        NSString *rateState;
        if (yesterdayValue < todayValue) {
            rateState = NSLocalizedString(@"up", nil);
        } else {
            rateState = NSLocalizedString(@"fell", nil);
        }
        
        NSString *percent_form_kay = [NSString stringWithFormat:@"percent_form_%li", (long)[OtherUtility pluralForm:percent]];
        NSString *percentString = NSLocalizedString(percent_form_kay, nil);
        
        messageString = [NSString stringWithFormat:NSLocalizedString(@"exchange_rate", nil), currencyString, rateState, percent, percentString];
    }
    
    return messageString;
}

- (NSInteger)formationPercent:(float)yesterdayValue todayValue:(float)todayValue {
    NSInteger resultPercent;
    
    if (yesterdayValue == todayValue) {
        resultPercent = 0;
    } else {
        double percent;
        if (yesterdayValue < todayValue) {
            percent = (todayValue - yesterdayValue) / yesterdayValue * 100;
        } else {
            percent = (yesterdayValue - todayValue) / yesterdayValue * 100;
        }
        
        NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
        [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
        [formatter setGroupingSeparator:@""];
        [formatter setMaximumFractionDigits:0];
        
        resultPercent = [[formatter numberFromString:[formatter stringFromNumber:@(percent)]] integerValue];
    }
    
    return resultPercent;
}

@end
