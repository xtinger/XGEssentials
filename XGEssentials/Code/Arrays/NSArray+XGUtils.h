//
//  NSArray+XGUtils.h
//  XGEssentials
//  https://github.com/xtinger/XGEssentials
//
//  Created by Denis Voronov on 12/5/12.
//

@import Foundation;

@interface NSArray (XGUtils)

+ (NSArray *) newArrayWithArray :(NSArray *)array :(NSInteger) from :(NSInteger) to;
+ (NSArray *) arrayWithShuffling :(NSArray *) array;
+ (NSArray *) arrayWithObjects :(NSArray *)array1 containedIn:(NSArray *)array2;
+ (NSArray *) arrayWithObjects :(NSArray *)array1 notContainedIn:(NSArray *)array2;
+ (NSArray *) arrayWithObjects :(NSArray *)array1 notEqual:(id)elem;

@property (nonatomic, readonly) NSArray* shuffled;
@property (nonatomic, readonly) id randomItem;

- (id) getFirstElementNotContainedIn :(NSArray *)inArr;
- (id) getFirstElementNotEqual :(id)object;
//- (id) getFirstElementNotEqual :(id)object :(NSInteger) startFromIndex :(DVValue *)resultNumber;
- (id) getRandomElementNotEqual :(id)object;
- (id) getRandomElementNotContainedIn :(NSArray *) array;
- (BOOL) containsAllElementsFromArray :(NSArray *) array :(NSInteger) times;
- (NSInteger) countOfObject :(id)obj;
- (id) randomItem;
- (id) randomItemNotEqual :(id)item;
@property (NS_NONATOMIC_IOSONLY, readonly) BOOL containsUniquePointerElements;
@property (NS_NONATOMIC_IOSONLY, readonly) BOOL containsUniqueNumericElements;
@property (NS_NONATOMIC_IOSONLY, readonly, copy) NSArray *uniqueElements;
- (BOOL) containsSameElementsAs :(NSArray *) array;
- (NSArray *)filteredArrayUsingBlock: (BOOL (^)(id evaluatedObject, NSDictionary *bindings))block;

+ (BOOL) notEmpty :(id) array;
/**
 возвращает hash value, вычисляемое для всех элементов массива, по заданным свойствам
 позволяет сравнивать массивы по содержимому
 */
- (NSUInteger) arrayContentsByPropertyHash :(NSArray*) propertyNames;
- (NSUInteger) arrayContentsHash;

@end
