//
//  XGEssentialsLoggingWithLumberjack.h
//  XGEssentials
//  https://github.com/xtinger/XGEssentials
//
//  Created by Denis Voronov on 16/05/16.
//
//

#ifndef XGEssentialsLoggingWithLumberjack_h
#define XGEssentialsLoggingWithLumberjack_h

#define XGLogNotImplemented() DDLogNotImplemented()
#define XGLogError(frmt, ...) DDLogError(frmt, ##__VA_ARGS__)
#define XGLogWarn(frmt, ...) DDLogWarn(frmt, ##__VA_ARGS__)
#define XGLogInfo(frmt, ...) DDLogInfo(frmt, ##__VA_ARGS__)
#define XGLogDebug(frmt, ...) DDLogDebug(frmt, ##__VA_ARGS__)
#define XGLogVerbose(frmt, ...) DDLogVerbose(frmt, ##__VA_ARGS__)

#define DDLogNotImplemented() DDLogError(@"%s must be overridden in a subclass/category", __PRETTY_FUNCTION__)

#define DDLogWithFlag(lv, frmt, ...) \
LOG_MAYBE(lv == DDLogFlagError ? NO : LOG_ASYNC_ENABLED, LOG_LEVEL_DEF, lv,   0, nil, __PRETTY_FUNCTION__, frmt, ##__VA_ARGS__)

#define DDLogAssert(condition, frmt, ...)     \
if (!(condition)) { \
NSString *description = [NSString stringWithFormat:frmt, ## __VA_ARGS__]; \
DDLogError(@"%@", description);   \
}

#define DDLogAssertReturn(condition, frmt, ...)     \
if (!(condition)) { \
NSString *description = [NSString stringWithFormat:frmt, ## __VA_ARGS__]; \
DDLogError(@"%@", description);   \
return; \
}

#define DDLogAssertReturnNil(condition, frmt, ...)     \
if (!(condition)) { \
NSString *description = [NSString stringWithFormat:frmt, ## __VA_ARGS__]; \
DDLogError(@"%@", description);   \
return nil; \
}

#define DDLogAssertBreak(condition, frmt, ...)     \
if (!(condition)) { \
NSString *description = [NSString stringWithFormat:frmt, ## __VA_ARGS__]; \
DDLogError(@"%@", description);   \
break; \
}

#define DDLogAssertContinue(condition, frmt, ...)     \
if (!(condition)) { \
NSString *description = [NSString stringWithFormat:frmt, ## __VA_ARGS__]; \
DDLogError(@"%@", description);   \
continue; \
}

#define XGLogWithFlag(lv, frmt, ...)  DDLogWithFlag(lv, frmt, ##__VA_ARGS__)
#define XGLogAssert(condition, frmt, ...)  DDLogAssert(condition, frmt, ##__VA_ARGS__)
#define XGLogAssertReturn(condition, frmt, ...) DDLogAssertReturn(condition, frmt, ##__VA_ARGS__)
#define XGLogAssertReturnNil(condition, frmt, ...) DDLogAssertReturnNil(condition, frmt, ##__VA_ARGS__)
#define XGLogAssertBreak(condition, frmt, ...) DDLogAssertBreak(condition, frmt, ##__VA_ARGS__)
#define XGLogAssertContinue(condition, frmt, ...) DDLogAssertContinue(condition, frmt, ##__VA_ARGS__)

#define XGLogFuncStart() XGLogDebug((@"%s [Line %d] start"), __PRETTY_FUNCTION__, __LINE__);
#define XGLogFuncFinish() XGLogDebug((@"%s [Line %d] finish"), __PRETTY_FUNCTION__, __LINE__);

#endif /* XGEssentialsLoggingWithLumberjack_h */
