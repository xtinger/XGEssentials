//
//  NSDate+CGBetween.m
//  XGEssentials
//  https://github.com/xtinger/XGEssentials
//
//  Created by Denis Voronov on 07/05/15.
//

#import "NSDate+XGBetween.h"

@implementation NSDate (XGBetween)

- (BOOL)isBetweenDate:(NSDate*)date1 andDate:(NSDate*)date2 {
    return ([self laterDate:date1] == self) && ([self earlierDate:date2] == self);
}

@end
