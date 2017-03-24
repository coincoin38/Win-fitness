//
//  WFCustomTextView.m
//  Win Fitness
//
//  Created by julien gimenez on 24/03/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "WFCustomTextView.h"

@implementation WFCustomTextView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.scrollEnabled = NO;
        self.userInteractionEnabled = NO;
        self.textAlignment = NSTextAlignmentJustified;
        self.font = [UIFont systemFontOfSize:14];
    }
    return self;
}

@end
