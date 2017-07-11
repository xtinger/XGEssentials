//
//  XGRotatingImageAnimation.h
//  MeetingAt
//
//  Created by Denis Voronov on 25/03/16.
//  Copyright © 2016 Emanor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XGActivityIndicatorAnimationProtocol.h"

@interface XGRotatingImageAnimation : NSObject<XGActivityIndicatorAnimationProtocol>

@property (nonatomic) BOOL clockwise;
@property (nonatomic) BOOL withScaleAnimation;
@property (nonatomic, strong) UIImage* image;

@end
