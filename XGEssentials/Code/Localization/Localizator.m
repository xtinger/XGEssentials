//
//  Denis Voronov
//  MeetingAt
//
//  Created by Denis Voronov on 15/02/16.
//    Copyright © 2016 Emanor. All rights reserved.
//

#import "Localizator.h"
#import "CHCSVParser.h"
#import "NSString+XGUtils.h"
#import "NSDictionary+EFLUtils.h"

@interface Localizator() <NSURLSessionDelegate>

@end


@implementation Localizator 

@synthesize languageCode = _languageCode;

static NSDictionary *_lang;
static NSMutableDictionary* _subPaths;
static NSMutableArray* _codes;
static NSString* _path;

SINGLETON_SHARED_INSTANCE

SINGLETON_INIT_EXCEPTION

- (instancetype)initPrivate
{
    self = [super init];
    if (self) {
        _subPaths = [NSMutableDictionary dictionary];
    }
    return self;
}

- (void) setLanguageCode:(NSString *)languageCode {
    _languageCode = languageCode;
    [[NSUserDefaults standardUserDefaults] setObject:languageCode forKey:@"languageCode"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    // обнуляем _lang, чтобы при следующем запросе строки была прочитана другая локализация
    _lang = nil;
    // сразу же читаем strings, чтобы чтение "протормозило" в этой функции, а не позже
    __unused NSDictionary* x = self.strings;
    
    //    XGLogInfo(@"setLanguageCode: %@", languageCode);
    //    XGLogInfo(@"LANG.languageCode = %@", languageCode);
    //    CallStackBacktraceLog();
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"GEV_LanguageChanged" object:nil];;
}

- (NSString *)languageCode {
    return _languageCode;
}

- (void) registerLocalizationSubPath :(NSString*)subPath withName:(NSString*)name {
    XGLogAssertReturn(![NSString isNilOrEmpty:subPath], @"localization subpath not set!");
    XGLogAssertReturn(![NSString isNilOrEmpty:name], @"localization subpath name not set!");
    _subPaths[name] = subPath;
}

- (void) setLocalizationFileAtPath :(NSString*) path {
    _path = path;
}

- (NSString*) getString :(NSString*) key {
    NSString* string = nil;
    if ([key hasPrefix:@"TEMP:"]) {
        string = [key substringFromIndex: (@"TEMP:".length)];
        XGLogError(@"Локализация не завершена! key = %@",string);
    }
    else {
        string = [self.strings objectForKeyOrNil:key];
        // не получили строку из основного файла, пытаемся получить из вложенного (subpath)
        if (!string) {
            NSArray* components = [key componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@":"]];
            if (components.count == 2) {
                NSString* subpathName = components.firstObject;
                if ([_subPaths.allKeys containsObject:subpathName]) {
                    [self loadPath:_subPaths[subpathName] withPrefix:subpathName];
                    string = [self.strings objectForKeyOrNil:key];
                    return [NSString getStringOrEmpty :string];
                }
            }
        }
    }
    return [NSString getStringOrEmpty :string];
}

