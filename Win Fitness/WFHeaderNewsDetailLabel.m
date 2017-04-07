//
//  WFHeaderNewsDetailLabel.m
//  Win Fitness
//
//  Created by julien gimenez on 31/03/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "WFHeaderNewsDetailLabel.h"
#import "UIColor+Additions.h"
#import "WFDatesConverter.h"

@interface WFHeaderNewsDetailLabel ()

@property(nonatomic,strong) NSString *name;
@property(nonatomic,strong) NSString *createdTime;

@end

@implementation WFHeaderNewsDetailLabel

- (instancetype)initWithFrame:(CGRect)frame withName:(NSString *)name withCreatedTime:(NSString *)createdTime {
    self = [super initWithFrame:frame];
    if (self) {
        _name = name;
        _createdTime = createdTime;
        self.font = [UIFont systemFontOfSize:16];
        self.textColor = [UIColor darkGrayWF];
        self.textAlignment = NSTextAlignmentLeft;
        self.numberOfLines = 0;
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame withCreatedTime:(NSString *)createdTime {
    self = [super initWithFrame:frame];
    if (self) {
        _createdTime = createdTime;
        self.font = [UIFont systemFontOfSize:16];
        self.textColor = [UIColor darkGrayWF];
        self.textAlignment = NSTextAlignmentLeft;
        self.numberOfLines = 0;
    }
    return self;
}

- (void)setText:(NSString *)text {
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:text];

    // Name of the shared entity
    if (self.name) {
        NSRange rangeName = [text rangeOfString:self.name];
        if (rangeName.length) {
            [str addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:rangeName];
            [str addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:16] range:rangeName];
        }
    }

    // Name of the product
    NSRange rangeProduct = [text rangeOfString:NSLocalizedString(@"WINFITNESS", nil)];
    if (rangeProduct.length) {
        [str addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:rangeProduct];
        [str addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:16] range:rangeProduct];
    }

    // Date
    NSRange rangeDateProduct = [text rangeOfString:[WFDatesConverter formatddMMMMHHmmFromDateString:self.createdTime]];
    if (rangeDateProduct.length) {
        [str addAttribute:NSForegroundColorAttributeName value:[UIColor darkGrayWF] range:rangeDateProduct];
        [str addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:13] range:rangeDateProduct];
    }

    self.attributedText = str;
}

- (void)drawRect:(CGRect)rect {
    UIEdgeInsets insets = {0, 5, 0, 0};
    return [super drawTextInRect:UIEdgeInsetsInsetRect(rect, insets)];
}

@end
