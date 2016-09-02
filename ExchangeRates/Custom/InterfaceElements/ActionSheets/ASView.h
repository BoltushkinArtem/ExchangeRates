//
//  ASView.h
//  ExchangeRates
//
//  Created by Artem Boltushkin on 30.08.16.
//  Copyright © 2016 ArtemBoltushkin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ASViewDelegate <NSObject>

-(void)didSelectIndex:(NSInteger)index title:(NSString*)title;

@end

IB_DESIGNABLE
@interface ASView : UIView

@property (nonatomic , strong) id<ASViewDelegate> delegate;

@end
