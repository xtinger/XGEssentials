
@import Foundation;
#import "TemplateSingleton.h"
#import "DDFileLogger.h"

/**
устаревший бред конечно, но синглтон, создающий файловый CocoaLumberjack логгер с определенными параметрами
 */
@interface XGFileLogger : NSObject {
    
}

SINGLETON_FOR_CLASS_HEADER(XGFileLogger);

@property (nonatomic, retain) DDFileLogger* logger;

@end
