//
//  WFSportsServices.h
//  Win Fitness
//
//  Created by julien gimenez on 19/04/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "WFService.h"

@class WFSessionModel;

@interface WFSportsServices : WFService

- (RACSignal *)sportTitleForSessionsServiceSignal:(NSArray<WFSessionModel *> *)session;

@end
