//
//  XGRotatingImageActivityIndicatorView.m
//  MeetingAt
//
//  Created by Denis Voronov on 25/03/16.
//  Copyright © 2016 Emanor. All rights reserved.
//

#import "XGRotatingImageActivityIndicatorView.h"
#import "XGRotatingImageAnimation.h"

@implementation XGRotatingImageActivityIndicatorView

- (id)initWithType:(UIImage*)image tintColor:(UIColor *)tintColor size:(CGFloat)size {
    self = [super init];
    if (self) {
        _image = image;
        _size = size;
        _tintColor = tintColor;
        self.userInteractionEnabled = NO;
        self.hidden = YES;
    }
    return self;
}


#pragma mark -
#pragma mark Methods

- (void)setupAnimation {
    self.layer.sublayers = nil;
    
    XGRotatingImageAnimation *ria = [XGRotatingImageAnimation new];
    ria.clockwise = self.clockwise;
    ria.withScaleAnimation = self.withScaleAnimation;
    ria.image = self.image;
    
    id<XGActivityIndicatorAnimationProtocol> animation = ria;

    if ([animation respondsToSelector:@selector(setupAnimationInLayer:withSize:tintColor:)]) {
        [animation setupAnimationInLayer:self.layer withSize:CGSizeMake(_size, _size) tintColor:_tintColor];
        self.layer.speed = 0.0f;
    }
}

- (id<XGActivityIndicatorAnimationProtocol>) animation {
    return nil;
}

- (void)setAlpha:(CGFloat)alpha {
    super.alpha = 1;
}

- (void)startAnimating {
    if (!self.layer.sublayers) {
        [self setupAnimation];
    }
    self.hidden = NO;
    self.layer.speed = 1.0f;
    _animating = YES;
}

- (void)stopAnimating {
    self.layer.speed = 0.0f;
    _animating = NO;
    self.hidden = YES;
}

- (void)setSize:(CGFloat)size {
    if (_size != size) {
        _size = size;
        
//        [self setupAnimation];
    }
}

- (void)setTintColor:(UIColor *)tintColor {
    if (![_tintColor isEqual:tintColor]) {
        _tintColor = tintColor;
        
        for (CALayer *sublayer in self.layer.sublayers) {
            sublayer.backgroundColor = tintColor.CGColor;
        }
    }
}

@end
