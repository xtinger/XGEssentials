//
//  XGLogger.h
//  XGEssentials
//
//  Created by Denis Voronov on 19/06/2017.
//  Copyright © 2017 Emanor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XGLoggerBehavior.h"

//#ifndef XGEssentialsXGLogger
//#define XGEssentialsXGLogger

#define SXGLogWithFlag(lv, t) [[XGLogger sharedInstance] logWithFlag:lv text:t]
#define SXGLogError(text) XGLogWithFlag(XGLogFlagError, text)
#define SXGLogWarn(text) XGLogWithFlag(XGLogFlagWarning, text)
#define SXGLogInfo(text) XGLogWithFlag(XGLogFlagInfo, text)
#define SXGLogDebug(text) XGLogWithFlag(XGLogFlagDebug, text)
#define SXGLogVerbose(text) XGLogWithFlag(XGLogFlagVerbose, text)

#define XGLogWithFlag(lv, frmt, ...)  [[XGLogger sharedInstance] logWithFlag:lv text:Str(frmt, ##__VA_ARGS__)]
#define XGLogError(frmt, ...) XGLogWithFlag(XGLogFlagError, frmt, ##__VA_ARGS__)
#define XGLogWarn(frmt, ...) XGLogWithFlag(XGLogFlagWarning, frmt, ##__VA_ARGS__)
#define XGLogInfo(frmt, ...) XGLogWithFlag(XGLogFlagInfo, frmt, ##__VA_ARGS__)
#define XGLogDebug(frmt, ...) XGLogWithFlag(XGLogFlagDebug, frmt, ##__VA_ARGS__)
#define XGLogVerbose(frmt, ...) XGLogWithFlag(XGLogFlagVerbose, frmt, ##__VA_ARGS__)


#define XGLogNotImplemented() XGLogError(@"%s must be overridden in a subclass/category", __PRETTY_FUNCTION__)


#define XGLogAssert(condition, frmt, ...)     \
if (!(condition)) { \
XGLogError(frmt, ##__VA_ARGS__); \
}

#define XGLogAssertReturn(condition, frmt, ...)     \
if (!(condition)) { \
XGLogError(frmt, ##__VA_ARGS__); \
return;\
}

#define XGLogAssertReturnNil(condition, frmt, ...)     \
if (!(condition)) { \
XGLogError(frmt, ##__VA_ARGS__); \
return nil;\
}

#define XGLogAssertReturnFalse(condition, frmt, ...)     \
if (!(condition)) { \
XGLogError(frmt, ##__VA_ARGS__); \
return NO;\
}

#define XGLogAssertBreak(condition, frmt, ...)     \
if (!(condition)) { \
XGLogError(frmt, ##__VA_ARGS__); \
break;\
}

#define XGLogAssertContinue(condition, frmt, ...)     \
if (!(condition)) { \
XGLogError(frmt, ##__VA_ARGS__); \
continue;\
}


#define XGLogFuncStart() XGLogDebug((@"%s [Line %d] start"), __PRETTY_FUNCTION__, __LINE__);
#define XGLogFuncFinish() XGLogDebug((@"%s [Line %d] finish"), __PRETTY_FUNCTION__, __LINE__);



//#endif

@interface XGLogger : NSObject

+ (instancetype) sharedInstance;

- (void)addBehavior:(id<XGLoggerBehavior>)behavior;
- (void)removeBehavior:(id<XGLoggerBehavior>)behavior;

- (void)logWithFlag:(XGLogFlag)flag text:(NSString*)text;

@end