- (void) loadPath :(NSString*)path withPrefix:(NSString*)prefix{
    XGLogAssertReturn(![NSString isNilOrEmpty:path], @"localization loading path not set!");
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    
    NSArray* rows = [NSArray arrayWithContentsOfCSVFile:path];
    
    //                DDAssert(rows && rows.count > 0, @"wrong lang array");
    
    int langFieldIdx = -1;
    NSArray *fieldsRow = rows[0];
    for (int i = 0; i < fieldsRow.count; i++) {
        if ([_languageCode isEqualToString:fieldsRow[i]]) {
            langFieldIdx = i;
            break;
        }
    }
    
    rows = [rows filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary *bindings) {
        NSArray* row = (NSArray*)evaluatedObject;
        // исключаем строки с кол-вом столбцов меньше необходимого
        // исключаем комментарии #....
        return row.count > 0 && (row.count >= langFieldIdx + 1) && ![((NSString*)row.firstObject) hasPrefix:@"#"] && ![NSString isNilOrEmpty:row.firstObject];
    }]];
    
    for (int i = 1; i < rows.count; i++) {
        NSArray* row = rows[i];
        NSString *str = row[langFieldIdx];
        str = [str stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"\""]];
        str = [str stringByReplacingOccurrencesOfString:@"\"\"" withString:@"\""];
        
        // ссылка на другую строку
        if ([str hasPrefix:@"^"]) {
            NSString* key = [str substringFromIndex:1];
            if ([dic.allKeys containsObject:key]) {
                str = dic[key];
            }
            else {
                str = nil;
                //TODO: exception!
            }
        }
        
        if ([[NSUserDefaults standardUserDefaults] boolForKey:kSettingsDebugLocalizationCheck]) {
            str = [@"*" stringByAppendingString:str];
        }
        
        NSString* key = prefix ? Str(@"%@:%@", prefix, row[0]) : row[0];
        
        dic[key] = str;
        //                    NSLog(@"%@ : %@", row[0], str);
    }
    
    if (!_lang) {
        _lang = dic;
    }
    else {
        NSMutableDictionary* mDic = [_lang mutableCopy];
        [mDic addEntriesFromDictionary:dic];
        _lang = [NSDictionary dictionaryWithDictionary:mDic];
    }
}

- (NSDictionary *) strings {
    @try {
        
        if (_lang == nil) {
            
            NSMutableArray* codesM;
            if ([_languageCode isEqualToString:@"RU"]) {
                codesM = [NSMutableArray array];
            }
            
            if (_path) {
                
                [self loadPath:_path withPrefix:nil];
                
                if ([_languageCode isEqualToString:@"RU"]) {
                    _codes = codesM;
                }
            }
        }
    }
    @catch (NSException *exception) {
        [NSException raise:@"Error while loading localization file" format:@"Error while loading localization file '%@' : %@. %@", _languageCode, exception.name, exception.reason];
        //        XGLogError(@"Ошибка при загрузке файла локализации '%@' : %@. %@", _languageCode, [exception name], [exception reason]);
    }
    @finally {
        return _lang;
    }
}

- (NSURLSession *)backgroundSession{
    static NSURLSession *session = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // для каждой бэкграунд сессии надо создавать свой уникальный ключ
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:@"com.dev.BackgroundDownloadTest.BackgroundSession"];
        [config setAllowsCellularAccess:YES];
        session = [NSURLSession sessionWithConfiguration:config delegate:self delegateQueue:nil];
    });
    return session;
}

- (BOOL) updateFromURLString :(NSString *) urlString {
    BOOL result = NO;
    
    @try {
        NSURL * url = [NSURL URLWithString:urlString];
        if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0")) {
            NSURLSessionDownloadTask *getLangTask = [[self backgroundSession] downloadTaskWithURL:url];
            [getLangTask resume];
        }
        
    }
    @catch (NSException *exception) {
        //        XGLogError(@"ERROR in comparePremiumCodesFromUrlString: %@", exception.description);
    }
    
    return result;
}

#pragma mark NSURLSessionDelegate

- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location
{
    NSError* err;
    NSString *fullText = [NSString stringWithContentsOfURL:location encoding:NSUTF8StringEncoding error:&err];
    dispatch_async(dispatch_get_main_queue(), ^{
        //        NSData *urlData = [NSData dataWithContentsOfURL:location];
        NSError* err;
        //        [[NSString alloc]initWithData:urlData encoding:NSUTF8StringEncoding];
        [fullText writeToFile:_path atomically:YES encoding:NSUTF8StringEncoding error:&err];
        _lang = nil;
        XGLogVerbose(@"%@", self.strings[@"help1_title"]);
    });
}

-(void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didWriteData:(int64_t)bytesWritten totalBytesWritten:(int64_t)totalBytesWritten totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite
{
    //You can get progress here
    XGLogVerbose(@"Received: %lld bytes (Downloaded: %lld bytes)  Expected: %lld bytes.\n",
     bytesWritten, totalBytesWritten, totalBytesExpectedToWrite);
}

#pragma mark -

@end
