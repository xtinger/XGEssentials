//
//  UIViewController+XGAfterViewDidLoad.h
//  XGEssentials
//  https://github.com/xtinger/XGEssentials
//
//  Created by Denis Voronov on 9/01/17.
//

@import UIKit;

typedef void (^XGAfterViewDidLoadBlock)(UIViewController* viewController);

@interface UIViewController (XGAfterViewDidLoad)

@property (nonatomic, copy) XGAfterViewDidLoadBlock xgAfterViewDidLoadBlock;

@end
