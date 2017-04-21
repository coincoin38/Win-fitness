//
//  WFSessionsViewModel.m
//  Win Fitness
//
//  Created by julien gimenez on 14/04/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "WFSessionsServices.h"
#import "WFSessionsWeekViewModel.h"
#import "WFSessionsDayViewModel.h"
#import "WFSportsServices.h"
#import "WFDaySessionsViewController.h"

@interface WFSessionsWeekViewModel ()

@property (nonatomic, strong) WFSessionsServices *services;

@end

@implementation WFSessionsWeekViewModel

#pragma mark - Init

- (instancetype)initWithSessionsServices:(WFSessionsServices *)services {
    self = [super init];
    if (self) {
        _services = services;
        [self startSessionsWeekParsing];
    }
    return self;
}

#pragma mark - Actions

- (void)startSessionsWeekParsing {
    @weakify(self)
    [[self.sessionsWeekCommand execute:self]subscribeNext:^(id sessions) {
        @strongify(self)
        [self checkResultParsing:sessions];
    }];
}

- (WFDaySessionsViewController *)clickSessionsWithSessionsType:(WFSessionsType)type forDay:(NSInteger)day {
    if (self.sessionsWeek.rpmSessions[day] && type == RPM) {
        return [[WFDaySessionsViewController alloc]initWithSessionsDayViewModel:[self rpmViewModel:day]];
    }
    if (self.sessionsWeek.millsSessions[day] && type == MILLS) {
        return [[WFDaySessionsViewController alloc]initWithSessionsDayViewModel:[self millsViewModel:day]];
    }

    return nil;
}

- (WFSessionsDayViewModel *)millsViewModel:(NSInteger)day {
    return [[WFSessionsDayViewModel alloc]initWithSportsServices:[WFSportsServices new]
                                                    withSessions:(WFDaySessionModel *)self.sessionsWeek.millsSessions[day]];
}

- (WFSessionsDayViewModel *)rpmViewModel:(NSInteger)day {
    return [[WFSessionsDayViewModel alloc]initWithSportsServices:[WFSportsServices new]
                                                    withSessions:(WFDaySessionModel *)self.sessionsWeek.rpmSessions[day]];
}

#pragma mark - Checks

- (void)checkResultParsing:(id)sessions {
    if ([sessions isKindOfClass:[NSError class]]) {
        [self errorParsingSessions];
    }
    else {
        self.sessionsWeek = sessions;
    }
}

#pragma mark - Commands

- (RACCommand *)sessionsWeekCommand {
    return [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        return [self sessionsWeekSignal];
    }];
}

#pragma mark - Signals

- (RACSignal *)sessionsWeekSignal {
    return [[self.services sessionsServiceSignal]deliverOnMainThread];
}

- (void)errorParsingSessions {

}

@end
