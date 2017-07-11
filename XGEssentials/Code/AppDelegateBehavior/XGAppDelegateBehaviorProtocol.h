//
//  XGAppDelegateBehaviorProtocol.h
//  XGEssentials
//
//  Created by Denis Voronov on 07/07/2017.
//  Copyright © 2017 Emanor. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^ XGApplicationDidFinishLaunchingBlock)();
typedef BOOL(^ XGApplicationDidFinishLaunchingWithOptionsBlock)(NSDictionary * launchOptions);


@protocol XGAppDelegateBehaviorProtocol <NSObject>

@property (nonatomic, copy) XGApplicationDidFinishLaunchingBlock applicationDidFinishLaunchingBlock;
@property (nonatomic, copy) XGApplicationDidFinishLaunchingWithOptionsBlock applicationDidFinishLaunchingWithOptionsBlock;

@end
