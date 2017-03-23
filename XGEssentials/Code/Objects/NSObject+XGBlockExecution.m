//
//  NSObject+XGBlockExecution.m
//  MeetingAt
//
//  Created by Denis Voronov on 07/06/16.
//  Copyright © 2016 Emanor. All rights reserved.
//

#import "NSObject+XGBlockExecution.h"
@import ObjectiveC;

@implementation NSObject (XGBlockExecution)

- (void) executeBlock :(void(^)())block ifNotExecutedInLast: (NSTimeInterval)seconds secondsWithKey:(NSString*)key{
    NSDate* now = [NSDate date];
    NSDate* lastExecution = objc_getAssociatedObject(self.class, (__bridge const void *)(key));
    if (!lastExecution || [now timeIntervalSinceDate:lastExecution] > seconds) {
        objc_setAssociatedObject(self.class, (__bridge const void *)(key), now, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        if (block) {
            block();
        }
    }
}

- (void)modify :(void(^)(id))block{
    if (block) {
        block(self);
    }
}

@end
