//
//  UIViewController+XGDismiss.h
//  XGEssentials
//  https://github.com/xtinger/XGEssentials
//
//  Created by Denis Voronov on 03/08/15.
//

@import UIKit;

@interface UIViewController (XGDismiss)

- (void) dismiss;
- (void) dismissWithCompletionIfPresented :(void (^)(void))completion;

@end
