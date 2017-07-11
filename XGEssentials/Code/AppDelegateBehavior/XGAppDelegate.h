//
//  XGAppDelegate.h
//  XGEssentials
//
//  Created by Denis Voronov on 07/07/2017.
//  Copyright © 2017 Emanor. All rights reserved.
//

@import UIKit;
#import "XGAppDelegateBehavior.h"

@interface XGAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

- (void)addBehavior:(NSObject<XGAppDelegateBehaviorProtocol>*)behavior;
- (void)removeBehavior:(NSObject<XGAppDelegateBehaviorProtocol>*)behavior;

@end
