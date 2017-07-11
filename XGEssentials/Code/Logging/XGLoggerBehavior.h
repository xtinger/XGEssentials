//
//  XGLoggerBehavior.h
//  XGEssentials
//
//  Created by Denis Voronov on 19/06/2017.
//  Copyright © 2017 Emanor. All rights reserved.
//

#import <Foundation/Foundation.h>

// взято из DDLog
typedef NS_OPTIONS(NSUInteger, XGLogFlag){
    XGLogFlagError      = (1 << 0),
    XGLogFlagWarning    = (1 << 1),
    XGLogFlagInfo       = (1 << 2),
    XGLogFlagDebug      = (1 << 3),
    XGLogFlagVerbose    = (1 << 4)
};

@protocol XGLoggerBehavior <NSObject>

- (void)logWithFlag:(XGLogFlag)flag text:(NSString*)text;

@end
