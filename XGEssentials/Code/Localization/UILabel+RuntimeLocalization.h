//
//  UILabel+RuntimeLocalization.h
//  MeetingAt
//
//  Created by Denis Voronov on 29/04/15.
//  Copyright (c) 2015 Emanor Finance Limited. All rights reserved.
//

@import UIKit;

@interface UILabel (RuntimeLocalization)

@property (nonatomic, copy) NSString* locText;
// не использовать! сделано для защиты от случайной ошибки! (скопировали текст с кнопки например)
@property (nonatomic, copy) NSString* locTitle;

@end
