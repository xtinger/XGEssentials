//
//  NSObject+Casting.m
//  MeetingAt
//
//  Created by Denis Voronov on 28/05/15.
//  Copyright (c) 2015 Emanor Finance Limited. All rights reserved.
//

#import "NSObject+Casting.h"

@implementation NSObject (Casting)

+ (instancetype)cast:(id)obj
{
    if ([obj isKindOfClass:self]) {
        return obj;
    }
    return nil;
}

@end
