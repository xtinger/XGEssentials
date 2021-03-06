//
//  UIView+XGConstraints.m
//  MeetingAt
//
//  Created by Denis ; on 26/08/16.
//  Copyright © 2016 Emanor. All rights reserved.
//

#import "UIView+XGConstraints.h"

@implementation UIView (XGConstraints)

- (void)removeAllConstraints
{
    UIView *superview = self.superview;
    while (superview != nil) {
        for (NSLayoutConstraint *c in superview.constraints) {
            if (c.firstItem == self || c.secondItem == self) {
                [superview removeConstraint:c];
            }
        }
        superview = superview.superview;
    }
    
    [self removeConstraints:self.constraints];
    self.translatesAutoresizingMaskIntoConstraints = YES;
}

- (NSLayoutConstraint*)widthConstraint{
    return [self constraintForAttribute:NSLayoutAttributeWidth];
}

- (NSLayoutConstraint*)heightConstraint {
    return [self constraintForAttribute:NSLayoutAttributeHeight];
}

- (NSLayoutConstraint*)constraintForAttribute:(NSLayoutAttribute)attribute {
    NSLayoutConstraint *targetConstraint = nil;
    for (id constraint in self.constraints) {
        // проверяем что именно NSLayoutConstraint, NSContentSizeLayoutConstraint нам не нужны
        if ([constraint isMemberOfClass:[NSLayoutConstraint class]]) {
            NSLayoutConstraint* layoutConstraint = constraint;
            if (layoutConstraint.firstAttribute == attribute) {
                targetConstraint = layoutConstraint;
                break;
            }
        }
    }
    return targetConstraint;
}

- (CGSize)sizeFromConstraints {
    if (!self.translatesAutoresizingMaskIntoConstraints && self.widthConstraint && self.heightConstraint) {
        return CGSizeMake(self.widthConstraint.constant, self.heightConstraint.constant);
    }
    else {
        return self.frame.size;
    }
}

- (void)addFillSuperviewConstraints {
    UIView* parentView = self.superview;
    NSArray *constraintsV = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[view]|"
                                                                    options:0
                                                                    metrics:nil
                                                                      views:@{@"view":self}];
    NSArray *constraintsH = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[view]|"
                                                                    options:0
                                                                    metrics:nil
                                                                      views:@{@"view":self}];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    //    [view setAutoresizingMask:UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth ];
    [parentView addConstraints:constraintsV];
    [parentView addConstraints:constraintsH];
}

@end
