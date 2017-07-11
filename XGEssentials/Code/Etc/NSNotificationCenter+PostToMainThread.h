//
//  NSNotificationCenter+PostToMainThread.h
//  MeetingAt
//
//  Created by Denis Voronov on 21/03/16.
//  Copyright © 2016 Emanor. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNotificationCenter (PostToMainThread)

- (void)postNotificationToMainThread:(nonnull NSNotification *)notification;

- (void)postNotificationNameToMainThread:(nonnull NSString *)aName object:(nullable id)anObject;

- (void)postNotificationNameToMainThread:(nonnull NSString *)aName object:(nullable id)anObject userInfo:(nullable NSDictionary *)aUserInfo;

@end
