//
//  WFSportModel.m
//  Win Fitness
//
//  Created by julien gimenez on 14/04/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "WFSportModel.h"

@implementation WFSportModel

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    if ((self = [super init])) {
        _idSport  = dictionary[@"id"];
        _name = dictionary[@"name"];
        _description_id = dictionary[@"description_id"];
        _color  = dictionary[@"color"];
        _image = dictionary[@"image"];
    }
    return self;
}

@end
