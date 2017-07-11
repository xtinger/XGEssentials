//
//  EFLStringHelper.h
//  MeetingAt
//
//  Created by Denis Voronov on 20/10/2014.
//  Copyright (c) 2014 Emanor Finance Limited. All rights reserved.
//

@import UIKit;

@interface EFLStringHelper : NSObject

+ (instancetype)sharedInstance;

@property (nonatomic, strong, readonly) NSDateFormatter *baseBirthDateFormat;
@property (nonatomic, strong, readonly) NSDateFormatter *baseDateFormat;
@property (nonatomic, strong, readonly) NSDateFormatter *eventDateFormat;

- (NSMutableAttributedString *)getBaseDateString:(NSDate *)date baseColor:(UIColor *)baseColor delimeterColor:(UIColor *) delimeterColor;
- (NSMutableAttributedString *)getBaseLineBreakDateString:(NSDate *)date baseColor:(UIColor *)baseColor delimeterColor:(UIColor *) delimeterColor;


- (NSString *)getYearString:(NSString *)year;
- (NSString *)getNewBaseDateString:(NSDate *)date;
- (NSString *)getNewBaseDateString:(NSDate *)date :(NSDateFormatter*)defaultFormatter;
- (NSString *)getNewBaseTimeString:(NSDate *)date;

- (NSString*)getHourString:(NSInteger)hour;
- (NSString*)getFinishEventDateAndTimeString:(NSDate *)date;

- (NSMutableAttributedString*) eventDateString :(NSDate *)date ;


@end
