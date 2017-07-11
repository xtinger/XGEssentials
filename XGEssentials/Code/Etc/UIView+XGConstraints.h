//
//  UIView+XGConstraints.h
//  MeetingAt
//
//  Created by Denis Voronov on 26/08/16.
//  Copyright © 2016 Emanor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (XGConstraints)

- (void)removeAllConstraints;

- (NSLayoutConstraint*)widthConstraint;
- (NSLayoutConstraint*)heightConstraint;
- (NSLayoutConstraint*)constraintForAttribute:(NSLayoutAttribute)attribute;
- (CGSize)sizeFromConstraints;
- (void)addFillSuperviewConstraints;

@end
