//
//  NSLayoutConstraint+Utils.h
//  MeetingAt
//
//  Created by Denis Voronov on 05/06/2017.
//  Copyright © 2017 Emanor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSLayoutConstraint (Utils)

@property (nonatomic) BOOL useMinimalConstantValue;

+(CGFloat)minimalValue;

@end
