//
//  WFSportsServices.m
//  Win Fitness
//
//  Created by julien gimenez on 19/04/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "WFSportsServices.h"
#import "WFSessionModel.h"
#import "WFSportsProvider.h"
#import "WFSportModel.h"
#import "WFObjectiveModel.h"
#import "WFSportDescriptionModel.h"

@implementation WFSportsServices

- (RACSignal *)sportTitleForSessionsServiceSignal:(NSArray<WFSessionModel *> *)sessions {
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        if(sessions[0].sport) {
            [subscriber sendNext:sessions];
            [subscriber sendCompleted];
        }
        else{
            [self parseSports:^(NSArray *allSports, NSError *error) {
                for (WFSessionModel *session in sessions) {
                    if (!session.sport) {
                        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF.idSport == %d", session.idSport];
                        NSArray<WFSportModel *> *searchResults = [allSports filteredArrayUsingPredicate:predicate];
                        if (searchResults.count == 1) {
                            session.sport = searchResults[0];
                        }
                    }
                }
                [subscriber sendNext:sessions];
                [subscriber sendCompleted];
            }];
        }
        return [RACDisposable disposableWithBlock:^{}];
    }];
}

- (RACSignal *)completeObjectivesSport:(WFSportModel *)sport {
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        if([sport.objectives count]>0) {
            [subscriber sendNext:sport];
            [subscriber sendCompleted];
        }
        else{
            [self parseObjectives:^(NSArray *allObjectives, NSError *error) {
                NSPredicate *predicate = [NSPredicate predicateWithFormat:@"sport_id == %d", sport.idSport];
                NSArray<WFObjectiveModel *> *searchResults = [allObjectives filteredArrayUsingPredicate:predicate];
                if (searchResults.count > 1) {
                    sport.objectives = searchResults;
                }
                [subscriber sendNext:sport];
                [subscriber sendCompleted];
            }];
        }
        return [RACDisposable disposableWithBlock:^{}];
    }];
}

- (RACSignal *)completeDescriptionSport:(WFSportModel *)sport {
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        if(sport.sportDescription) {
            [subscriber sendNext:sport];
            [subscriber sendCompleted];
        }
        else{
            [self parseDescriptions:^(NSArray *allDescriptions, NSError *error) {
                NSPredicate *predicate = [NSPredicate predicateWithFormat:@"key_sport == %d", sport.idSport];
                NSArray<WFSportDescriptionModel *> *searchResults = [allDescriptions filteredArrayUsingPredicate:predicate];
                if (searchResults.count == 1) {
                    sport.sportDescription = searchResults[0];
                }
                [subscriber sendNext:sport];
                [subscriber sendCompleted];
            }];;
        }
        return [RACDisposable disposableWithBlock:^{}];
    }];
}

- (RACSignal *)allSportsServiceSignal {
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [self parseSports:^(NSArray *allSports, NSError *error) {
            [subscriber sendNext:allSports];
            [subscriber sendCompleted];
        }];
        return [RACDisposable disposableWithBlock:^{}];
    }];
}

- (RACSignal *)allObjectivesServiceSignal {
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [self parseObjectives:^(NSArray *allSports, NSError *error) {
            [subscriber sendNext:allSports];
            [subscriber sendCompleted];
        }];
        return [RACDisposable disposableWithBlock:^{}];
    }];
}

- (RACSignal *)allDescriptionsServiceSignal {
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [self parseDescriptions:^(NSArray *allSports, NSError *error) {
            [subscriber sendNext:allSports];
            [subscriber sendCompleted];
        }];
        return [RACDisposable disposableWithBlock:^{}];
    }];
}

- (void)parseSports:(WFServiceHandler)handler {
    handler([[WFSportsProvider sharedInstance]allSports], nil);
}

- (void)parseObjectives:(WFServiceHandler)handler {
    handler([[WFSportsProvider sharedInstance]allObjectives], nil);
}

- (void)parseDescriptions:(WFServiceHandler)handler {
    handler([[WFSportsProvider sharedInstance]allDescriptions], nil);
}

@end
