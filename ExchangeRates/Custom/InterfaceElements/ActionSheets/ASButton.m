//
//  ASButton.m
//  ExchangeRates
//
//  Created by Artem Boltushkin on 29.08.16.
//  Copyright © 2016 ArtemBoltushkin. All rights reserved.
//

#import "ASButton.h"

@interface ASButton ()
{
    NSString *glDefaultFontName;
    NSString *glDownFontName;
}

@end

@implementation ASButton

- (void)setDefaultFontName:(NSString *)defaultFontName {
    glDefaultFontName = defaultFontName;
    UIFont *font = self.titleLabel.font;
    self.titleLabel.font = [UIFont fontWithName:defaultFontName size:font.pointSize];
}

- (NSString*)defaultFontName {
    return glDefaultFontName;
}

- (void)setDownFontName:(NSString *)downFontName {
    glDownFontName = downFontName;
}

- (NSString*)downFontName {
    return glDownFontName;
}

- (void)setHighlighted:(BOOL)highlighted
{
    UIFont *font = self.titleLabel.font;
    if(highlighted) {
        self.titleLabel.font = [UIFont fontWithName:self.downFontName size:font.pointSize];
    } else {
        self.titleLabel.font = [UIFont fontWithName:self.defaultFontName size:font.pointSize];
    }
    [super setHighlighted:highlighted];
}

@end
