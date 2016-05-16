//
//  UINavigationController+XGTracking.m
//  XGEssentials
//  https://github.com/xtinger/XGEssentials
//
//  Created by Denis Voronov on 20/01/15.
//

#import "UINavigationController+XGTracking.h"
#import "XGRuntimeHelper.h"

@implementation UINavigationController (XGTracking)

+ (void)load {
#ifdef CONTROLLER_TRACKING_ENABLED
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [EFLRuntimeHelper swizzleMethods:[self class] :@selector(popViewControllerAnimated:) :@selector(swizzled_popViewControllerAnimated:)];
        [EFLRuntimeHelper swizzleMethods:[self class] :@selector(pushViewController:animated:) :@selector(swizzled_pushViewController:animated:)];
    });
#endif
}

#pragma mark - Method Swizzling

- (void)swizzled_popViewControllerAnimated:(BOOL)animated {
    [self swizzled_popViewControllerAnimated:animated];
//    NSLog(@"POP << NAV_CONTROLLER(%ld)", (long)(self.viewControllers ? self.viewControllers.count : 0));
}

- (void)swizzled_pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    [self swizzled_pushViewController:viewController animated:animated];
//    NSLog(@"PUSH >> NAV_CONTROLLER(%ld) : %@", (long)self.viewControllers.count, viewController);
}


@end
