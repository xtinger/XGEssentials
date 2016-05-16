//
//  UIView+XGUtils.h
//  XGEssentials
//  https://github.com/xtinger/XGEssentials
//
//  Created by Dennis Voronov on 11/21/12.
//

@import UIKit;

@interface UIView (XGUtils)

@property (nonatomic, assign) float x;
@property (nonatomic, assign) float y;
@property (nonatomic, assign) float width;
@property (nonatomic, assign) float height;
@property (nonatomic, assign, readonly) float bottom;
@property (nonatomic, assign) CGPoint pos;
@property (nonatomic, readonly) UIView* topMostView;
@property (nonatomic, assign) BOOL visible;


@property (NS_NONATOMIC_IOSONLY, readonly, strong) UIImage *imageRepresentation;

- (void) addSubviewAnimated :(UIView*) view;
- (void) showAnimated :(void(^)(BOOL finished))completion;
- (void) showAnimated :(void(^)(BOOL finished))completion :(float)duration :(float)toAlpha;

- (void) removeFromSuperviewAnimated;
- (void) hideAnimated :(void(^)(BOOL finished))completion;
- (void) hideAnimated :(void(^)(BOOL finished))completion :(float) duration;
- (void) hideAnimated :(void(^)(BOOL finished))completion :(float) duration :(float) delay;

+ (void) transitionWithView:(UIView *)view duration:(NSTimeInterval)duration options:(UIViewAnimationOptions)options animations:(void (^)(void))animations;

+ (void) animateWithDuration:(NSTimeInterval)duration delay:(NSTimeInterval)delay options:(UIViewAnimationOptions)options animations:(void (^)(void))animations;

@property (NS_NONATOMIC_IOSONLY, readonly) CGRect zeroPositionFrame;

//- (BOOL)prefersStatusBarHidden;

- (void) setVisibleAnimated :(BOOL)visible;
// searches for subview in whole subhierarchy of view
- (BOOL) containsSubview :(UIView *) subView;
- (void) removeAllSubviews;
- (void) disableUserInteractionForTime : (float)duration;
- (void) drawTextAtCenterPoint :(CGPoint)center text:(NSString *)text font:(UIFont*) font color:(UIColor *)color context:(CGContextRef) context;
- (void) drawRectangleWithRoundedCorners :(CGContextRef) context :(CGRect)rect :(UIColor *) color :(CGFloat) radius ;
/**
 Создать CGPath прямоугольной формы с закругленными краями. Для каждого угла задается свой радиус закругления.
 @param context Текущий CGContextRef
 @param rect Прямоугольник
 @param radius Массив углов закругления (начиная с левого верхнего, по часовой стрелке)
 */
+ (void) MakePathWithCorners :(CGContextRef) context :(CGRect) rect :(float[]) radius;
@end

@interface UIView (FindUIViewController)
@property (NS_NONATOMIC_IOSONLY, readonly, strong) UIViewController *firstAvailableUIViewController;
@property (NS_NONATOMIC_IOSONLY, readonly, strong) id traverseResponderChainForUIViewController;


@end


