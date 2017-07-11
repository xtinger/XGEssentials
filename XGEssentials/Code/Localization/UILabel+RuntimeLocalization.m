//
//  UILabel+RuntimeLocalization.m
//  MeetingAt
//
//  Created by Denis Voronov on 29/04/15.
//  Copyright (c) 2015 Emanor Finance Limited. All rights reserved.
//

#import "UILabel+RuntimeLocalization.h"
#import "Localizator.h"

@implementation UILabel (RuntimeLocalization)

- (void) setLocText:(NSString *)locText {
    self.text = Localized(locText);
}

- (NSString*) locText {
    return nil;
}

- (void) setLocTitle:(NSString *)locTitle {
    XGLogDebug(@"UIButton's title writing to UILabel. Localized(Code = %@)",locTitle);
}

- (NSString*) locTitle {
    return nil;
}

@end
