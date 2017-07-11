//
//  NSObject+XGDispatchOnceOnMainThread.h
//  XGEssentials
//  https://github.com/xtinger/XGEssentials
//
//  Created by Denis Voronov on 28/05/15.
//

@import Foundation;

@interface NSObject (XGDispatchOnceOnMainThread)

void dispatch_once_on_main_thread(dispatch_once_t *predicate,
                                  dispatch_block_t block);

@end
