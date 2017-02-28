//
//  NSBundle+XGUtils.m
//  XGEssentials
//  https://github.com/xtinger/XGEssentials
//
//  Created by Denis Voronov on 08/06/16.
//

#import "NSBundle+XGUtils.h"

@implementation NSBundle (XGUtils)

- (BOOL) isRunningInSandbox {
    NSURL *receiptURL = [self appStoreReceiptURL];
    NSString *receiptURLString = [receiptURL path];
    BOOL isRunningInSandbox = ([receiptURLString rangeOfString:@"sandboxReceipt"].location != NSNotFound);
    return isRunningInSandbox;
}

- (BOOL)isRunningInAppStoreEnvironment {
#if TARGET_OS_SIMULATOR
    return NO;
#else
    if ([self p_isAppStoreReceiptSandbox] || [self p_hasEmbeddedMobileProvision]) {
        return NO;
    }
    return YES;
#endif
}

- (BOOL)isRunningInAppExtension {
    static BOOL isRunningInAppExtension = NO;
    static dispatch_once_t checkAppExtension;
    
    dispatch_once(&checkAppExtension, ^{
        isRunningInAppExtension = ([[self executablePath] rangeOfString:@".appex/"].location != NSNotFound);
    });
    
    return isRunningInAppExtension;
}



- (BOOL)p_isAppStoreReceiptSandbox {
#if TARGET_OS_SIMULATOR
    return NO;
#else
    NSURL *appStoreReceiptURL = [self appStoreReceiptURL];
    NSString *appStoreReceiptLastComponent = appStoreReceiptURL.lastPathComponent;
    
    BOOL isSandboxReceipt = ([appStoreReceiptLastComponent rangeOfString:@"sandboxReceipt"].location != NSNotFound);
    return isSandboxReceipt;
#endif
}

- (BOOL)p_hasEmbeddedMobileProvision {
    BOOL hasEmbeddedMobileProvision = !![self pathForResource:@"embedded" ofType:@"mobileprovision"];
    return hasEmbeddedMobileProvision;
}

- (BOOL)p_isRunningInTestFlightEnvironment {
#if TARGET_OS_SIMULATOR
    return NO;
#else
    if ([self p_isAppStoreReceiptSandbox] && ![self p_hasEmbeddedMobileProvision]) {
        return YES;
    }
    return NO;
#endif
}




@end
