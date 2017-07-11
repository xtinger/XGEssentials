//
//  UISearchBar+RuntimeLocalization.m
//  MeetingAt
//
//  Created by Denis Voronov on 07/05/15.
//  Copyright (c) 2015 Emanor Finance Limited. All rights reserved.
//

#import "UISearchBar+RuntimeLocalization.h"
#import "Localizator.h"

@implementation UISearchBar (RuntimeLocalization)

- (void) setLocPlaceholder:(NSString *)locPlaceholder {
    [self setPlaceholder:Localized(locPlaceholder)];
}

- (NSString*) locPlaceholder {
    return nil;
}

@end
