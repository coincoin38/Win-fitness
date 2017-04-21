//
//  WFFullSessionsModel.m
//  Win Fitness
//
//  Created by julien gimenez on 21/04/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "WFFullSessionsModel.h"

@implementation WFFullSessionsModel

- (instancetype)initWithMillsSessions:(NSArray *)millsArray withRpmSessions:(NSArray *)rpmArray {
    if ((self = [super init])) {
        _millsSessions = millsArray;
        _rpmSessions = rpmArray;
    }
    return self;
}

@end
