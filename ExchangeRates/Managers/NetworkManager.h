//
//  NavigationManager.h
//  ExchangeRates
//
//  Created by Artem Boltushkin on 30.08.16.
//  Copyright © 2016 ArtemBoltushkin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkManager : NSObject

- (void)getExchangeRate:(NSString*)date
                    base:(NSString*)base
               secondary:(NSString*)secondary
                   block:(void (^)(NSDictionary *data, NSError *error))block;

@end
