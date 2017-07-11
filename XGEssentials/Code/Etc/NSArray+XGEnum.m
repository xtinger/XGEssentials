//
//  NSDate+XGBetween.h
//  XGEssentials
//  https://github.com/xtinger/XGEssentials
//
//  Created by Denis Voronov on 07/05/15.
//

#import "NSArray+XGEnum.h"

@implementation NSArray (XGEnum)

- (NSString*)stringWithEnum:(NSUInteger) enumVal
{
    return [self objectAtIndex:enumVal];
}

- (NSUInteger)enumFromString:(NSString*)strVal defaultVal:(NSUInteger)defaultVal
{
    NSUInteger n = [self indexOfObject:strVal];
    if (n == NSNotFound) {
        n = defaultVal;
    }
    return n;
}

- (NSUInteger)enumFromString:(NSString*)strVal
{
    return [self enumFromString:strVal defaultVal:0];
}

@end
