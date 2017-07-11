//
//  XGEssentialsSingletonDefines.h
//  XGEssentials
//  https://github.com/xtinger/XGEssentials
//
//  Created by Denis Voronov on 15/05/17.
//
//

#ifndef XGEssentialsSingletonDefines_h
#define XGEssentialsSingletonDefines_h

// singleton instance construction
#define SINGLETON_INSTANCE_USING_BLOCK(block) \
static dispatch_once_t pred = 0; \
__strong static id _sharedObject = nil; \
dispatch_once(&pred, ^{ \
_sharedObject = block(); \
}); \
return _sharedObject; \

#define SINGLETON_INIT_EXCEPTION_METHOD(method) \
- (instancetype)init{\
[NSException raise:@"Singleton" format:@"Use +[%@ %@]", NSStringFromClass([self class]), method];\
return nil;\
}\

#define SINGLETON_INIT_EXCEPTION SINGLETON_INIT_EXCEPTION_METHOD(@"sharedInstance")

#define SINGLETON_SHARED_INSTANCE \
+ (instancetype) sharedInstance { \
SINGLETON_INSTANCE_USING_BLOCK(^{ \
return [[self alloc] initPrivate]; \
}) \
} \

#endif /* XGEssentialsSingletonDefines_h */
