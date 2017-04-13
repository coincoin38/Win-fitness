//
//  WFFooterButtonNewsDetails.m
//  Win Fitness
//
//  Created by julien gimenez on 31/03/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "WFFooterButtonNewsDetails.h"
#import "UIColor+Additions.h"

@implementation WFFooterButtonNewsDetails

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor blueFacebook];
        [self setImage:[UIImage imageNamed:@"fb-art"] forState:UIControlStateNormal];
        [self.imageView setContentMode:UIViewContentModeScaleAspectFit];
        self.imageEdgeInsets = UIEdgeInsetsMake(0, 4, 4, 0);
    }
    return self;
}

@end
