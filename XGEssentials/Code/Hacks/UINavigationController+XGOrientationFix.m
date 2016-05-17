//
//  UINavigationController+XGOrientationFix.m
//  XGEssentials
//  https://github.com/xtinger/XGEssentials
//
//  Created by Denis Voronov on 15/04/15.
//

#import "UINavigationController+XGOrientationFix.h"
@import ObjectiveC;

@implementation UINavigationController (XGOrientationFix)


+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self swizzleMethods:@selector(supportedInterfaceOrientations) :@selector(swizzled_supportedInterfaceOrientations)];
        [self swizzleMethods:@selector(shouldAutorotate) :@selector(swizzled_shouldAutorotate)];
    });
}

+ (void) swizzleMethods: (SEL)originalSelector :(SEL) swizzledSelector {
    Class class = [self class];
    
    // When swizzling a class method, use the following:
    // Class class = object_getClass((id)self);
    
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    
    BOOL didAddMethod =
    class_addMethod(class,
                    originalSelector,
                    method_getImplementation(swizzledMethod),
                    method_getTypeEncoding(swizzledMethod));
    
    if (didAddMethod) {
        class_replaceMethod(class,
                            swizzledSelector,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}


#pragma mark - Method Swizzling

- (BOOL)swizzled_shouldAutorotate {
    [self swizzled_shouldAutorotate];
    if (self.visibleViewController) {
        return [self.visibleViewController shouldAutorotate];
    } else {
        return YES;
    }
}

- (NSUInteger)swizzled_supportedInterfaceOrientations {
    [self swizzled_supportedInterfaceOrientations];
    
    if (self.visibleViewController) {
        return [self.visibleViewController supportedInterfaceOrientations];
    } else {
        return UIInterfaceOrientationMaskPortrait;
    }
}


@end
