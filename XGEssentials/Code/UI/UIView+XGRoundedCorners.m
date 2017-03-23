//
//  UIView+XGRoundedCorners.m
//  MeetingAt
//
//  Created by Denis Voronov on 19/12/2016.
//  Copyright © 2016 Emanor. All rights reserved.
//

#import "UIView+XGRoundedCorners.h"

@implementation UIView (XGRoundedCorners)

- (void)setCornerRadiusMask:(NSNumber *)cornerRadiusMask{
    self.layer.cornerRadius = cornerRadiusMask.floatValue;
    self.layer.masksToBounds = YES;
//    [self.layer setNeedsDisplay];
}

- (NSNumber*)cornerRadiusMask {
    XGLogError(@"cornerRadiusMask name not for fetch in view: %@", self);
    return nil;
}

@end
