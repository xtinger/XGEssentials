//
//  UINavigationItem+RightItemsPosition.m
//  XGEssentials
//  https://github.com/xtinger/XGEssentials
//
//  Created by Denis Voronov on 18/02/15.
//

#import "UINavigationItem+XGRightItemsPosition.h"

@implementation UINavigationItem (XGRightItemsPosition)

- (void) setRightBarButtonItems_Fixed:(NSArray *)rightBarButtonItems {
    UIBarButtonItem* fixedSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    fixedSpace.width = -10;
    
    NSMutableArray* itemsM = [NSMutableArray arrayWithObject:fixedSpace];
    [itemsM addObjectsFromArray:rightBarButtonItems];
    
    self.rightBarButtonItems = [NSArray arrayWithArray: itemsM];
}


- (void) setRightBarButtonItem_Fixed:(UIBarButtonItem *)rightBarButtonItem {
    self.rightBarButtonItems_Fixed = @[rightBarButtonItem];
}

- (NSArray*) rightBarButtonItems_Fixed {
    return self.rightBarButtonItems;
}

- (UIBarButtonItem*) rightBarButtonItem_Fixed {
    return self.rightBarButtonItem;
}

@end
