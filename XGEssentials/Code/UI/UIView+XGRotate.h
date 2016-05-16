//
//  UIView+XGRotate.h
//  XGEssentials
//  https://github.com/xtinger/XGEssentials
//
//  Created by Denis Voronov on 24/03/16.
//

@import UIKit;

@interface UIView (XGRotate)
- (void)rotate360WithDuration:(CGFloat)duration repeatCount:(float)repeatCount;
- (void)pauseAnimations;
- (void)resumeAnimations;
- (void)stopAllAnimations;
@end