//
//  XGFittingTextLabel.h
//  Lini
//
//  Created by Denis on 10/2/13.
//  Copyright (c) 2013 Fold & Spine. All rights reserved.
//

@import UIKit;

@interface XGFittingTextLabel : UILabel

/**
 шрифт, с размера коротого будет начинаться подбор размера текста под границы метки
 */
@property (nonatomic, strong) UIFont* initialFont;
@property (nonatomic) CGFloat minimalFontSize;

@end
