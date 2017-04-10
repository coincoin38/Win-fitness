//
//  WFFooterButtonNewsDetail.m
//  Win Fitness
//
//  Created by julien gimenez on 31/03/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "WFFooterButtonNewsDetail.h"
#import "UIColor+Additions.h"

@implementation WFFooterButtonNewsDetail

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self setTitleColor:[UIColor blueFacebook] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor lightGrayWF] forState:UIControlStateHighlighted];
        self.titleLabel.font = [UIFont boldSystemFontOfSize:16];
        self.titleLabel.numberOfLines = 0;
        self.titleLabel.textAlignment = NSTextAlignmentLeft;
        self.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
        self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    }
    return self;
}

@end
