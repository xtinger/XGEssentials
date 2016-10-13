//
//  NSObject+XGDictionaryWithProperties.m
//  EGEClient
//
//  Created by Denis Voronov on 01/08/16.
//  Copyright © 2016 Denis Voronov. All rights reserved.
//

#import "NSObject+XGDictionaryWithProperties.h"
#import <objc/runtime.h>

@implementation NSObject (XGDictionaryWithProperties)

- (NSDictionary *) dictionaryWithAllProperties
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    unsigned count;
    objc_property_t *properties = class_copyPropertyList([self class], &count);
    
    for (int i = 0; i < count; i++) {
        NSString *key = [NSString stringWithUTF8String:property_getName(properties[i])];
        [dict setObject:[self valueForKey:key] forKey:key];
    }
    
    free(properties);
    
    return [NSDictionary dictionaryWithDictionary:dict];
}

- (NSDictionary *) dictionaryWithProperties: (NSArray*) propertyNames
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    unsigned count;
    objc_property_t *properties = class_copyPropertyList([self class], &count);
    
    for (int i = 0; i < count; i++) {
        NSString* propertyName = [NSString stringWithUTF8String:property_getName(properties[i])];
        if (![propertyNames containsObject:propertyName]) {
            continue;
        }
        NSString *key = [NSString stringWithUTF8String:property_getName(properties[i])];
        [dict setObject:[self valueForKey:key] forKey:key];
    }
    
    free(properties);
    
    return [NSDictionary dictionaryWithDictionary:dict];
}

@end
