//
//  NSObject+EFLPropertyHash.m
//  XGEssentials
//  https://github.com/xtinger/XGEssentials
//
//  Created by Denis Voronov on 28/05/15.
//

#import "NSObject+XGPropertyHash.h"

@implementation NSObject (XGPropertyHash)

- (NSUInteger) propertyHash :(NSArray*) propertyNames
{
    NSUInteger prime = 31;
    NSUInteger result = 1;
    
    // first, taking the class' name
    result = prime * result + [NSStringFromClass(self.class) hash];
    
    for (NSString *propertyName in propertyNames) {
        id value = [self valueForKey:propertyName];
        result = prime * result + [value hash];
    }
    
    return result;
}

@end
