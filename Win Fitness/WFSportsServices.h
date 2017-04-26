//
//  WFSportsServices.h
//  Win Fitness
//
//  Created by julien gimenez on 19/04/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "WFService.h"

@class WFSessionModel;
@class WFSportModel;

@interface WFSportsServices : WFService

- (RACSignal *)sportTitleForSessionsServiceSignal:(NSArray<WFSessionModel *> *)session;
- (RACSignal *)completeObjectivesSport:(WFSportModel *)sport;
- (RACSignal *)completeDescriptionSport:(WFSportModel *)sport;
- (RACSignal *)allSportsServiceSignal;

@end
