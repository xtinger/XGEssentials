//
//  UIImage+XGUtils.h
//  XGEssentials
//  https://github.com/xtinger/XGEssentials
//
//  Created by Denis Voronov on 09/12/15.
//

@import UIKit;

@interface UIImage (XGUtils)

- (UIImage *) scaledToSize:(CGSize)size;
- (UIImage *) imageByScalingAndCroppingToSize :(CGSize) size;

- (UIColor *) averageColor;
- (UIColor *) mergedColor;

- (NSString *) base64StringRepresentation;

@end
