//
//  WFSessionsDayViewModel.m
//  Win Fitness
//
//  Created by julien gimenez on 19/04/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "WFSessionsDayViewModel.h"
#import "WFSportsServices.h"
#import "WFSessionModel.h"

@interface WFSessionsDayViewModel ()

@property (nonatomic, strong) WFSportsServices *services;

@end

@implementation WFSessionsDayViewModel

#pragma mark - Init

- (instancetype)initWithSportsServices:(WFSportsServices *)services withSessions:(WFDaySessionModel *)sessions {
    self = [super init];
    if (self) {
        _services = services;
        _daySessions = sessions;
        [self startSportParsing];
    }
    return self;
}

#pragma mark - Actions

- (void)startSportParsing {
    @weakify(self)
    [[self.sportsCommand execute:self]subscribeNext:^(id sessions) {
        @strongify(self)
        [self checkResultParsing:sessions];
    }];
}

#pragma mark - Checks

- (void)checkResultParsing:(id)sports {
    if ([sports isKindOfClass:[NSError class]]) {
        [self errorParsingSports];
    }
}

#pragma mark - Commands

- (RACCommand *)sportsCommand {
    return [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        return [self sportSignal];
    }];
}

#pragma mark - Signals

- (RACSignal *)sportSignal {
    return [[self.services sportTitleForSessionsServiceSignal:self.daySessions.sessions]deliverOnMainThread];
}

- (void)errorParsingSports {

}

@end
