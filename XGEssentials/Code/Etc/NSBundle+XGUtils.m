//
//  NSBundle+XGUtils.m
//  MeetingAt
//
//  Created by Denis Voronov on 08/06/16.
//  Copyright © 2016 Emanor. All rights reserved.
//

#import "NSBundle+XGUtils.h"

@implementation NSBundle (XGUtils)

- (BOOL) isRunningInSandbox {
    NSURL *receiptURL = [self appStoreReceiptURL];
    NSString *receiptURLString = [receiptURL path];
    BOOL isRunningInSandbox = ([receiptURLString rangeOfString:@"sandboxReceipt"].location != NSNotFound);
    return isRunningInSandbox;
}

@end
