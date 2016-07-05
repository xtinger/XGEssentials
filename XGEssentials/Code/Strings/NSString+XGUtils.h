//
//  NSString+XGUtils.h
//  XGEssentials
//  https://github.com/xtinger/XGEssentials
//
//  Created by Denis Voronov on 09/04/14.
//

@import Foundation;

@interface NSString (XGUtils)

@property (nonatomic, assign, readonly) BOOL isEmpty;

+ (BOOL) isNilOrEmpty:(NSString *)string;
+ (NSString *) getStringOrEmpty:(NSString *)string;
+ (NSString *) stringFromTimeInterval:(NSTimeInterval)interval;
+ (NSString *) escapeString:(NSString *)string;
- (bool) caseInsensitiveStartsWith:(NSString*)inString;
- (NSString*) characterAtIndexAsString:(NSUInteger)inIndex;
- (BOOL)containsStringEx:(NSString*)other;
@property (NS_NONATOMIC_IOSONLY, getter=isValidEmail, readonly) BOOL validEmail;
-(NSString *) stringByStrippingHTML;

NSString * ToStr (long i);
@end
