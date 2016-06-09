//
//  NSDate+XGBetween.h
//  XGEssentials
//  https://github.com/xtinger/XGEssentials
//
//  Created by Denis Voronov on 07/05/15.
//

@import Foundation;

@interface NSDate (XGBetween)

- (BOOL)isBetweenDate :(NSDate*)date1 andDate:(NSDate*)date2;

@end
