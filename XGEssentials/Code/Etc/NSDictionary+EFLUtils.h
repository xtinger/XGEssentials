//
//  NSDictionary+EFLUtils.h
//  MeetingAt
//
//  Created by Denis Voronov on 26/11/2014.
//  Copyright (c) 2014 Emanor Finance Limited. All rights reserved.
//

@import Foundation;

@interface NSDictionary (EFLUtils)

/**
 возвращает значение словаря по ключу, или nil, если нет значения.
 @param aKey ключ
 @return nil или значение
 */
-(id)objectForKeyOrNil:(id)aKey;
/**
 возвращает значение словаря по ключу, или значение по умолчанию, если нет значения.
 @param aKey ключ
 @param defval значение по умолчанию
 @return nil или значение
 */
-(id)objectForKeyOrDefault:(id)aKey :(id)defval;
/**
 возвращает пустой словарь, если нет значения. можно использовать для длинных цепочек,
 например [[responseObject objectForKeyOrEmpty:@"meta"] objectForKeyOrNil:@"badges"]
 @param aKey ключ
 @return пустой словарь или значение
 */
-(id)objectForKeyOrEmpty:(id)aKey;
/**
 возвращает значение словаря по ключу, или NO (BOOL)0, если нет значения.
 @param aKey ключ
 @return nil или значение
 */
-(id)objectForKeyOrFalse:(id)aKey;
/**
 возвращает значение словаря по ключу, или @(0), если нет значения.
 @param aKey ключ
 @return nil или значение
 */
-(id)objectForKeyOrZero:(id)aKey;
/**
 устанавливает в словарь по ключу key значение NSNumber по float значению value, или [NSNull null], если значение == 0.
 @param value значение
 @param key ключ
 */
-(void)setFloatWithNullableZeroValue:(float)value forKey:(NSString*)key;
/**
 устанавливает в словарь по ключу key значение NSString value, или [NSNull null], если строка isNilOrEmpty.
 @param string значение
 @param key ключ
 */
-(void)setStringWithNullableEmptyValue:(NSString*)string forKey:(NSString*)key;

/**
 Заменить все NSNull на пустые строки
 */
- (NSDictionary *)dictionaryByReplacingNullsWithStrings;

@end
