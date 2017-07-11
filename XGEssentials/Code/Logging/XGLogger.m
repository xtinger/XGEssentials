//
//  XGLogger.m
//  XGEssentials
//
//  Created by Denis Voronov on 19/06/2017.
//  Copyright © 2017 Emanor. All rights reserved.
//

#import "XGLogger.h"

@interface XGLogger ()

@property (nonatomic, strong) NSArray<id<XGLoggerBehavior>>* behaviors;

@end

@implementation XGLogger

SINGLETON_SHARED_INSTANCE

SINGLETON_INIT_EXCEPTION

- (instancetype)initPrivate{
    self = [super init];
    
    if (self) {
        self.behaviors = @[];
    }
    
    return self;
}

- (void)addBehavior:(id<XGLoggerBehavior>)behavior{
    self.behaviors = [self.behaviors arrayByAddingObject:behavior];
}

- (void)removeBehavior:(id<XGLoggerBehavior>)behavior{
    NSMutableArray* mut = [self.behaviors mutableCopy];
    [mut removeObject:behavior];
    self.behaviors = mut;
}

- (void)logWithFlag:(XGLogFlag)flag text:(NSString*)text {
    for (id<XGLoggerBehavior> behavior in [self.behaviors copy]) {
        [behavior logWithFlag:flag text:text];
    }
}

@end
