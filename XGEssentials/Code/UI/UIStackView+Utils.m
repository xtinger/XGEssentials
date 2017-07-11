//
//  UIStackView+Utils.m
//  MeetingAt
//
//  Created by Denis Voronov on 05/06/2017.
//  Copyright © 2017 Emanor. All rights reserved.
//

#import "UIStackView+Utils.h"

@implementation UIStackView (Utils)

- (void)setUseMinimalSpacing:(BOOL)useMinimalSpacing {
    if (useMinimalSpacing) {
        self.spacing = 1.0f / [UIScreen mainScreen].scale;
    }
}

- (BOOL)useMinimalSpacing{
    return self.spacing == 1.0f / [UIScreen mainScreen].scale;
}

@end
