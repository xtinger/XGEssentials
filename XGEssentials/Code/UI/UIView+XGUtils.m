//
//  UIView+XGUtils.m
//  XGEssentials
//  https://github.com/xtinger/XGEssentials
//
//  Created by Dennis Voronov on 11/21/12.
//

@import QuartzCore;
#import "CoreText/CoreText.h"
#import "UIView+XGUtils.h"
#import "XGEssentialsDefines.h"

@implementation UIView (XGUtils)

- (UIImage*)imageRepresentation {
    
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, self.window.screen.scale);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage* ret = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return ret;

}

- (void) setX:(float)x
{
    self.frame = CGRectMake(x, self.frame.origin.y, self.frame.size.width, self.frame.size.height);
}

- (float) x {
    return self.frame.origin.x;
}

- (void) setY:(float)y
{
    self.frame = CGRectMake(self.frame.origin.x, y, self.frame.size.width, self.frame.size.height);
}

- (float) y {
    return self.frame.origin.y;
}

- (void) setWidth:(float)width
{
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, width, self.frame.size.height);
}

- (float) width {
    return self.frame.size.width;
}

- (void) setHeight:(float)height
{
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, height);
}

- (float) height {
    return self.frame.size.height;
}

- (float) bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void) setPos:(CGPoint)pos {
    self.frame = CGRectMake(pos.x, pos.y, self.frame.size.width, self.frame.size.height);
}

- (CGPoint) pos {
    return (CGPoint) {self.frame.origin.x, self.frame.origin.y};
}

- (void) setVisible:(BOOL)visible {
    self.hidden = !visible;
}

- (BOOL) visible {
    return !self.hidden;
}

- (void) setVisibleAnimated :(BOOL)visible {
    if (visible)
        [self showAnimated:NULL];
    else
        [self hideAnimated:NULL];
}

+ (void) transitionWithView:(UIView *)view duration:(NSTimeInterval)duration options:(UIViewAnimationOptions)options animations:(void (^)(void))animations
{
    [UIView transitionWithView:view duration:duration options:options animations:animations completion:NULL];
}

+ (void) animateWithDuration:(NSTimeInterval)duration delay:(NSTimeInterval)delay options:(UIViewAnimationOptions)options animations:(void (^)(void))animations {
    [UIView animateWithDuration:duration delay:delay options:options animations:animations completion:NULL];
}

- (void) addSubviewAnimated :(UIView*) view {
    view.hidden = YES;
    [self addSubview:view];
    [view showAnimated:nil];
}

- (void) removeFromSuperviewAnimated {
    [self hideAnimated:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (void) showAnimated :(void(^)(BOOL finished))completion :(float)duration :(float)delay :(float)toAlpha {
    [self showAnimated:completion :duration :toAlpha];
}

- (void) showAnimated :(void(^)(BOOL finished))completion :(float)duration :(float)toAlpha {
    if (self.hidden == NO && self.alpha == toAlpha)
        return;
    
//    DDLogInfo(@"showAnimated view: %@", self.description);
    
    self.alpha = 0;
    self.hidden = NO;
    [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         self.alpha = toAlpha;
                     }
                     completion:^(BOOL finished) {
                         if (completion)
                             completion(finished);
                     }];
}

- (void) showAnimated :(void(^)(BOOL finished))completion {
    [self showAnimated:completion :0.5 :1];
}

- (void) hideAnimated :(void(^)(BOOL finished))completion :(float) duration{
    [self hideAnimated:completion :duration :0];
}

- (void) hideAnimated :(void(^)(BOOL finished))completion :(float) duration :(float) delay{
    if (self.hidden) {
        if (completion)
            completion(YES);
        return;
    }
    
//    DDLogInfo(@"hideAnimated view: %@", self.description);
    
    self.hidden = NO;
    float alpha = self.alpha;
    [UIView animateWithDuration:duration delay:delay options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         self.alpha = 0;
                     }
                     completion:^(BOOL finished) {
                         if (finished) {
                             self.hidden = YES;
                             self.alpha = alpha;
                         }
                         if (completion)
                             completion(finished);
                     }];
}


- (void) hideAnimated :(void(^)(BOOL finished))completion{
    [self hideAnimated:completion :0.5];
}

- (CGRect) zeroPositionFrame {
    return CGRectMake(0, 0, self.width, self.height);
}

//- (BOOL)prefersStatusBarHidden
//{
//    return YES;
//}

// searches for subview in whole subhierarchy of view
- (BOOL) containsSubview :(UIView *) subView {

    for (UIView *view in self.subviews) {
        if (view == subView)
            return YES;
    }
    for (UIView *view in self.subviews) {
        if ([view containsSubview:subView])
            return YES;
    }
    return NO;
}

