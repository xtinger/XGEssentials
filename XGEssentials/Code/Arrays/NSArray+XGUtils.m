//
//  NSArray+XGUtils.m
//  XGEssentials
//  https://github.com/xtinger/XGEssentials
//
//  Created by Denis Voronov on 12/5/12.
//

#import "NSArray+XGUtils.h"
#import "NSObject+XGCasting.h"
#import "NSObject+XGPropertyHash.h"
@import ObjectiveC;


@implementation NSArray (Utils)

+ (NSArray *) newArrayWithArray :(NSArray *)array :(NSInteger) from :(NSInteger) to {
    NSMutableArray *resultM = [[NSMutableArray alloc] init];
    for (long i = from; i <= to && i < array.count; i++) {
        id item = array[i];
        [resultM addObject:item];
    }
    NSArray *result = [[NSArray alloc] initWithArray:resultM];
    return result;
}

+ (NSArray *) arrayWithShuffling :(NSArray *) array
{
    NSMutableArray *arrayM = [[NSMutableArray alloc] initWithArray:array];
    for (int i = 0; i < arrayM.count; i++) {
        NSObject *swapping = arrayM[i];
        [arrayM removeObjectAtIndex:i];
        int other = arc4random() % arrayM.count;
        [arrayM insertObject:swapping atIndex:other];
    }
    // проверка на отсутствие идущих подряд одинаковых значений
    for (int i = 1; i < arrayM.count; i++) {
        while (arrayM[i] == arrayM[i - 1]) {
            // находим элемент с которым будем меняться
            int other;
            do {
                other = arc4random() % arrayM.count;
            } while (other != i && arrayM[i] != arrayM[i - 1] && arrayM[i] != arrayM[i + 1]);
            // меняем
            NSObject *swapping = arrayM[i];
            [arrayM removeObjectAtIndex:i];
            [arrayM insertObject:swapping atIndex:other];
        }
    }
    
    return [[NSArray alloc] initWithArray:arrayM];
}

- (NSArray *) shuffled {
    return [NSArray arrayWithShuffling:self];
}

+ (NSArray *) arrayWithObjects :(NSArray *)array1 notContainedIn:(NSArray *)array2
{
    NSMutableArray *arrayM = [[NSMutableArray alloc] init];
    for (int i = 0; i < array1.count; i++) {
        NSObject *item = array1[i];
        if (![array2 containsObject:item])
            [arrayM addObject:item];
    }
    return [NSArray arrayWithArray:arrayM];
}

+ (NSArray *) arrayWithObjects :(NSArray *)array1 notEqual:(id)elem
{
    NSMutableArray *arrayM = [[NSMutableArray alloc] init];
    for (int i = 0; i < array1.count; i++) {
        NSObject *item = array1[i];
        if (item != elem)
            [arrayM addObject:item];
    }
    return [NSArray arrayWithArray:arrayM];
}

+ (NSArray *) arrayWithObjects :(NSArray *)array1 containedIn:(NSArray *)array2
{
    NSMutableArray *arrayM = [[NSMutableArray alloc] init];
    for (int i = 0; i < array1.count; i++) {
        NSObject *item = array1[i];
        if ([array2 containsObject:item])
            [arrayM addObject:item];
    }
    return [NSArray arrayWithArray:arrayM];
}

- (id) getFirstElementNotContainedIn :(NSArray *)inArr
{
    for (int i = 0; i < self.count; i++) {
        NSObject *item = self[i];
        if (![inArr containsObject:item])
            return item;
    }
    return nil;
}

- (id) getFirstElementNotEqual :(id)object {
    for (int i = 0; i < self.count; i++) {
        NSObject *item = self[i];
        if (item != object)
            return item;
    }
    return nil;
}

//- (id) getFirstElementNotEqual :(id)object :(NSInteger) startFromIndex :(DVValue *)resultNumber{
//    resultNumber.value = NumIntg(-1);
//    for (NSInteger i = startFromIndex; i < self.count; i++) {
//        NSObject *item = self[i];
//        if (item != object) {
//            resultNumber.value = NumIntg(i);
//            return item;
//        }
//    }
//    return nil;
//}

// оптимизировать
- (id) getRandomElementNotEqual :(id)object {
    
    for (int i = 0; i < self.count; i++) {
        NSObject *item = self.randomItem;
        if (item != object)
            return item;
    }
    // нет результаттов, пытаемся прямым перебором
    return [self getFirstElementNotEqual:object];
}

// оптимизировать
- (id) getRandomElementNotContainedIn :(NSArray *) array {
    
    for (int i = 0; i < self.count; i++) {
        NSObject *item = self.randomItem;
        if (![array containsObject:item])
            return item;
    }
    // нет результаттов, пытаемся прямым перебором
    return [self getFirstElementNotContainedIn:array];
}

