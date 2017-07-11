//
//  UITextField+RuntimeLocalization.m
//  MeetingAt
//
//  Created by Denis Voronov on 07/05/15.
//  Copyright (c) 2015 Emanor Finance Limited. All rights reserved.
//

#import "UITextField+RuntimeLocalization.h"
#import "Localizator.h"

@implementation UITextField (RuntimeLocalization)

- (void) setLocPlaceholder:(NSString *)locPlaceholder {
    [self setPlaceholder:Localized(locPlaceholder)];
}

- (NSString*) locPlaceholder {
    return nil;
}

@end
