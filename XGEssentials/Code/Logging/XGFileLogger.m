
#import "XGFileLogger.h"

@implementation XGFileLogger

SINGLETON_FOR_CLASS_MODULE(XGFileLogger);

- (instancetype) init {
    self = [super init];
    if (self) {
        DDFileLogger* fLogger = [[DDFileLogger alloc] init];
        fLogger.maximumFileSize = 1024 * 1024 * 4;
        fLogger.rollingFrequency = 60 * 60 * 24;
        fLogger.logFileManager.maximumNumberOfLogFiles = 10;
        self.logger = fLogger;
    }
    
    return self;
}

@end
