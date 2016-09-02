//
//  ASView.m
//  ExchangeRates
//
//  Created by Artem Boltushkin on 30.08.16.
//  Copyright © 2016 ArtemBoltushkin. All rights reserved.
//

#import "ASView.h"
#import "ASButton.h"

#define DEFAULT_NIB_NAME @"ASView"

@interface ASView ()
{
    UIView *viewNib;
}
    
@end

@implementation ASView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initialization];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initialization];
    }
    return self;
}

- (UIView*)loadFromNib {
    NSBundle *bundel = [NSBundle bundleForClass:[self class]];
    UINib *nib = [UINib nibWithNibName:DEFAULT_NIB_NAME bundle:bundel];
    UIView *view;
    @try {
        view = (UIView*)[[nib instantiateWithOwner:self options:nil] firstObject];
    } @catch (NSException *e) {
        view = nil;
    }
    
    return view;
}

- (void)initialization {
    viewNib = [self loadFromNib];
    viewNib.frame = self.bounds;
    viewNib.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
    [self addSubview:viewNib];
}

- (IBAction)buttonTouch:(id)sender {
    ASButton *asButton = sender;
    if ([(id)self.delegate respondsToSelector:@selector(didSelectIndex:title:)])
        [(id)self.delegate didSelectIndex:asButton.tag title:asButton.titleLabel.text];
}

@end
