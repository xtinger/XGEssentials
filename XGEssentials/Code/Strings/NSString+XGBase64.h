//
//  NSString+XGBase64.h
//  XGEssentials
//  https://github.com/xtinger/XGEssentials
//
//  Created by Denis Voronov on 09/06/16.
//

#import <Foundation/Foundation.h>

@interface NSString (XGBase64)

- (NSString *) base64String;
+ (NSString *) fromBase64String:(NSString *)string;

@end
