//
//  UIColor+Up.h
//  魔灵召唤占领
//
//  Created by Future on 2022/2/23.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (Up)
+ (UIColor *)colorWithHexString:(NSString *)stringToConvert;

+ (UIColor *)colorWithHexString:(NSString *)stringToConvert withAlpha:(CGFloat)alpha;

+ (UIColor *)colorWithRGBHex:(UInt32)hex ;

+ (UIColor *)colorWithRGBAlphaHex:(UInt32)hex ;

+ (UIColor *)colorWithRGBHex:(UInt32)hex withAlpha:(CGFloat)alpha;
 
- (NSString *)hexadecimalFromUIColor;
@end

NS_ASSUME_NONNULL_END
