//
//  WFHeaderNewsDetailLabel.m
//  Win Fitness
//
//  Created by julien gimenez on 31/03/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "WFHeaderNewsDetailsTitleLabel.h"
#import "WFDatesConverter.h"

@interface WFHeaderNewsDetailsTitleLabel ()

@property(nonatomic,strong) NSString *name;

@end

@implementation WFHeaderNewsDetailsTitleLabel

- (instancetype)initWithFrame:(CGRect)frame withName:(NSString *)name {
    self = [super initWithFrame:frame];
    if (self) {
        _name = name;
        self.textAlignment = NSTextAlignmentLeft;
        self.numberOfLines = 0;
    }
    return self;
}

- (void)setText:(NSString *)text {
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:text];
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor darkGrayWF] range:NSMakeRange(0, text.length)];
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
    NSRange rangeProduct = [text rangeOfString:NSLocalizedString(@"WINFITNESS", nil)];
    if (rangeProduct.length) {
        [str addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:rangeProduct];
        [str addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:16] range:rangeProduct];
    }
    
    self.attributedText = str;
}

@end
