  //
//  UINavigationController+CompletionHandler.h
//  XGEssentials
//  https://github.com/xtinger/XGEssentials
//
//  Created by ChristianEnevoldsen on 10/08/14.
//  Copyright (c) 2014 Reversebox. All rights reserved.
//

@import UIKit;

@interface UINavigationController (XGCompletionHandler)

- (void)pushViewController:(UIViewController *)viewController
                  animated:(BOOL)animated
                completion:(void (^)(void))completion;

@end