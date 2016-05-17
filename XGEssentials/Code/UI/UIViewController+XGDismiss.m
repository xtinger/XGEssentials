//
//  UIViewController+XGDismiss.m
//  XGEssentials
//  https://github.com/xtinger/XGEssentials
//
//  Created by Denis Voronov on 03/08/15.
//

#import "UIViewController+XGDismiss.h"

@implementation UIViewController (XGDismiss)

- (void) dismissWithCompletionIfPresented :(void (^)(void))completion {

    if (self.navigationController && [self.navigationController.viewControllers indexOfObject:self] > 0 && self.navigationController.topViewController == self) {
        [self.navigationController popViewControllerAnimated:YES];
    }
    else if (self.presentingViewController) {
        [self dismissViewControllerAnimated:YES completion:completion];
    }
}

- (void) dismiss {
    [self dismissWithCompletionIfPresented :nil];
}

@end
