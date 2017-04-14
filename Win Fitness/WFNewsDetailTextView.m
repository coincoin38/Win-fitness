//
//  WFNewsDetailTextView.m
//  Win Fitness
//
//  Created by julien gimenez on 10/04/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "WFNewsDetailTextView.h"
#import "UIColor+Additions.h"

@interface WFNewsDetailTextView ()

@property(nonatomic,strong) NSString *name;

@end

@implementation WFNewsDetailTextView

- (instancetype)initWithFrame:(CGRect)frame withName:(NSString *)name {
    self = [super initWithFrame:frame];
    if (self) {
        _name = name;
        self.scrollEnabled = NO;
        self.userInteractionEnabled = NO;
        self.textAlignment = NSTextAlignmentLeft;
    }
    return self;
}

- (void)setText:(NSString *)text {
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:text];
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(0, text.length)];
    [str addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:16] range:NSMakeRange(0, text.length)];

    // Name of the shared entity
    if (self.name) {
        NSRange rangeName = [text rangeOfString:self.name];
        if (rangeName.length) {
            [str addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:rangeName];
            [str addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:16] range:rangeName];
        }
    }

    // Name of the product
    NSRange rangeProduct = [text rangeOfString:WFLocalisedString(@"WINFITNESS")];
    if (rangeProduct.length) {
        [str addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:rangeProduct];
        [str addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:16] range:rangeProduct];
    }

    self.attributedText = str;
}

@end
