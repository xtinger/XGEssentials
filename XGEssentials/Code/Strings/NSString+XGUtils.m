//
//  NSString+XGUtils.m
//  XGEssentials
//  https://github.com/xtinger/XGEssentials
//
//  Created by Denis Voronov on 09/04/14.
//


@import UIKit;

@implementation NSString (XGUtils)

+ (BOOL) isNilOrEmpty:(NSString *)string {
    if (IsNull(string)) return YES;
    
    if (string.length == 0) {
        return YES;
    }
    
    return NO;
}

+ (NSString *) getStringOrEmpty:(NSString *)string {
    if (IsNull(string)) return @"";
    return string;
}

- (BOOL) isEmpty{
    return self.length > 0;
}

+ (NSString *)stringFromTimeInterval:(NSTimeInterval)interval {
    NSInteger ti = (NSInteger)interval;
    NSInteger seconds = ti % 60;
    NSInteger minutes = (ti / 60) % 60;
    NSInteger hours = (ti / 3600);
    return [NSString stringWithFormat:@"%02ld:%02ld:%02ld", (long)hours, (long)minutes, (long)seconds];
}

+ (NSString *) escapeString:(NSString *)string {
    @try {
        NSRange range = NSMakeRange(0, string.length);
        return [string stringByReplacingOccurrencesOfString:@"'" withString:@"''" options:NSCaseInsensitiveSearch range:range];
    }
    @catch (NSException * e) {
        return @"";
    }
}

- (bool)caseInsensitiveStartsWith:(NSString*)inString;
{
    bool returnVal = false;
	
	if ((inString != nil) && self.length > inString.length)
	{
		NSString* substr = [self substringToIndex:inString.length];
		
		if([substr caseInsensitiveCompare:inString] == NSOrderedSame)
		{
			returnVal = true;
		}
	}
    
	return returnVal;
}

- (NSString*)characterAtIndexAsString:(NSUInteger)inIndex
{
	NSString* character = nil;
	
	if (self.length > inIndex)
	{
		character = [[self substringFromIndex:inIndex] substringToIndex:1];
	}
	
	return character;
}

NSString * ToStr (long i) {
    return [NSString stringWithFormat:@"%ld", i];
}

- (BOOL)containsStringEx:(NSString*)other {
    NSRange range = [self rangeOfString:other];
    return range.length != 0;
}

- (BOOL)isValidEmail {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}

-(NSString *) stringByStrippingHTML {
    NSRange r;
    NSString *s = [self copy];
    while ((r = [s rangeOfString:@"<[^>]+>" options:NSRegularExpressionSearch]).location != NSNotFound)
        s = [s stringByReplacingCharactersInRange:r withString:@""];
    return s;
}

@end
