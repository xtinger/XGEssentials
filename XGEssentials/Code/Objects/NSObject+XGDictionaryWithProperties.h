//
//  NSObject+XGDictionaryWithProperties.h
//  EGEClient
//
//  Created by Denis Voronov on 01/08/16.
//  Copyright © 2016 Denis Voronov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (XGDictionaryWithProperties)

- (NSDictionary *) dictionaryWithAllProperties;

- (NSDictionary *) dictionaryWithProperties: (NSArray*) propertyNames;

@end
