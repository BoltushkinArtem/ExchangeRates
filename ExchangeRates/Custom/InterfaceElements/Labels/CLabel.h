//
//  CLabel.h
//  ExchangeRates
//
//  Created by Artem Boltushkin on 29.08.16.
//  Copyright © 2016 ArtemBoltushkin. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface CLabel : UILabel

@property (nonatomic) IBInspectable NSString *cFontName;

@property (nonatomic) IBInspectable CGFloat spacing;

@end
