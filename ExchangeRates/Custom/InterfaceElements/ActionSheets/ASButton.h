//
//  ASButton.h
//  ExchangeRates
//
//  Created by Artem Boltushkin on 29.08.16.
//  Copyright © 2016 ArtemBoltushkin. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface ASButton : UIButton

@property (nonatomic) IBInspectable NSString *defaultFontName;
@property (nonatomic) IBInspectable NSString *downFontName;

@end
