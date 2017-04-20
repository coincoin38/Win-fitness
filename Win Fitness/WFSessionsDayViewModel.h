//
//  WFSessionsDayViewModel.h
//  Win Fitness
//
//  Created by julien gimenez on 19/04/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "WFBaseViewModel.h"
#import "WFDaySessionModel.h"

@class WFSportsServices;
@class WFSportModel;

@interface WFSessionsDayViewModel : WFBaseViewModel

@property (nonatomic, strong) WFDaySessionModel *daySessions;
@property (nonatomic, strong) RACCommand *sportsCommand;

- (instancetype)initWithSportsServices:(WFSportsServices *)services withSessions:(WFDaySessionModel *)sessions;

@end
