//
//  UIViewController+XGAfterViewDidLoad.m
//  XGEssentials
//  https://github.com/xtinger/XGEssentials
//
//  Created by Denis Voronov on 9/01/17.
//

#import "UIViewController+XGAfterViewDidLoad.h"
#import "XGRuntimeHelper.h"
#import <objc/runtime.h>

static char const* XGAfterViewDidLoadKey = "XGAfterViewDidLoadKey";

@implementation UIViewController (XGAfterViewDidLoad)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [XGRuntimeHelper swizzleMethods:[self class] :@selector(viewDidLoad) :@selector(swizzled_viewDidLoad)];
        
    });
}

- (void)setXgAfterViewDidLoadBlock:(XGAfterViewDidLoadBlock)xgAfterViewDidLoadBlock{
    objc_setAssociatedObject(self, &XGAfterViewDidLoadKey, xgAfterViewDidLoadBlock, OBJC_ASSOCIATION_RETAIN);
}

-(XGAfterViewDidLoadBlock)xgAfterViewDidLoadBlock{
    XGAfterViewDidLoadBlock block = objc_getAssociatedObject(self, &XGAfterViewDidLoadKey);
    return block;
}

#pragma mark - Method Swizzling

- (void)swizzled_viewDidLoad {
    [self swizzled_viewDidLoad];
    
    if (self.xgAfterViewDidLoadBlock) {
        self.xgAfterViewDidLoadBlock(self);
    }
}


@end
