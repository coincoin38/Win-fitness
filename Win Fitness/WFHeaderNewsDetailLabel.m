//
//  WFHeaderNewsDetailLabel.m
//  Win Fitness
//
//  Created by julien gimenez on 31/03/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "WFHeaderNewsDetailLabel.h"
#import "UIColor+Additions.h"

@interface WFHeaderNewsDetailLabel ()

@property(nonatomic,strong) NSString *name;

@end

@implementation WFHeaderNewsDetailLabel

- (instancetype)initWithFrame:(CGRect)frame withName:(NSString *)name {
    self = [super initWithFrame:frame];
    if (self) {
        _name = name;
        self.font = [UIFont systemFontOfSize:16];
        self.textColor = [UIColor lightGrayWF];
        //self.backgroundColor = [UIColor lightGrayWF];
        self.numberOfLines = 0;
    }
    return self;
}

- (void)setText:(NSString *)text {
    NSRange rangeProduct = [text rangeOfString:NSLocalizedString(@"WINFITNESS", nil)];
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:text];

    if (self.name) {
        NSRange rangeName = [text rangeOfString:self.name];
        if (rangeName.length) {
            [str addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:rangeName];
            [str addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:16] range:rangeName];
        }
    }

    if (rangeProduct.length) {
        [str addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:rangeProduct];
        [str addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:16] range:rangeProduct];
    }

    self.attributedText = str;
}

- (void)drawRect:(CGRect)rect {
    UIEdgeInsets insets = {0, 5, 0, 0};
    return [super drawTextInRect:UIEdgeInsetsInsetRect(rect, insets)];
}

@end
