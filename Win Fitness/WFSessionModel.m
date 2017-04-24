//
//  WFSessionModel.m
//  Win Fitness
//
//  Created by julien gimenez on 14/04/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "WFSessionModel.h"

@implementation WFSessionModel

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    if ((self = [super init])) {
        _idSport = [dictionary[@"sport_id"] integerValue];
        _from  = dictionary[@"from"];
        _duration = dictionary[@"duration"];
        _attendance = [dictionary[@"attendance"] boolValue];
        _day = dictionary[@"day"];
    }
    return self;
}

@end
