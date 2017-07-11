//
//  Denis Voronov
//  MeetingAt
//
//  Created by Denis Voronov on 15/02/16.
//    Copyright © 2016 Emanor. All rights reserved.
//

#import <UIKit/UIKit.h>

#define Localized(x) [[Localizator sharedInstance] getString:x]
#define LocalizedEx(x,y) Localized(x)

#define kSettingsDebugLocalizationCheck @"settings_debug_localization_check"

@interface Localizator : NSObject

+ (instancetype) sharedInstance;

@property (nonatomic, readonly)  NSDictionary<NSString*,NSString*> *strings;
@property (nonatomic, strong) NSString* languageCode;

- (void) setLocalizationFileAtPath :(NSString*) path;
- (void) registerLocalizationSubPath :(NSString*)subPath withName:(NSString*)name;
- (BOOL) updateFromURLString :(NSString *) urlString;
- (NSString*) getString :(NSString*) key;

@end
