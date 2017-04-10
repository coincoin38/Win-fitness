//
//  WFBaseLabel.m
//  Win Fitness
//
//  Created by julien gimenez on 10/04/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "WFBaseLabel.h"

@implementation WFBaseLabel

- (void)drawRect:(CGRect)rect {
    UIEdgeInsets insets = {0, 5, 0, 0};
    return [super drawTextInRect:UIEdgeInsetsInsetRect(rect, insets)];
}

@end
