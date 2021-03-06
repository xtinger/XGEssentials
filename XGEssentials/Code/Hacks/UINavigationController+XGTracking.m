//
//  UINavigationController+XGTracking.m
//  XGEssentials
//  https://github.com/xtinger/XGEssentials
//
//  Created by Denis Voronov on 20/01/15.
//

#import "UINavigationController+XGTracking.h"
#import "XGRuntimeHelper.h"

#if TARGET_IPHONE_SIMULATOR
// logs all opening view controllers
//#define CONTROLLER_TRACKING_ENABLED // crashes
#endif

@implementation UINavigationController (XGTracking)

+ (void)load {
#ifdef CONTROLLER_TRACKING_ENABLED
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [XGRuntimeHelper swizzleMethods:[self class] :@selector(popViewControllerAnimated:) :@selector(swizzled_popViewControllerAnimated:)];
        [XGRuntimeHelper swizzleMethods:[self class] :@selector(pushViewController:animated:) :@selector(swizzled_pushViewController:animated:)];
    });
#endif
}

#pragma mark - Method Swizzling

- (void)swizzled_popViewControllerAnimated:(BOOL)animated {
    [self swizzled_popViewControllerAnimated:animated];
    NSLog(@"POP << NAV_CONTROLLER(%@) TOP: %@", @(self.viewControllers ? self.viewControllers.count : 0), self.topViewController);
}

- (void)swizzled_pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    [self swizzled_pushViewController:viewController animated:animated];
    NSLog(@"PUSH >> NAV_CONTROLLER(%@) : %@", @(self.viewControllers.count), viewController);
}


@end
