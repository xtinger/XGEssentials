//
//  UISegmentedControl+RuntimeLocalization.m
//  MeetingAt
//
//  Created by Denis Voronov on 29/04/15.
//  Copyright (c) 2015 Emanor Finance Limited. All rights reserved.
//

#import "UISegmentedControl+RuntimeLocalization.h"
#import "Localizator.h"

@implementation UISegmentedControl (RuntimeLocalization)

- (void) setLocSegmentNames:(NSString *)locSegmentNames {
    @try {
        // несколько строк в одной
        if ([locSegmentNames hasPrefix:@"TEMP:"]) {
            NSString* text = [locSegmentNames substringFromIndex: (@"TEMP:".length)];
            NSArray* split = [text componentsSeparatedByString:@","];
            for (int i = 0; i < self.numberOfSegments; i++) {
                [self setTitle:split[i] forSegmentAtIndex:i];
            }
        }
        else {
            NSArray* split = [locSegmentNames componentsSeparatedByString:@","];
            for (int i = 0; i < self.numberOfSegments; i++) {
                [self setTitle:Localized(split[i]) forSegmentAtIndex:i];
            }
        }
    }
    @catch (NSException *exception) {
        
    }
    @finally {
        
    }
}

- (NSString*) locSegmentNames {
    return nil;
}

@end
