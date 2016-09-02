//
//  CLabel.m
//  ExchangeRates
//
//  Created by Artem Boltushkin on 29.08.16.
//  Copyright © 2016 ArtemBoltushkin. All rights reserved.
//

#import "CLabel.h"

@interface CLabel ()
{
    CGFloat glSpacing;
}

@end

@implementation CLabel

- (void)setCFontName:(NSString *)cFontName {
    UIFont *font = self.font;
    self.font = [UIFont fontWithName:cFontName size:font.pointSize];
}

- (void)setSpacing:(CGFloat)spacing {
    glSpacing = spacing;
    NSMutableAttributedString* attrStr = [self.attributedText mutableCopy];
    [attrStr addAttribute:NSKernAttributeName value:@(spacing) range:NSMakeRange(0, attrStr.length)];
    
    self.attributedText = attrStr;
}

- (void)setText:(NSString *)text {
    super.text = text;
    
    self.spacing = glSpacing;
}

@end
