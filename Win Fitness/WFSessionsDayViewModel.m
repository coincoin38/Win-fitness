//
//  WFSessionsDayViewModel.m
//  Win Fitness
//
//  Created by julien gimenez on 19/04/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "WFSessionsDayViewModel.h"
#import "WFSportsServices.h"
#import "WFSessionModel+Additions.h"
#import "WFSportModel.h"

@interface WFSessionsDayViewModel ()

@property (nonatomic, strong) WFSportsServices *services;

@end

@implementation WFSessionsDayViewModel

- (instancetype)initWithSportsServices:(WFSportsServices *)services withSessions:(WFDaySessionModel *)sessions {
    self = [super init];
    if (self) {
        _services = services;
        _daySessions = sessions;
        [self startSportParsing];
    }
    return self;
}

- (void)startSportParsing {
    @weakify(self)
    [[self.sportsCommand execute:self]subscribeNext:^(id sessions) {
        @strongify(self)
        [self checkResultParsing:sessions];
    }];
}

- (void)checkResultParsing:(id)sports {
    if ([sports isKindOfClass:[NSError class]]) {
        [self errorParsingSports];
    }
    else {
        self.allSports = sports;

        for (WFSessionModel *session in self.daySessions.sessions) {
            NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF.idSport LIKE[c] %@", session.idSport];
            NSArray<WFSportModel *> *searchResults = [self.allSports filteredArrayUsingPredicate:predicate];
            if (searchResults.count == 1) {
                session.titleSport = searchResults[0].name;
            }
        }
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
    return [[self.services sportTitleServiceSignal]deliverOnMainThread];
}

- (void)errorParsingSports {

}

@end
