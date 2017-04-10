//
//  WFCustomLabel.m
//  Win Fitness
//
//  Created by julien gimenez on 24/03/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "WFHeaderCellLabel.h"

@implementation WFHeaderCellLabel

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.font = [UIFont boldSystemFontOfSize:14];
        self.textColor = [UIColor darkGrayWF];
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

@end
