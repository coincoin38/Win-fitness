//
//  WFSportsViewModel.m
//  Win Fitness
//
//  Created by julien gimenez on 25/04/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "WFSportsViewModel.h"
#import "WFSportsServices.h"
#import "WFSportModel.h"

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
    [[self.sportsCommand execute:self]subscribeNext:^(id sports) {
        @strongify(self)
        [self checkResultParsing:sports];
    }];
}

- (void)startSportCompletionParsing {
    @weakify(self)
    [[self.objectivesSportCommand execute:self]subscribeNext:^(id sport) {
        @strongify(self)
        self.selectedSport = sport;
        NSLog(@"objectives %@",self.selectedSport.objectives);
    }];
    [[self.descriptionSportCommand execute:self]subscribeNext:^(id sport) {
        @strongify(self)
        self.selectedSport = sport;
        NSLog(@"sportDescription %@",self.selectedSport.sportDescription);
    }];
}

#pragma mark - Checks

- (void)checkResultParsing:(id)sports {
    if ([sports isKindOfClass:[NSError class]]) {
        [self errorParsingSports];
    }
    else {
        self.sportsList = sports;
        //[self startSportCompletionParsing];
    }
}

#pragma mark - Commands

- (RACCommand *)sportsCommand {
    return [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        return [self sportSignal];
    }];
}

- (RACCommand *)objectivesSportCommand {
    return [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        return [self objectivesSportSignal];
    }];
}

- (RACCommand *)descriptionSportCommand {
    return [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        return [self descriptionSportSignal];
    }];
}

#pragma mark - Signals

- (RACSignal *)sportSignal {
    return [[self.services allSportsServiceSignal]deliverOnMainThread];
}

- (RACSignal *)objectivesSportSignal {
    return [[self.services completeObjectivesSport:self.selectedSport]deliverOnMainThread];
}

- (RACSignal *)descriptionSportSignal {
    return [[self.services completeDescriptionSport:self.selectedSport]deliverOnMainThread];
}

- (void)errorParsingSports {

}

@end
