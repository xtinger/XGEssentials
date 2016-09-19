//
//  XGFittingTextLabel.m
//  Lini
//
//  Created by Denis on 10/2/13.
//  Copyright (c) 2013 Fold & Spine. All rights reserved.
//

#import "XGFittingTextLabel.h"

@implementation XGFittingTextLabel

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self initialize];
    }
    return self;
}

- (instancetype) initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Initialization code
        [self initialize];
    }
    return self;
}

- (instancetype) init {
    self = [super init];
    if (self) {
        [self initialize];
    }
    return self;
}

- (void) initialize{
    self.lineBreakMode = NSLineBreakByWordWrapping;
//    self.textAlignment = NSTextAlignmentCenter;
    self.numberOfLines = 0;
    self.adjustsFontSizeToFitWidth = NO;
//    self.textColor = [UIColor blackColor];
    self.minimalFontSize = 8;
}

- (void) setFont:(UIFont *)font {
    if (!_initialFont)
        _initialFont = font;
    
    // super.font = будет вызван в setText
    self.text = self.text;
}

- (void) layoutSubviews {
    [self recalculateText];
}

- (void)recalculateText {
    // если setText вызван до setFont
    if (!_initialFont)
        _initialFont = self.font;
    
    NSString *fontName = _initialFont.fontName;
    // подбираем размер начиная с _initFont.pointSize
    CGFloat fontSize = _initialFont.pointSize;
    while (fontSize > self.minimalFontSize)
    {
        //boundingRectWithSize:options:attributes:context
        
        // если с данным размером шрифта не умещаемся в метке, уменьшаем шрифт
        CGSize size = [self.text boundingRectWithSize:CGSizeMake(self.width, 10000)
                                         options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading)
                                      attributes:@{NSFontAttributeName:[UIFont fontWithName:fontName size:fontSize]}
                                         context:nil].size;
        
//        
//        CGSize size = [self.text sizeWithFont:[UIFont fontWithName:fontName size:fontSize]
//                               constrainedToSize:CGSizeMake(self.width, 10000)
//                                   lineBreakMode:NSLineBreakByWordWrapping];
        
        if (size.height <= self.height) break;
        fontSize -= 1.0;
    }
    
    super.font = [UIFont fontWithName:fontName size:fontSize];
//    [self.layer needsDisplay];
}

- (void) setText:(NSString *)text {
    super.text = text;
    [self recalculateText];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
