//
//  NSObject+XGBlockExecution.h
//  MeetingAt
//
//  Created by Denis Voronov on 07/06/16.
//  Copyright © 2016 Emanor. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^XGBlock)(id object);

@interface NSObject (XGBlockExecution)

- (void) executeBlock :(void(^)())block ifNotExecutedInLast: (NSTimeInterval)seconds secondsWithKey:(NSString*)key;

- (void)modify :(void(^)(id))block;

@end
