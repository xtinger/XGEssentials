//
//  EFLToastManager.h
//  MeetingAt
//
//  Created by Denis Voronov on 22/04/15.
//  Copyright (c) 2015 Emanor Finance Limited. All rights reserved.
//

@import Foundation;

#define TOAST_DEFAULT_FRAME (CGRect){0, 0, 320, 50}

@interface EFLToast : NSObject

+ (void)setupWithErrorTextColor:(UIColor*)errorTextColor errorColor:(UIColor*)errorColor messageTextColor:(UIColor*)messageTextColor messageErrorColor:(UIColor*)messageErrorColor;

+ (void)showMessageToastWithMessage :(NSString*) message inView:(UIView*)view;
+ (void)showErrorToastWithMessage :(NSString*) message inView:(UIView*)view;
+ (void)showMessageToastWithMessage :(NSString*) message inView:(UIView*)view withFrame:(CGRect)frame;
+ (void)showErrorToastWithMessage :(NSString*) message inView:(UIView*)view withFrame:(CGRect)frame;


@end
