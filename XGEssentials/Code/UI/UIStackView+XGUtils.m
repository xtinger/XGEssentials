//
//  UIStackView+XGUtils.m
//  MeetingAt
//
//  Created by Denis Voronov on 16/09/16.
//  Copyright © 2016 Emanor. All rights reserved.
//

#import "UIStackView+XGUtils.h"
#import "UIView+XGUtils.h"

@implementation UIStackView (XGUtils)

- (void)addArrangedSubviewWithDefaultDimension:(UIView *)view {
    if (self.axis == UILayoutConstraintAxisVertical) {
        [view.heightAnchor constraintEqualToConstant:view.height].active = true;
    }
    else {
        [view.widthAnchor constraintEqualToConstant:view.width].active = true;
    }
    [self addArrangedSubview:view];
}

@end
