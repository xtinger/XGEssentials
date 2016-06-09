//
//  NSString+XGBase64.m
//  XGEssentials
//  https://github.com/xtinger/XGEssentials
//
//  Created by Denis Voronov on 09/06/16.
//

#import "NSString+XGBase64.h"

@implementation NSString (XGBase64)

- (NSString *) base64String {
    NSData *data = [self dataUsingEncoding: NSUTF8StringEncoding];
    
    return [data base64EncodedStringWithOptions:0];
}

+ (NSString *)fromBase64String:(NSString *)string {
    NSData  *base64Data = [[NSData alloc] initWithBase64EncodedString:string options:0];
    
    return [[NSString alloc] initWithData:base64Data encoding:NSUTF8StringEncoding];
}

@end
