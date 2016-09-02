//
//  NavigationManager.m
//  ExchangeRates
//
//  Created by Artem Boltushkin on 30.08.16.
//  Copyright © 2016 ArtemBoltushkin. All rights reserved.
//

#import "NetworkManager.h"
#import "AFNetworking.h"
#import "NSString+Extensions.h"

#define SERVER_URL @"http://api.fixer.io/latest"
#define DATE @"date"
#define CURRENCY_BASE_PARAMETERS @"base"
#define CURRENCY_SECONDARY_PARAMETERS @"symbols"



@implementation NetworkManager

- (void)getExchangeRate:(NSString*)date
                    base:(NSString*)base
               secondary:(NSString*)secondary
                   block:(void (^)(NSDictionary *data, NSError *error))block {
    NSDictionary *parameters = [self getCurrencyParameters:date base:base secondary:secondary];

    [[AFHTTPSessionManager manager] GET:SERVER_URL parameters:parameters progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        block(responseObject, nil);
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        block(nil, error);
    }];
}

- (NSDictionary*)getCurrencyParameters:(NSString*)date
                                  base:(NSString*)base
                             secondary:(NSString*)secondary {
    NSMutableDictionary *parameters = [NSMutableDictionary new];
    
    if (![NSString isNilOrEmpty:date]) {
        [parameters setValue:date forKey:DATE];
    }
    
    if (![NSString isNilOrEmpty:base]) {
        [parameters setValue:base forKey:CURRENCY_BASE_PARAMETERS];
    }
    
    if (![NSString isNilOrEmpty:secondary]) {
        [parameters setValue:secondary forKey:CURRENCY_SECONDARY_PARAMETERS];
    }
    
    if (parameters.count == 0) {
        parameters = nil;
    }
    
    return parameters;
}

@end
