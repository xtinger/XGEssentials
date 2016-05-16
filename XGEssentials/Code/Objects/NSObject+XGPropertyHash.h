//
//  NSObject+XGPropertyHash.h
//  XGEssentials
//  https://github.com/xtinger/XGEssentials
//
//  Created by Denis Voronov on 28/05/15.
//

#import <Foundation/Foundation.h>

@interface NSObject (XGPropertyHash)

- (NSUInteger) propertyHash :(NSArray*) propertyNames;

@end
