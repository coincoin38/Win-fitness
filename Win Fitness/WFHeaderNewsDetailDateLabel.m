//
//  WFHeaderNewsDetailDateLabel.m
//  Win Fitness
//
//  Created by julien gimenez on 10/04/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "WFHeaderNewsDetailDateLabel.h"
#import "WFDatesConverter.h"

@interface WFHeaderNewsDetailDateLabel ()

@property(nonatomic,strong) NSString *createdTime;

@end

@implementation WFHeaderNewsDetailDateLabel

- (instancetype)initWithFrame:(CGRect)frame withCreatedTime:(NSString *)createdTime {
    self = [super initWithFrame:frame];
    if (self) {
        _createdTime = createdTime;
        self.font = [UIFont systemFontOfSize:14];
        self.textColor = [UIColor grayColor];
        self.textAlignment = NSTextAlignmentLeft;
        self.numberOfLines = 0;
    }
    return self;
}

@end
