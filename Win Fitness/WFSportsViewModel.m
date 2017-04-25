//
//  WFSportsViewModel.m
//  Win Fitness
//
//  Created by julien gimenez on 25/04/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "WFSportsViewModel.h"
#import "WFSportsServices.h"

@interface WFSportsViewModel ()

@property (nonatomic, strong) WFSportsServices *services;

@end

@implementation WFSportsViewModel

- (instancetype)initWithSportsServices:(WFSportsServices *)services {
    self = [super init];
    if (self) {
        _services = services;
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
    else {
        self.sportsList = sports;
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
    return [[self.services allSportsServiceSignal]deliverOnMainThread];
}

- (void)errorParsingSports {

}

@end
