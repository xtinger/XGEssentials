//
//  UIStackView+XGUtils.h
//  MeetingAt
//
//  Created by Denis Voronov on 16/09/16.
//  Copyright © 2016 Emanor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIStackView (XGUtils)

/**
 Добавить view с автоматическим проставлением anchor по существующей высоте/ширине
 @param view добавляемое отображение
 */
- (void)addArrangedSubviewWithDefaultDimension:(UIView *)view;

@end
