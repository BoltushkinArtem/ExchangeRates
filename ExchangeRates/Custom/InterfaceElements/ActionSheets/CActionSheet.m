//
//  CActionSheet.m
//  ExchangeRates
//
//  Created by Artem Boltushkin on 30.08.16.
//  Copyright © 2016 ArtemBoltushkin. All rights reserved.
//

#import "CActionSheet.h"

@interface CActionSheet ()
{
    ASView *asView;
    UITapGestureRecognizer *tapGesture;
    UIView *superView;
}

@property (nonatomic , strong) id<CActionSheetDelegate> delegate;

@end

@implementation CActionSheet

- (CActionSheet*)initWithDelegate:(id<CActionSheetDelegate>)delegate {
    self = [super init];
    if (self) {
        self.delegate = delegate;
        tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tappedCancel)];
        asView = [ASView new];

    }
    return self;
}

- (void)showInView:(UIView *)view {
    superView = view;
    self.frame = (CGRect){CGPointZero, view.frame.size};
    
    asView.frame = (CGRect){{0, self.frame.size.height}, {self.frame.size.width, [self asViewHeight]}};
    asView.delegate = self;
    
    [self addSubview:asView];
    
    [view addSubview:self];
    
    [self animeData];
}

- (void)animeData{
    [self addGestureRecognizer:tapGesture];
    
    [UIView animateWithDuration:0.25f animations:^{
        asView.frame = (CGRect){{0, self.frame.size.height - asView.frame.size.height}, asView.frame.size};
    }];
}

- (void)tappedCancel{
    [self removeGestureRecognizer:tapGesture];
    
    [UIView animateWithDuration:.25 animations:^{
        asView.frame = (CGRect){{0, self.frame.size.height}, asView.frame.size};
    } completion:^(BOOL finished) {
        [asView removeFromSuperview];
        asView = nil;
        
        [self removeFromSuperview];
    }];
}

- (CGFloat)asViewHeight{
    return 263.f;
}

- (void)didSelectIndex:(NSInteger)index title:(NSString *)title {
    if ([(id)self.delegate respondsToSelector:@selector(didSelectIndex:title:)])
        [(id)self.delegate didSelectIndex:index title:title];
    
    [self tappedCancel];
}


@end
