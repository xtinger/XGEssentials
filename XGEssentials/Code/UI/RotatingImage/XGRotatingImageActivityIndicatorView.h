//
//  XGRotatingImageActivityIndicatorView.h
//  MeetingAt
//
//  Created by Denis Voronov on 25/03/16.
//  Copyright © 2016 Emanor. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XGActivityIndicatorAnimationProtocol.h"

@interface XGRotatingImageActivityIndicatorView : UIView

@property (nonatomic) BOOL clockwise;
@property (nonatomic) BOOL withScaleAnimation;

@property (nonatomic, strong) UIImage* image;
@property (nonatomic, strong) UIColor *tintColor;
@property (nonatomic) CGFloat size;
@property (nonatomic, readonly) BOOL animating;

- (id)initWithType:(UIImage*)image tintColor:(UIColor *)tintColor size:(CGFloat)size;

- (void)startAnimating;
- (void)stopAnimating;

@end
