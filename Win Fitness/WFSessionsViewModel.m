//
//  WFSessionsViewModel.m
//  Win Fitness
//
//  Created by julien gimenez on 14/04/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "WFSessionsViewModel.h"
#import "WFSessionModel.h"
#import "WFSessionsServices.h"

@interface WFSessionsViewModel ()

@property (nonatomic, strong) WFSessionsServices *services;

@end

@implementation WFSessionsViewModel

- (instancetype)initWithSessionsServices:(WFSessionsServices *)services {
    self = [super init];
    if (self) {
        _services = services;
        [self startSessionsParsing];
    }
    return self;
}

- (void)startSessionsParsing {
    @weakify(self)
    [[self.sessionsCommand execute:self]subscribeNext:^(id sessions) {
        @strongify(self)
        [self checkResultParsing:sessions];
    }];
}

- (void)checkResultParsing:(id)sessions {
    if ([sessions isKindOfClass:[NSError class]]) {
        [self errorParsingSessions];
    }
    else {
        self.sessions = sessions;
    }
}

#pragma mark - Commands

- (RACCommand *)sessionsCommand {
    return [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        return [self sessionsSignal];
    }];
}

#pragma mark - Signals

- (RACSignal *)sessionsSignal {
    return [[self.services sessionsServiceSignal]deliverOnMainThread];
}

- (void)errorParsingSessions {

}

@end
