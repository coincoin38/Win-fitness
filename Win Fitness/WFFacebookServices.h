//
//  WFFaceBookServices.h
//  Win Fitness
//
//  Created by julien gimenez on 27/02/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "WFService.h"

@class WFFacebookFeedModel;

@interface WFFacebookServices : WFService

- (instancetype)initService;
- (RACSignal *)newsServiceSignal;

@end
