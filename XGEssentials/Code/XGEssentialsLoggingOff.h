//
//  XGEssentialsLoggingOff.h
//  XGEssentials
//  https://github.com/xtinger/XGEssentials
//
//  Created by Denis Voronov on 16/05/16.
//

#ifndef XGEssentialsLoggingOff_h
#define XGEssentialsLoggingOff_h

#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

#define XGLogNotImplemented()
#define XGLogError(frmt, ...)
#define XGLogWarn(frmt, ...)
#define XGLogInfo(frmt, ...)
#define XGLogDebug(frmt, ...)
#define XGLogVerbose(frmt, ...)

#define XGLogWithFlag(lv, frmt, ...)#define XGLogAssert(condition, frmt, ...)
#define XGLogAssertReturn(condition, frmt, ...)
#define XGLogAssertBreak(condition, frmt, ...)
#define XGLogAssertContinue(condition, frmt, ...)

#endif /* XGEssentialsLoggingOff_h */
