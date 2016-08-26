//
//  UIView+RemoveConstraints.m
//  MeetingAt
//
//  Created by Denis Voronov on 26/08/16.
//  Copyright © 2016 Emanor. All rights reserved.
//

@implementation UIView (XGRemoveConstraints)

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

@end