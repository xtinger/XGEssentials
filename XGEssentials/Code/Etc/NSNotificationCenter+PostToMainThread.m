//
//  NSNotificationCenter+PostToMainThread.m
//  MeetingAt
//
//  Created by Denis Voronov on 21/03/16.
//  Copyright © 2016 Emanor. All rights reserved.
//

#import "NSNotificationCenter+PostToMainThread.h"
#import "XGRunOnMainThread.h"

@implementation NSNotificationCenter (PostToMainThread)

- (void)postNotificationToMainThread:(NSNotification *)notification {
    if (![NSThread isMainThread]) {
        dispatch_sync(dispatch_get_main_queue(), ^{
            _Pragma("clang diagnostic push") _Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"")
            [self postNotificationToMainThread:notification];
        });
        return;
    };
    [self postNotification:notification];
}

- (void)postNotificationNameToMainThread:(NSString *)aName object:(nullable id)anObject {
    if (![NSThread isMainThread]) {
        dispatch_sync(dispatch_get_main_queue(), ^{
            _Pragma("clang diagnostic push") _Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"")
            [self postNotificationNameToMainThread:aName object:anObject];
        });
        return;
    };
    [self postNotificationName:aName object:anObject];
}

- (void)postNotificationNameToMainThread:(NSString *)aName object:(nullable id)anObject userInfo:(nullable NSDictionary *)aUserInfo {
    if (![NSThread isMainThread]) {
        dispatch_sync(dispatch_get_main_queue(), ^{
            _Pragma("clang diagnostic push") _Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"")
            [self postNotificationNameToMainThread:aName object:anObject userInfo:aUserInfo];
        });
        return;
    };
    [self postNotificationName:aName object:anObject userInfo:aUserInfo];
}

@end
