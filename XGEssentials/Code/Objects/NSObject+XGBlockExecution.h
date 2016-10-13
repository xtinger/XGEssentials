//
//  NSObject+XGBlockExecution.h
//  MeetingAt
//
//  Created by Denis Voronov on 07/06/16.
//  Copyright © 2016 Emanor. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (XGBlockExecution)

- (void) executeBlock :(void(^)())block ifNotExecutedInLast: (NSTimeInterval)seconds secondsWithKey:(NSString*)key;

@end
