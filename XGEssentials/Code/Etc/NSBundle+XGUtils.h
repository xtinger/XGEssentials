//
//  NSBundle+XGUtils.h
//  XGEssentials
//  https://github.com/xtinger/XGEssentials
//
//  Created by Denis Voronov on 08/06/16.
//

#import <Foundation/Foundation.h>

@interface NSBundle (XGUtils)

// Приложение запущено в режиме Sandbox (НЕ СИМУЛЯТОР!)
// Запуск из TestFlight, Fabric и т.п.
- (BOOL) isRunningInSandbox;

@end
