//
//  WFSessionsViewModel.h
//  Win Fitness
//
//  Created by julien gimenez on 14/04/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "WFBaseViewModel.h"
#import "WFDaySessionModel.h"

@class WFSportModel;
@class WFSessionsServices;
@class WFSessionModel;

typedef void (^WFSessionHandler)(id result,NSError *error);

@interface WFSessionsWeekViewModel : WFBaseViewModel

@property (nonatomic, strong) RACCommand *sessionsWeekCommand;
@property (nonatomic, strong) NSArray<WFDaySessionModel *> *sessionsWeek;
@property (nonatomic) BOOL isLoading;

- (instancetype)initWithSessionsServices:(WFSessionsServices *)services;

@end
