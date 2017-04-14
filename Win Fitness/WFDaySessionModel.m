//
//  WFDaySessionModel.m
//  Win Fitness
//
//  Created by julien gimenez on 14/04/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "WFDaySessionModel.h"
#import "WFSessionModel.h"

@implementation WFDaySessionModel

- (instancetype)initWithArrayOfHours:(NSArray *)hours withDay:(NSInteger)day {
    if ((self = [super init])) {
        _sessions = [NSMutableArray new];
        _day = day;
        for (id sessions in hours[0]) {
            WFSessionModel * session = [[WFSessionModel alloc]initWithDictionary:sessions];
            [_sessions addObject:session];
        }
    }
    return self;
}

@end
