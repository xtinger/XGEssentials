//
//  XGAppDelegate.m
//  XGEssentials
//
//  Created by Denis Voronov on 07/07/2017.
//  Copyright © 2017 Emanor. All rights reserved.
//

#import "XGAppDelegate.h"

@interface XGAppDelegate ()

@property (nonatomic, strong) NSArray<NSObject<XGAppDelegateBehaviorProtocol>*>* behaviors;

@end

@implementation XGAppDelegate

- (instancetype)init{
    self = [super init];
    
    if (self) {
        self.behaviors = [@[] mutableCopy];
    }
    
    return self;
}

- (void)addBehavior:(NSObject<XGAppDelegateBehaviorProtocol>*)behavior{
    self.behaviors = [self.behaviors arrayByAddingObject:behavior];
}

- (void)removeBehavior:(NSObject<XGAppDelegateBehaviorProtocol>*)behavior{
    NSMutableArray* mut = [self.behaviors mutableCopy];
    [mut removeObject:behavior];
    self.behaviors = mut;
}

- (void)applicationDidFinishLaunching:(UIApplication *)application {
    @synchronized(self.behaviors) {
        for (NSObject<XGAppDelegateBehaviorProtocol>* behavior in self.behaviors) {
            if (behavior.applicationDidFinishLaunchingBlock) {
                behavior.applicationDidFinishLaunchingBlock();
            }
        }
    }
}

#if UIKIT_STRING_ENUMS
- (BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(nullable NSDictionary<UIApplicationLaunchOptionsKey, id> *)launchOptions NS_AVAILABLE_IOS(6_0) {
    return YES;
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(nullable NSDictionary<UIApplicationLaunchOptionsKey, id> *)launchOptions NS_AVAILABLE_IOS(3_0) {
    return YES;
}
#else
- (BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(nullable NSDictionary *)launchOptions NS_AVAILABLE_IOS(6_0) {
    return YES;
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(nullable NSDictionary *)launchOptions NS_AVAILABLE_IOS(3_0) {
    @synchronized(self.behaviors) {
        for (NSObject<XGAppDelegateBehaviorProtocol>* behavior in self.behaviors) {
            if (behavior.applicationDidFinishLaunchingWithOptionsBlock) {
                behavior.applicationDidFinishLaunchingWithOptionsBlock(launchOptions);
            }
        }
    }
    return YES;
}
#endif

@end
