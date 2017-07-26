//
//  EFLStringHelper.m
//  MeetingAt
//
//  Created by Denis Voronov on 20/10/2014.
//  Copyright (c) 2014 Emanor Finance Limited. All rights reserved.
//

#import "EFLStringHelper.h"
#import "NSDate+Utilities.h"

@interface EFLStringHelper ()

@property (nonatomic, strong) NSMutableDictionary *ageDictionary;
@property (nonatomic, strong) NSMutableDictionary *hoursDictionary;

@property (nonatomic, strong, readonly) NSDateFormatter* nEventDateFormat;
@property (nonatomic, strong, readonly) NSDateFormatter* nEventTimeFormat;

@property (nonatomic, strong) NSDateFormatter *oldEventDateFormat;

@end

@implementation EFLStringHelper

SINGLETON_SHARED_INSTANCE

SINGLETON_INIT_EXCEPTION

- (instancetype)initPrivate
{
    self = [super init];
    
    if (self) {
        _baseDateFormat = [[NSDateFormatter alloc] init];
        _baseDateFormat.doesRelativeDateFormatting = YES;
        _baseDateFormat.dateStyle = NSDateFormatterShortStyle;
        _baseDateFormat.timeStyle = NSDateFormatterShortStyle;
        
        _eventDateFormat = [[NSDateFormatter alloc] init];
        _eventDateFormat.doesRelativeDateFormatting = NO;
        _eventDateFormat.dateFormat = @"dd MMM yyyy HH:mm";
//        [_eventDateFormat setTimeStyle:NSDateFormatterShortStyle];
        
        _eventDateFormat = [[NSDateFormatter alloc] init];
        _eventDateFormat.doesRelativeDateFormatting = NO;
        _eventDateFormat.dateFormat = @"dd MMM yyyy HH:mm";
        
        _oldEventDateFormat = [[NSDateFormatter alloc] init];
        _oldEventDateFormat.doesRelativeDateFormatting = NO;
        _oldEventDateFormat.dateFormat = @"dd MMM yyyy";
        
        _nEventDateFormat = [[NSDateFormatter alloc] init];
        _nEventDateFormat.doesRelativeDateFormatting = NO;
        _nEventDateFormat.dateFormat = @"dd MMM";
        
        _nEventTimeFormat = [[NSDateFormatter alloc] init];
        _nEventTimeFormat.doesRelativeDateFormatting = NO;
        _nEventTimeFormat.dateFormat = @"HH:mm";

        _baseBirthDateFormat = [[NSDateFormatter alloc] init];
        _baseBirthDateFormat.doesRelativeDateFormatting = YES;
        _baseBirthDateFormat.dateStyle = NSDateFormatterLongStyle;
        
        
        _ageDictionary = [[NSMutableDictionary alloc] init];
        _ageDictionary[@[@"0",@"5",@"6",@"7",@"8",@"9"]] = Localized(@"format_since_ru_years_056789");
        _ageDictionary[@[@"1"]] = Localized(@"format_since_ru_years_1");
        _ageDictionary[@[@"2",@"3",@"4"]] = Localized(@"format_since_ru_years_234");
        
        _hoursDictionary = [[NSMutableDictionary alloc] init];
        _hoursDictionary[@[@"2",@"3",@"4",@"22",@"23",@"24"]] = Localized(@"format_since_ru_hours_234");
        _hoursDictionary[@[@"1",@"21"]] = Localized(@"format_since_ru_hours_1");
        _hoursDictionary[@[@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19",@"20"]] = Localized(@"format_since_ru_hours");

    }
    return self;
}

- (NSString *) getNewBaseDateString:(NSDate *)date {
    return [self getNewBaseDateString:date :self.nEventDateFormat];
}

- (NSString *) getNewBaseDateString:(NSDate *)date :(NSDateFormatter*)defaultFormatter{
    if ([date isToday]) {
        return Localized(@"format_when_today");
    }
    else if ([date isTomorrow]) {
        return Localized(@"format_when_tomorrow");
    }
    else if ([date isYesterday]) {
        return Localized(@"format_when_yesterday");
    }
    else if ([date isMoreOneYearAgo]) {
        return [_oldEventDateFormat stringFromDate:date];
    }
    else {
        return [defaultFormatter stringFromDate:date];
    }
}

- (NSString*)getFinishEventDateAndTimeString:(NSDate *)date{
    return [self.eventDateFormat stringFromDate:date];
}

- (NSString *) getNewBaseTimeString:(NSDate *)date {
    return [self.nEventTimeFormat stringFromDate:date];
}

- (NSMutableAttributedString*) eventDateString :(NSDate *)date {
    NSDateFormatter* f = [[NSDateFormatter alloc] init];
    f.doesRelativeDateFormatting = NO;
    f.dateFormat = @"dd MMMM yyyy";
    
    NSString* dateStr = [self getNewBaseDateString:date :f];
    NSString* timeStr = [self getNewBaseTimeString:date];
    NSString* resultPre = [NSString stringWithFormat:@"%@ %@", dateStr, timeStr];
    NSMutableAttributedString *result = [[NSMutableAttributedString alloc] initWithString:resultPre];
    [result addAttributes:@{NSFontAttributeName: [UIFont boldSystemFontOfSize:18.0],NSForegroundColorAttributeName: [UIColor grayColor]} range:NSMakeRange(0, result.length)];
    [result addAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize /*old HelveticaNeue Light*/ :18 weight:UIFontWeightLight],NSForegroundColorAttributeName: [UIColor blackColor]} range:NSMakeRange(0, dateStr.length)];

    
    return result;
}

