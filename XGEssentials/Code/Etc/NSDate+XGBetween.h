//
//  NSDate+XGBetween.h
//  XGEssentials
//  https://github.com/xtinger/XGEssentials
//
//  Created by Denis Voronov on 07/05/15.
//  Copyright (c) 2015 Emanor Finance Limited. All rights reserved.
//

@import Foundation;

@interface NSDate (XGBetween)

- (BOOL)isBetweenDate :(NSDate*)date1 andDate:(NSDate*)date2;

@end
