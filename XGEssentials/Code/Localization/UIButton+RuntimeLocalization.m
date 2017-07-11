//
//  UIButton+RuntimeLocalization.m
//  MeetingAt
//
//  Created by Denis Voronov on 05/05/15.
//  Copyright (c) 2015 Emanor Finance Limited. All rights reserved.
//

#import "UIButton+RuntimeLocalization.h"
#import "Localizator.h"

@implementation UIButton (RuntimeLocalization)

- (void) setLocTitle:(NSString *)locTitle {
    
    [self setTitle:Localized(locTitle) forState:UIControlStateNormal];
}

- (NSString*) locTitle {
    return nil;
}


- (void) setLocText:(NSString *)locTitle {
    self.locTitle = locTitle;
}

- (NSString*) locText {
    return nil;
}


@end