- (NSMutableAttributedString *)getBaseDateString:(NSDate *)date baseColor:(UIColor *)baseColor delimeterColor:(UIColor *) delimeterColor {
    
    NSString *dateRawText = [self.baseDateFormat stringFromDate:date];
    dateRawText = [dateRawText stringByReplacingOccurrencesOfString:@"," withString:@""];
    
    NSRange delimeterRange = NSMakeRange([dateRawText rangeOfString:@" "].location + 1, dateRawText.length - [dateRawText rangeOfString:@" "].location - 1);
    
    NSMutableAttributedString *dateText = [[NSMutableAttributedString alloc] initWithString:dateRawText attributes:
                                           @{NSForegroundColorAttributeName : baseColor,
                                             NSFontAttributeName : [UIFont boldSystemFontOfSize:14.0]
                                             }
                                           ];
    
    [dateText addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize :14.0] range:delimeterRange];
    
    return dateText;
}

- (NSMutableAttributedString *)getBaseLineBreakDateString:(NSDate *)date baseColor:(UIColor *)baseColor delimeterColor:(UIColor *) delimeterColor {
    
    
    NSString *dateRawText = [[self.baseDateFormat stringFromDate:date] stringByReplacingOccurrencesOfString:@" " withString:@"\n@ "];
    dateRawText = [dateRawText stringByReplacingOccurrencesOfString:@"," withString:@""];
    
    NSRange delimeterRange = [dateRawText rangeOfString:@"@"];
    
    NSMutableAttributedString *dateText = [[NSMutableAttributedString alloc] initWithString:dateRawText attributes:@{NSForegroundColorAttributeName: baseColor}];
    
    [dateText addAttribute:NSForegroundColorAttributeName value:delimeterColor range:delimeterRange];
    
    return dateText;
}


- (NSString*)getYearString:(NSString*)year {
    NSString *tail = [year substringFromIndex:year.length - 1];
    NSArray *keys = (self.ageDictionary).allKeys;
    
    for (NSArray* keyList in keys) {
        for (NSString *key in keyList) {
            if ([tail isEqual:key]) {
                return [NSString stringWithFormat:@"%@ %@", year, self.ageDictionary[keyList]];
            }
        }
    }
    
    return year;
}

- (NSString*)getHourString:(NSInteger)hour {
    NSString *tail = [NSString stringWithFormat:@"%ld", (long)hour];
    NSArray *keys = (self.hoursDictionary).allKeys;
    
    for (NSArray* keyList in keys) {
        for (NSString *key in keyList) {
            if ([tail isEqual:key]) {
                return [NSString stringWithFormat:@"%ld %@", (long)hour, self.hoursDictionary[keyList]];
            }
        }
    }
    
    return tail;
}


@end