- (void) removeAllSubviews {
    while (self.subviews.count > 0) {
        UIView * sub = self.subviews[0];
        [sub removeFromSuperview];
    }
}

- (void) disableUserInteractionForTime : (float)duration {
    self.userInteractionEnabled = NO;
    RunBlockAfterDelay(duration, ^{
        self.userInteractionEnabled = YES;
    });
}

void RunBlockAfterDelay(NSTimeInterval delay, void (^block)(void))
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC*delay),
                   dispatch_get_main_queue(), block);
}

- (UIView *) topMostView {
    if (self.subviews.count == 0)
        return nil;
    return (self.subviews)[self.subviews.count - 1];
}


/**
 Draw text of 'text' string in given 'context' with given 'font' and 'center' point
 */
- (void) drawTextAtCenterPoint :(CGPoint)center text:(NSString *)text font:(UIFont*) font color:(UIColor *)color context:(CGContextRef) context {
    
    // CORE TEXT
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:text];
    CTFontRef userFont = CTFontCreateWithName((__bridge CFStringRef)font.fontName, font.pointSize, NULL);
    [string addAttribute:(id)kCTFontAttributeName
                   value:(__bridge id)userFont
                   range:NSMakeRange(0, string.length)];
    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"6.0")) {
        [string addAttribute:(id)NSForegroundColorAttributeName
                       value:color
                       range:NSMakeRange(0, string.length)];
    }
    CTLineRef line = CTLineCreateWithAttributedString((CFAttributedStringRef)string);
    
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef) string);
    CGSize textSize = CTFramesetterSuggestFrameSizeWithConstraints(framesetter, CFRangeMake(0,0), NULL, CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX), NULL);
    
    CGContextSetTextPosition(context, center.x - textSize.width / 2 , center.y + textSize.height / 2);
    CTLineDraw(line, context);
    
    // clean up
	CFRelease(line);
	CFRelease(userFont);
    CFRelease(framesetter);
    
    // CORE GRAPHICS
    /*
    CGContextSelectFont(context, font.fontName.UTF8String, font.pointSize, kCGEncodingMacRoman);
    const char *str = [text cStringUsingEncoding:[NSString defaultCStringEncoding]];
    CGSize size = [text sizeWithFont: font];
    CGContextSetTextDrawingMode(context, kCGTextFill);
    CGContextShowTextAtPoint(context, center.x - size.width / 2 + 1, center.y + 7, str, strlen(str));
     */
}

- (void) drawRectangleWithRoundedCorners :(CGContextRef) context :(CGRect)rect :(UIColor *) color :(CGFloat) radius {
//    CGContextSaveGState(context);
    if (radius > 0) {
        UIBezierPath * path = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:radius];
        CGContextAddPath(context, path.CGPath);
        CGContextSetFillColorWithColor(context, color.CGColor);
        CGContextFillPath(context);
    }
    else {
        CGContextFillRect(context, rect);
    }
//    CGContextRestoreGState(context);
}

+ (void) MakePathWithCorners :(CGContextRef) context :(CGRect) rect :(float[]) radius {
    CGContextBeginPath(context);
    CGContextAddArc(context, CGRectGetMaxX(rect) - radius[0], CGRectGetMinY(rect) + radius[0], radius[0], 3 * M_PI / 2, 0, 0);
    CGContextAddArc(context, CGRectGetMaxX(rect) - radius[1], CGRectGetMaxY(rect) - radius[1], radius[1], 0, M_PI / 2, 0);
    CGContextAddArc(context, CGRectGetMinX(rect) + radius[2], CGRectGetMaxY(rect) - radius[2], radius[2], M_PI / 2, M_PI, 0);
    CGContextAddArc(context, CGRectGetMinX(rect) + radius[3], CGRectGetMinY(rect) + radius[3], radius[3], M_PI, 3 * M_PI / 2, 0);
    CGContextClosePath(context);
}

@end

@implementation UIView (FindUIViewController)
- (UIViewController *) firstAvailableUIViewController {
    // convenience function for casting and to "mask" the recursive function
    return (UIViewController *)[self traverseResponderChainForUIViewController];
}

- (id) traverseResponderChainForUIViewController {
    id nextResponder = [self nextResponder];
    if ([nextResponder isKindOfClass:[UIViewController class]]) {
        return nextResponder;
    } else if ([nextResponder isKindOfClass:[UIView class]]) {
        return [nextResponder traverseResponderChainForUIViewController];
    } else {
        return nil;
    }
}
@end


