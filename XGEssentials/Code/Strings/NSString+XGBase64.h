//
//  NSString+XGBase64.h
//  MeetingAt
//
//  Created by Denis Voronov on 09/06/16.
//  Copyright © 2016 Emanor. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (XGBase64)

- (NSString *) base64String;
+ (NSString *) fromBase64String:(NSString *)string;

@end
