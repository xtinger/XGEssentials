//
//  XGEssentialsDefines.h
//  XGEssentials
//  https://github.com/xtinger/XGEssentials
//
//  Created by Denis Voronov on 16/05/16.
//
//

#ifndef XGEssentialsDefines_h
#define XGEssentialsDefines_h

@import CoreGraphics;
@import UIKit;

#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

#define Nullify(a) (a ? a : [NSNull null])
#define Nillify(a) ([a isEqual:[NSNull null]] ? nil : a)
#define IsNull(value) !value || [value isEqual:[NSNull null]]
#define IsNotNull(value) value && ![value isEqual:[NSNull null]]

#define perform_selector_safe1(delegate , sel , arg1)  ([delegate respondsToSelector:sel]) ? [delegate performSelector:sel withObject:arg1] : NO;

#define UICOLOR_ALPHA(c, a) [UIColor colorWithRed:CGColorGetComponents(c.CGColor)[0] green:CGColorGetComponents(c.CGColor)[1] blue:CGColorGetComponents(c.CGColor)[2] alpha:a]
#define UICOLOR_RGBA(r, g, b, a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define UICOLOR_RGB(r, g, b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#define UICOLOR_GRAY(n) [UIColor colorWithRed:n/255.0 green:n/255.0 blue:n/255.0 alpha:1]
#define UICOLOR_HSB(hue, sat, bri) [UIColor colorWithHue:(float)hue/360 saturation:(float)sat/100 brightness:(float)bri/100 alpha:1]
#define UICOLOR_HEX(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define CGCOLOR_RGBA(r, g, b, a) [[UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a] CGColor]
#define CGCOLOR_RGB(r, g, b) [[UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1] CGColor]

static inline UIColor* XGMakeColor(CGFloat r, CGFloat g, CGFloat b) {return [UIColor colorWithRed:(r/255.0f) green:(g/255.0f) blue:(b/255.0f) alpha:1.0f];}
static inline UIColor* XGMakeColorA(CGFloat r, CGFloat g, CGFloat b, CGFloat a) {return [UIColor colorWithRed:(r/255.0f) green:(g/255.0f) blue:(b/255.0f) alpha:a];}
static inline UIColor* XGMakeGrayColor(CGFloat c) {return [UIColor colorWithRed:(c/255.0f) green:(c/255.0f) blue:(c/255.0f) alpha:1.0f];}

#define Str(...) ((NSString *)[NSString stringWithFormat:__VA_ARGS__,nil])

// CGRect
#define SetX(frame, x)               frame = CGRectMake(x, frame.origin.y, frame.size.width, frame.size.height)
#define SetY(frame, y)               frame = CGRectMake(frame.origin.x, y, frame.size.width, frame.size.height)
#define SetWidth(frame, w)           frame = CGRectMake(frame.origin.x, frame.origin.y, w, frame.size.height)
#define SetHeight(frame, h)          frame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, h)

/**
 Конвертировать строку (strValue) в enum (type), на основе mapping массива (allValues)
 */
#define StringToEnum(type, allValues, strValue) (type)[allValues indexOfObject:strValue]
/**
 Конвертировать строку (strValue) в enum (type), на основе mapping массива (allValues).
 Известно, что первый элемент в enum означает "значение не определено" (noneValue).
 */
#define StringToEnumDef(type, allMappableValues, noneValue, strValue) ([allMappableValues indexOfObject:strValue] >= 0 ? (type)([allMappableValues indexOfObject:strValue]+1) : noneValue)

#define StringToEnumDef0(allMappableValues, noneValue, strValue) ([allMappableValues indexOfObject:strValue] >= 0 ? ([allMappableValues indexOfObject:strValue]+1) : noneValue)
/**
 Конвертировать enum в строку, на основе mapping массива
 */
#define EnumToString(allValues, enumValue) allValues[enumValue]
/**
 Конвертировать enum в строку, на основе mapping массива. Известно, что первый элемент в enum означает "значение не определено"
 */
#define EnumToStringDef(allValues, enumValue) allValues[enumValue - 1]


#endif /* XGEssentialsDefines_h */
