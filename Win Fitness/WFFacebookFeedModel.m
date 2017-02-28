//
//  WFFaceBookFeedModel.m
//  Win Fitness
//
//  Created by julien gimenez on 28/02/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "WFFacebookFeedModel.h"

@implementation WFFacebookFeedModel

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    
    if ((self = [super init])) {
        _identifier  = dictionary[@"id"];
        __description = dictionary[@"description"];
        _message  = dictionary[@"message"];
        _created_time = dictionary[@"created_time"];
        _full_picture = dictionary[@"full_picture"];
        _type = dictionary[@"type"];
        _actions = dictionary[@"actions"];
    }
    return self;
}

@end
