//
//  XGRotatingImageAnimation.m
//  MeetingAt
//
//  Created by Denis Voronov on 25/03/16.
//  Copyright © 2016 Emanor. All rights reserved.
//

#import "XGRotatingImageAnimation.h"

@implementation XGRotatingImageAnimation

- (instancetype)init
{
    self = [super init];
    if (self) {
        _clockwise = YES;
        _withScaleAnimation = NO;
    }
    return self;
}

- (void)setupAnimationInLayer:(CALayer *)layer withSize:(CGSize)size tintColor:(UIColor *)tintColor {
    CGFloat duration = 1.5f;
    
    NSMutableArray* animations = [NSMutableArray array];
    
    // Rotate animation
    CAKeyframeAnimation *rotateAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation.z"];
    
    rotateAnimation.values = self.clockwise ? @[@0, @M_PI, @(2 * M_PI)] : @[@0, @(-M_PI), @(-2 * M_PI)];
    rotateAnimation.keyTimes = @[@0.0f, @0.5f, @1.0f];
    [animations addObject:rotateAnimation];
    
    if (self.withScaleAnimation) {
        CAKeyframeAnimation *scaleAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
        
        scaleAnimation.values = @[[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0f, 1.0f, 1.0f)],
                                  [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.6f, 0.6f, 1.0f)],
                                  [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0f, 1.0f, 1.0f)]];
        scaleAnimation.keyTimes = rotateAnimation.keyTimes;
        [animations addObject:scaleAnimation];
    }
    
    // Animation
    CAAnimationGroup *animation = [CAAnimationGroup animation];
    animation.animations = animations;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    animation.duration = duration;
    animation.repeatCount = HUGE_VALF;
    
    CALayer *imageLayer = [CALayer layer];
    imageLayer.contents = (id)[self.image CGImage];
    imageLayer.frame = CGRectMake((layer.bounds.size.width - size.width) / 2, (layer.bounds.size.height - size.height) / 2, size.width, size.height);
    [imageLayer addAnimation:animation forKey:@"animation"];
    [layer addSublayer:imageLayer];
    
    layer.opacity = 1;
}

@end
