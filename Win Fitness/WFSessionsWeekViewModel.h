//
//  WFSessionsViewModel.h
//  Win Fitness
//
//  Created by julien gimenez on 14/04/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "WFBaseViewModel.h"
#import "WFDaySessionModel.h"
#import "WFFullSessionsModel.h"

@class WFSessionsServices;
@class WFSessionModel;
@class WFDaySessionsListViewController;

@interface WFSessionsWeekViewModel : WFBaseViewModel

@property (nonatomic, strong) RACCommand *sessionsWeekCommand;
@property (nonatomic, strong) WFFullSessionsModel *sessionsWeek;

- (instancetype)initWithSessionsServices:(WFSessionsServices *)services;
- (WFDaySessionsListViewController *)clickSessionsWithSessionsType:(WFSessionsType)type forDay:(NSInteger)day;

@end
