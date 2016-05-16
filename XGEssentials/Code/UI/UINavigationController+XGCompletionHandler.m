//
//  UINavigationController+XGCompletionHandler.m
//  XGEssentials
//  https://github.com/xtinger/XGEssentials
//
//  Created by ChristianEnevoldsen on 10/08/14.
//  Copyright (c) 2014 Reversebox. All rights reserved.
//

#import "UINavigationController+XGCompletionHandler.h"
@import QuartzCore;

@implementation UINavigationController (XGCompletionHandler)
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated completion:(void (^)(void))completion {
    [CATransaction begin];
    [CATransaction setCompletionBlock:completion];
    [self pushViewController:viewController animated:animated];
    [CATransaction commit];
}

@end