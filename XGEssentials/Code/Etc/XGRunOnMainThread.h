//
//  XGRunOnMainThread.h
//  MeetingAt
//
//  Created by Denis Voronov on 10/05/16.
//  Copyright © 2016 Emanor. All rights reserved.
//

#ifndef XGRunOnMainThread_h
#define XGRunOnMainThread_h

#define XGRunOnMainThread  _Pragma("clang diagnostic push") _Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
if (![NSThread isMainThread]) { dispatch_sync(dispatch_get_main_queue(), ^{ [self performSelector:_cmd]; }); return; };

#endif /* XGRunOnMainThread_h */
