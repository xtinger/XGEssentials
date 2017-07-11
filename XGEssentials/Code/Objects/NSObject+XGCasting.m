//
//  NSObject+XGCasting.m
//  XGEssentials
//  https://github.com/xtinger/XGEssentials
//
//  Created by Denis Voronov on 28/05/15.
//

#import "NSObject+XGCasting.h"

@implementation NSObject (XGCasting)

+ (instancetype)cast:(id)obj {
    if ([obj isKindOfClass:self]) {
        return obj;
    }
    return nil;
}

@end
