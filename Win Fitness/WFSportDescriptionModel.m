//
//  WFSportDescriptionModel.m
//  Win Fitness
//
//  Created by julien gimenez on 14/04/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "WFSportDescriptionModel.h"

@implementation WFSportDescriptionModel

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    if ((self = [super init])) {
        _key_sport  = [dictionary[@"key_sport"] integerValue];
        _content = dictionary[@"content"];
    }
    return self;
}

@end
