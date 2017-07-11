//
//  UIButton+RuntimeLocalization.h
//  MeetingAt
//
//  Created by Denis Voronov on 05/05/15.
//  Copyright (c) 2015 Emanor Finance Limited. All rights reserved.
//

@import UIKit;

@interface UIButton (RuntimeLocalization)

@property (nonatomic, copy) NSString* locTitle;
@property (nonatomic, copy) NSString* locText; // same as title

@end
