//
//  UIViewController+XGTracking.m
//  XGEssentials
//  https://github.com/xtinger/XGEssentials
//
//  Created by Denis Voronov on 25/12/14.
//

#import "UIViewController+XGTracking.h"
#import "XGRuntimeHelper.h"

#define DDLogVerbose NSLog // TEMP

@implementation UIViewController (XGTracking)

+ (void)load {
#ifdef CONTROLLER_TRACKING_ENABLED
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [XGRuntimeHelper swizzleMethods:[self class] :@selector(viewWillAppear:) :@selector(swizzled_viewWillAppear:)];
//        [EFLRuntimeHelper swizzleMethods:@selector(viewDidAppear:) :@selector(swizzled_viewDidAppear:)];
    });
#endif
}

#pragma mark - Method Swizzling

- (NSString*) performNameInvocation {
    SEL selector = NSSelectorFromString(@"readableName");
    if ([[self class] respondsToSelector:selector]) {
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:
                                    [[self class] methodSignatureForSelector:selector]];
        invocation.selector = selector;
        invocation.target = [self class];
        [invocation invoke];
        NSString* returnValue;
        [invocation getReturnValue:&returnValue];
        return returnValue;
    }
    return nil;
}

- (void)swizzled_viewWillAppear:(BOOL)animated {
    [self swizzled_viewWillAppear:animated];
    NSString* readable = [self performNameInvocation];
    if (readable) {
        DDLogVerbose(@"viewWillAppear: %@", readable);
    }
    else {
        DDLogVerbose(@"viewWillAppear: %@", self);
    }
}

- (void)swizzled_viewDidAppear:(BOOL)animated {
    [self swizzled_viewDidAppear:animated];
    DDLogVerbose(@"viewDidAppear: %@", self);
}

@end