- (BOOL) containsSameElementsAs :(NSArray *) array {
    if (array.count != self.count)
        return NO;
    
    NSArray *allItems1 = [NSArray arrayWithObjects:[self uniqueElements] containedIn:array];
    if (allItems1.count != [self uniqueElements].count) {
        return NO;
    }
    
    NSArray *allItems2 = [NSArray arrayWithObjects:[array uniqueElements] containedIn:self];
    if (allItems2.count != [array uniqueElements].count) {
        return NO;
    }
    
    return YES;
}

- (BOOL)isEqualToArrayByContents :(NSArray *) array {
    if (self.count != array.count) {
        return NO;
    }
    for (int i = 0; i < self.count; i++) {
        if (![self[i] isEqual:array[i]]) {
            return NO;
        }
    }
    return YES;
}

- (BOOL) containsAllElementsFromArray :(NSArray *) array :(NSInteger) times {
    for (int i = 0; i < array.count; i++) {
        id item = self[i];
        int t = 0;
        for (int j = 0; j < self.count; j++) {
            id item2 = self[j];
            if (item2 == item)
                t++;
        }
        if (t != times)
            return NO;
    }
    return YES;
}

- (NSInteger) countOfObject :(id)obj {
    int cnt = 0;
    for (int i = 0; i < self.count; i++) {
        id obj_i = self[i];
        if (obj_i == obj)
            cnt++;
    }
    return cnt;
}

- (id) randomItem
{
    id result = nil;
    if (self.count > 0) {
        int idx = arc4random() % self.count;
        NSAssert(idx >= 0 && idx < self.count, @"wrong index");
        result = self[idx];
    }
    
    return result;
}

- (id) randomItemNotEqual :(id)item
{
    id randomItem;
    if (self.count == 1) {
        randomItem = self.firstObject;
        if (randomItem == item)
            return nil;
    }
    else {
        do {
            randomItem = self.randomItem;
        }
        while (randomItem != nil && randomItem == item);
    }
    
    
    return randomItem;
    
}

- (BOOL) containsUniquePointerElements {
    for (int i = 0; i < self.count; i++) {
        // dirty
        long cnt = [self countOfObject:self[i]];
        if (cnt > 1)
            return NO;
    }
    return YES;
}

- (BOOL) containsUniqueNumericElements {
    for (int i = 0; i < self.count; i++) {
        // dirty
        NSNumber *number = self[i];
        int value = number.intValue;
        int cnt = 0;
        for (int j = 0; j < self.count; j++) {
            NSNumber *numberJ = self[j];
            int valueJ = numberJ.intValue;
            if (value == valueJ) {
                cnt++;
                if (cnt > 1)
                    return NO;
            }
        }
    }
    return YES;
}


- (NSArray *) uniqueElements {
    NSMutableArray *resultM = [[NSMutableArray alloc] init];
    for (int i = 0; i < self.count; i++) {
        id item = self[i];
        if (![resultM containsObject:item]) {
            [resultM addObject:item];
        }
    }
    return [[NSArray alloc] initWithArray:resultM];
}

- (NSArray *)filteredArrayUsingBlock: (BOOL (^)(id evaluatedObject, NSDictionary *bindings))block {
    NSPredicate *p = [NSPredicate predicateWithBlock:block];
    return [self filteredArrayUsingPredicate:p];
}

+ (BOOL) notEmpty :(id) array{
    if (!array) {
        return NO;
    }
    NSArray* a = [NSArray cast:array];
    return a && a.count > 0;
}

+ (BOOL) emptyOrNil :(id) array{
    if (!array) {
        return YES;
    }
    NSArray* a = [NSArray cast:array];
    return !a || a.count == 0;
}

- (NSUInteger) arrayContentsByPropertyHash :(NSArray*) propertyNames
{
    NSUInteger prime = 31;
    NSUInteger result = 1;
    
    for (id object in self) {
        result = prime * result + [object propertyHash:propertyNames];
    }
    
    return result;
}

- (NSUInteger) arrayContentsHash
{
    NSUInteger prime = 31;
    NSUInteger result = 1;
    
    for (id object in self) {
        result = prime * result + [object hash];
    }
    
    return result;
}

- (NSArray *)arrayFromObjectsSelectedWithBlock:(id(^)(id object))block
{
    __block NSMutableArray *collection = [NSMutableArray arrayWithCapacity:[self count]];
    
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [collection addObject:block(obj)];
    }];
    
    return collection;
}

+ (NSArray*) arrayByAddingObjectsFromArray:(NSArray*)array repeatTimes:(NSUInteger)times{
    NSMutableArray* arrayM = [NSMutableArray array];
    for (NSUInteger i = 0; i < times; i++) {
        [arrayM addObjectsFromArray:array];
    }
    return [arrayM copy];
}


@end
