//
//  UIColor+Additions.m
//  Win Fitness
//
//  Created by julien gimenez on 31/03/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "UIColor+Additions.h"

@implementation UIColor (Additions)

+ (UIColor *)orangeWF {
    return [UIColor colorWithRed:237.0/255.0 green:134.0/255.0 blue:47.0/255.0 alpha:1];
}

+ (UIColor *)darkGrayWF {
    return [UIColor colorWithRed:36.0/255.0 green:32.0/255.0 blue:33.0/255.0 alpha:0.95];
}

+ (UIColor *)lightGrayWF {
    return [UIColor colorWithRed:142.0/255.0 green:131.0/255.0 blue:125.0/255.0 alpha:1];
}

+ (UIColor *)veryLightGrayWF {
    return [UIColor colorWithRed:250.0/255.0 green:250.0/255.0 blue:250.0/255.0 alpha:1];
}

+ (UIColor *)greenWF {
    return [UIColor colorWithRed:177.0/255.0 green:189.0/255.0 blue:156.0/255.0 alpha:1];
}

+ (UIColor *)blueFacebook {
    return [UIColor colorWithRed:59.0/255.0 green:89.0/255.0 blue:152.0/255.0 alpha:1];
}

+ (UIColor *) colorFromHexString:(NSString *)hexString {
    NSString *cleanString = [hexString stringByReplacingOccurrencesOfString:@"#" withString:@""];
    if([cleanString length] == 3) {
        cleanString = [NSString stringWithFormat:@"%@%@%@%@%@%@",
                       [cleanString substringWithRange:NSMakeRange(0, 1)],[cleanString substringWithRange:NSMakeRange(0, 1)],
                       [cleanString substringWithRange:NSMakeRange(1, 1)],[cleanString substringWithRange:NSMakeRange(1, 1)],
                       [cleanString substringWithRange:NSMakeRange(2, 1)],[cleanString substringWithRange:NSMakeRange(2, 1)]];
    }
    if([cleanString length] == 6) {
        cleanString = [cleanString stringByAppendingString:@"ff"];
    }

    unsigned int baseValue;
    [[NSScanner scannerWithString:cleanString] scanHexInt:&baseValue];

    float red = ((baseValue >> 24) & 0xFF)/255.0f;
    float green = ((baseValue >> 16) & 0xFF)/255.0f;
    float blue = ((baseValue >> 8) & 0xFF)/255.0f;
    float alpha = ((baseValue >> 0) & 0xFF)/255.0f;

    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

@end
