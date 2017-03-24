//
//  WFCustomLabel.m
//  Win Fitness
//
//  Created by julien gimenez on 24/03/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "WFCustomLabel.h"

@implementation WFCustomLabel

- (instancetype)initWithFrame:(CGRect)frame andStyle:(styles)type {
    self = [super initWithFrame:frame];
    if (self) {
        if (type == DateStyle) {
            [self setDayStyle];
        }
    }
    return self;
}

- (void)setDayStyle {
    self.font = [UIFont boldSystemFontOfSize:12];
    self.backgroundColor = [UIColor whiteColor];
}

- (void)drawRect:(CGRect)rect {
    UIEdgeInsets insets = {0, 5, 0, 0};
    return [super drawTextInRect:UIEdgeInsetsInsetRect(rect, insets)];
}

@end
