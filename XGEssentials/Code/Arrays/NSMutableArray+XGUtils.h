//
//  NSMutableArray+XGUtils.h
//  MeetingAt
//
//  Created by Denis Voronov on 13/09/16.
//  Copyright © 2016 Emanor. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (XGUtils)

- (void) addObjectSelectedWithBlock:(id(^)())block;

@end
