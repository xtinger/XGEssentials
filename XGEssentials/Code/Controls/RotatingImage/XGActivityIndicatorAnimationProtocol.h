//
//  Header.h
//  MeetingAt
//
//  Created by Denis Voronov on 25/03/16.
//  Copyright © 2016 Emanor. All rights reserved.
//

#ifndef XGActivityIndicatorAnimationProtocol_Header_h
#define XGActivityIndicatorAnimationProtocol_Header_h

@import UIKit;

@protocol XGActivityIndicatorAnimationProtocol <NSObject>

- (void)setupAnimationInLayer:(CALayer *)layer withSize:(CGSize)size tintColor:(UIColor *)tintColor;

@end

#endif /* XGActivityIndicatorAnimationProtocol_Header_h */
