//
//  NSMutableArray+XGUtils.m
//  MeetingAt
//
//  Created by Denis Voronov on 13/09/16.
//  Copyright © 2016 Emanor. All rights reserved.
//

#import "NSMutableArray+XGUtils.h"

@implementation NSMutableArray (XGUtils)

- (void) addObjectSelectedWithBlock:(id(^)())block {
    if (block) {
        id object = block();
        [self addObject:object];
    }
}

@end


