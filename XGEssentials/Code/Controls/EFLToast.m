//
//  EFLToastManager.m
//  MeetingAt
//
//  Created by Denis Voronov on 22/04/15.
//  Copyright (c) 2015 Emanor Finance Limited. All rights reserved.
//

#import "EFLToast.h"
#import "XGFittingTextLabel.h"
#import "UIView+XGUtils.h"

#define LARGE_TOAST NO

static UIColor* eflToastErrorColor;
static UIColor* eflToastMessageColor;

static UIColor* eflToastErrorTextColor;
static UIColor* eflToastMessageTextColor;


@implementation EFLToast

+ (void) initialize {
    eflToastErrorTextColor = [UIColor whiteColor];
    eflToastErrorColor = [UIColor blackColor];
    eflToastMessageTextColor = [UIColor whiteColor];
    eflToastMessageColor = [UIColor redColor];
}

+ (void)setupWithErrorTextColor:(UIColor*)errorTextColor errorColor:(UIColor*)errorColor messageTextColor:(UIColor*)messageTextColor messageErrorColor:(UIColor*)messageErrorColor {
    eflToastErrorTextColor = errorTextColor;
    eflToastErrorColor = errorColor;;
    eflToastMessageTextColor = messageTextColor;
    eflToastMessageColor = messageErrorColor;
}

+ (void) showMessageToastWithMessage :(NSString*) message inView:(UIView*)view {
    [EFLToast p_showToastWithMessage:message inView:view withFrame:TOAST_DEFAULT_FRAME color:eflToastMessageColor textColor:eflToastMessageTextColor];
}

+ (void) showErrorToastWithMessage :(NSString*) message inView:(UIView*)view {
    [EFLToast p_showToastWithMessage:message inView:view withFrame:TOAST_DEFAULT_FRAME color:eflToastErrorColor textColor:eflToastErrorTextColor];
}

+ (void) showMessageToastWithMessage :(NSString*) message inView:(UIView*)view withFrame:(CGRect)frame {
    [EFLToast p_showToastWithMessage:message inView:view withFrame:frame color:eflToastMessageColor textColor:eflToastMessageTextColor];
}

+ (void) showErrorToastWithMessage :(NSString*) message inView:(UIView*)view withFrame:(CGRect)frame {
    [EFLToast p_showToastWithMessage:message inView:view withFrame:frame color:eflToastErrorColor textColor:eflToastErrorTextColor];
}

+ (void) p_showToastWithMessage :(NSString*) message inView:(UIView*)view withFrame:(CGRect)frame color:(UIColor*)color textColor:(UIColor*)textColor{
    
    // дали пустой фрейм - используем стандартный
    if (frame.size.width == 0 || frame.size.height == 0)
        frame = TOAST_DEFAULT_FRAME;
    
    if (view) {
        
        CGRect resultFrame = CGRectInset(SetHeight(frame, LARGE_TOAST ? 100: 50), 5, 5);
        // корректируем ширину
        SetWidth(resultFrame, MIN(resultFrame.size.width, view.width));
        XGFittingTextLabel* label = [[XGFittingTextLabel alloc] initWithFrame:resultFrame];
        
//        label.layer.borderColor = UICOLOR_GRAY(180).CGColor;
//        label.layer.borderWidth = 1;
//        label.layer.shadowRadius = 2;
//        label.layer.shadowColor = [UIColor blackColor].CGColor;
//        label.layer.shadowOpacity = 0.5f;
        label.layer.cornerRadius = 3.0f;
        label.layer.masksToBounds = YES;
        
        label.textAlignment = NSTextAlignmentCenter;
        label.backgroundColor = color;
        label.textColor = textColor;
        label.numberOfLines = 0;
        label.initialFont = [UIFont systemFontOfSize /*old HelveticaNeue Light*/ :16 weight:UIFontWeightLight];
        label.text = message;
        
        CGFloat initialScale = 0.65f;
        
        label.alpha = 0;
        label.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(initialScale, initialScale), CGAffineTransformMakeTranslation(0, -30));
        [view addSubview:label];
        
        float delay = 1.0f;
        float showDelay = 2.0f;
        
        [UIView animateWithDuration:0.15 delay:delay options:UIViewAnimationOptionCurveEaseInOut
                         animations:^{
                             label.alpha = 1;
                             label.transform = CGAffineTransformIdentity;
                         }
                         completion:^(BOOL finished) {
                             [UIView animateWithDuration:0.25 delay:delay + showDelay options:UIViewAnimationOptionCurveEaseInOut
                                              animations:^{
                                                  label.alpha = 0;
                                                  label.transform = CGAffineTransformMakeScale(initialScale, initialScale);
                                              }
                                              completion:^(BOOL finished) {
                                                  [label removeFromSuperview];
                                              }];
                         }];
    }
}

@end
