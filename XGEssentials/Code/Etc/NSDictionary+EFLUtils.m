//
//  NSDictionary+EFLUtils.m
//  MeetingAt
//
//  Created by Denis Voronov on 26/11/2014.
//  Copyright (c) 2014 Emanor Finance Limited. All rights reserved.
//

#import "NSDictionary+EFLUtils.h"
#import "NSString+XGUtils.h"

@implementation NSDictionary (EFLUtils)

-(id)objectForKeyOrNil:(id)aKey {
    id object = self[aKey];
    
    if ([object isEqual:[NSNull null]]) {
        return nil;
    } else {
        return object;
    }
}

-(id)objectForKeyOrDefault:(id)aKey :(id)defval{
    id object = self[aKey];
    
    if (IsNull(object)) {
        return defval;
    } else {
        return object;
    }
}

-(id)objectForKeyOrEmpty:(id)aKey {
    id object = [self objectForKeyOrNil:aKey];
    
    if (!object) {
        return @{};
    } else {
        return object;
    }
}

-(id)objectForKeyOrFalse:(id)aKey{
    id object = self[aKey];
    
    if (IsNull(object)) {
        return @(NO);
    } else {
        return object;
    }
}

-(id)objectForKeyOrZero:(id)aKey{
    id object = self[aKey];
    
    if (IsNull(object)) {
        return @(0);
    } else {
        return object;
    }
}

-(void)setFloatWithNullableZeroValue:(float)value forKey:(NSString*)key{
    id nval = value > 0 ? @(value): [NSNull null];
    [self setValue:nval forKey:key];
}

-(void)setStringWithNullableEmptyValue:(NSString*)string forKey:(NSString*)key{
    id nval = ![NSString isNilOrEmpty:string] ? string: [NSNull null];
    [self setValue:nval forKey:key];
}

- (NSDictionary *)dictionaryByReplacingNullsWithStrings {
    const NSMutableDictionary *replaced = [self mutableCopy];
    const NSString *blank = @"";
    
    for(NSString *key in self) {
        const id object = [self objectForKey:key];
        if(object == [NSNull null]) {
            [replaced setObject:blank forKey:key];
        }
    }
    
    return [replaced copy];
}

@end
