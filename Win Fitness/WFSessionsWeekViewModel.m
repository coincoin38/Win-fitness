//
//  WFSessionsViewModel.m
//  Win Fitness
//
//  Created by julien gimenez on 14/04/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "WFSessionModel.h"
#import "WFSessionsServices.h"
#import "WFSessionsWeekViewModel.h"

@interface WFSessionsWeekViewModel ()

@property (nonatomic, strong) WFSessionsServices *services;

@end

@implementation WFSessionsWeekViewModel

- (instancetype)initWithSessionsServices:(WFSessionsServices *)services {
    self = [super init];
    if (self) {
        _services = services;
        [self startSessionsWeekParsing];
    }
    return self;
}

- (void)startSessionsWeekParsing {
    @weakify(self)
    [[self.sessionsWeekCommand execute:self]subscribeNext:^(id sessions) {
        @strongify(self)
        [self checkResultParsing:sessions];
    }];
}

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
