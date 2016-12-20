//
//  NSDate+XGBetween.h
//  XGEssentials
//  https://github.com/xtinger/XGEssentials
//
//  Created by Denis Voronov on 07/05/15.
//

@import Foundation;

@interface NSArray (XGEnum)

- (NSString*) stringWithEnum:(NSUInteger) enumVal;
- (NSUInteger) enumFromString:(NSString*)strVal defaultVal:(NSUInteger)defaultVal;
- (NSUInteger) enumFromString:(NSString*)strVal;

@end
