//
//  WFSportModel.m
//  Win Fitness
//
//  Created by julien gimenez on 14/04/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "WFSportModel.h"
#import "UIColor+Additions.h"

@implementation WFSportModel

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    if ((self = [super init])) {
        _idSport  = [dictionary[@"id"] integerValue];
        _name = dictionary[@"name"];
        _description_id = dictionary[@"description_id"];
        _colorString  = dictionary[@"color"];
        _image = dictionary[@"image"];
        _colorFromHexa = [UIColor colorFromHexString:self.colorString];
    }
    return self;
}

- (void)addDescription:(WFSportDescriptionModel *)description withObjectives:(NSArray<WFObjectiveModel *>*)objectives {
    
}

@end
