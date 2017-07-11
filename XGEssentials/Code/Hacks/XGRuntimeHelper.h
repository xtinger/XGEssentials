//
//  EFLRuntimeHelper.h
//  XGEssentials
//  https://github.com/xtinger/XGEssentials
//
//  Created by Denis Voronov on 15/04/15.
//

@import Foundation;

@interface XGRuntimeHelper : NSObject

+ (void) swizzleMethods: (Class)class :(SEL)originalSelector :(SEL) swizzledSelector;

@end
