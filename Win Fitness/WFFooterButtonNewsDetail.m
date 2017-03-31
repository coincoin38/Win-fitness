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
        self.backgroundColor = [UIColor blueFacebook];
        self.titleLabel.textColor = [UIColor redColor];
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor lightGrayWF] forState:UIControlStateHighlighted];
        self.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    }
    return self;
}

@end
