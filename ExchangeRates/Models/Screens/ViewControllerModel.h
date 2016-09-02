//
//  ViewControllerModel.h
//  ExchangeRates
//
//  Created by Artem Boltushkin on 01.09.16.
//  Copyright © 2016 ArtemBoltushkin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ViewControllerModel : NSObject

- (void)loadingDataForTitle:(NSString*)title block:(void (^)(NSString *currency, NSString *exchangeRate, NSString *message, NSString *update))block;

@end
