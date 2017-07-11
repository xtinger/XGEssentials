//
//  NSLayoutConstraint+Utils.m
//  MeetingAt
//
//  Created by Denis Voronov on 05/06/2017.
//  Copyright © 2017 Emanor. All rights reserved.
//

#import "NSLayoutConstraint+Utils.h"

@implementation NSLayoutConstraint (Utils)

- (void)setUseMinimalConstantValue:(BOOL)useMinimalConstantValue{
    if (useMinimalConstantValue) {
        self.constant = 1.0f / [UIScreen mainScreen].scale;
    }
}

- (BOOL)useMinimalConstantValue {
    return self.constant <= 1.0f;
}

+ (CGFloat)minimalValue{
    return 1.0f / [UIScreen mainScreen].scale;
}

@end
