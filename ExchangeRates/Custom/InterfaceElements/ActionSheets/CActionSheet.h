//
//  CActionSheets.h
//  ExchangeRates
//
//  Created by Artem Boltushkin on 30.08.16.
//  Copyright © 2016 ArtemBoltushkin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASView.h"

@protocol CActionSheetDelegate <NSObject>

-(void)didSelectIndex:(NSInteger)index title:(NSString *)title;

@end

@interface CActionSheet : UIView <ASViewDelegate>

- (CActionSheet*)initWithDelegate:(id<CActionSheetDelegate>)delegate;

- (void)showInView:(UIView*)view;

@end
