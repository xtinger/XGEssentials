//
//  UIImage+XGUtils.m
//  XGEssentials
//  https://github.com/xtinger/XGEssentials
//
//  Created by Denis Voronov on 09/12/15.
//

#import "UIImage+XGUtils.h"

@implementation UIImage (XGUtils)

- (UIImage *) scaledToSize:(CGSize)size {
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}


- (UIImage *)imageByScalingAndCroppingToSize :(CGSize) size
{
    CGSize scaledSize = size;
    CGPoint thumbnailPoint = CGPointZero;
    
    CGFloat widthFactor = size.width / self.size.width;
    CGFloat heightFactor = size.height / self.size.height;
    CGFloat scaleFactor = (widthFactor > heightFactor) ? widthFactor : heightFactor;
    scaledSize.width = self.size.width * scaleFactor;
    scaledSize.height = self.size.height * scaleFactor;
    
    if (widthFactor > heightFactor) {
        thumbnailPoint.y = (size.height - scaledSize.height) * 0.5;
    }
    else if (widthFactor < heightFactor) {
        thumbnailPoint.x = (size.width - scaledSize.width) * 0.5;
    }
    
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
    
    [self drawInRect:CGRectMake(thumbnailPoint.x, thumbnailPoint.y, scaledSize.width, scaledSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newImage;
}


- (UIColor *)averageColor
{
    CGImageRef rawImageRef = [self CGImage];
    
    // This function returns the raw pixel values
    CFDataRef data = CGDataProviderCopyData(CGImageGetDataProvider(rawImageRef));
    const UInt8 *rawPixelData = CFDataGetBytePtr(data);
    
    NSUInteger imageHeight = CGImageGetHeight(rawImageRef);
    NSUInteger imageWidth  = CGImageGetWidth(rawImageRef);
    NSUInteger bytesPerRow = CGImageGetBytesPerRow(rawImageRef);
    NSUInteger stride = CGImageGetBitsPerPixel(rawImageRef) / 8;
    
    // Here I sort the R,G,B, values and get the average over the whole image
    unsigned int red   = 0;
    unsigned int green = 0;
    unsigned int blue  = 0;
    
    for (int row = 0; row < imageHeight; row++) {
        const UInt8 *rowPtr = rawPixelData + bytesPerRow * row;
        for (int column = 0; column < imageWidth; column++) {
            red    += rowPtr[0];
            green  += rowPtr[1];
            blue   += rowPtr[2];
            rowPtr += stride;
            
        }
    }
    CFRelease(data);
    
    CGFloat f = 1.0f / (255.0f * imageWidth * imageHeight);
    return [UIColor colorWithRed:f * red  green:f * green blue:f * blue alpha:1];
}

- (UIColor *)mergedColor
{
    CGSize size = {1, 1};
    UIGraphicsBeginImageContext(size);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetInterpolationQuality(ctx, kCGInterpolationMedium);
    [self drawInRect:(CGRect){.size = size} blendMode:kCGBlendModeCopy alpha:1];
    uint8_t *data = CGBitmapContextGetData(ctx);
    UIColor *color = [UIColor colorWithRed:data[2] / 255.0f
                                     green:data[1] / 255.0f
                                      blue:data[0] / 255.0f
                                     alpha:1];
    UIGraphicsEndImageContext();
    return color;
}

- (NSString *) base64StringRepresentation {
    return [UIImageJPEGRepresentation(self, 0.7) base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
}

- (UIImage *) imageByRenderingWithTintColor:(UIColor*)tintColor {
    UIImage *newImage = [self imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    UIGraphicsBeginImageContextWithOptions(newImage.size, NO, newImage.scale);
    [tintColor set];
    [newImage drawInRect:CGRectMake(0, 0, newImage.size.width, newImage.size.height)];
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}


@end
