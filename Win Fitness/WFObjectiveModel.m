//
//  WFObjectiveModel.m
//  Win Fitness
//
//  Created by julien gimenez on 14/04/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "WFObjectiveModel.h"

@implementation WFObjectiveModel

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    if ((self = [super init])) {
        _sport_id  = [dictionary[@"sport_id"] integerValue];
        _firstPart = dictionary[@"firstPart"];
        _secondPart = dictionary[@"secondPart"];
    }
    return self;
}

@end
