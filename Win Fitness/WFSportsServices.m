//
//  WFSportsServices.m
//  Win Fitness
//
//  Created by julien gimenez on 19/04/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "WFSportsServices.h"
#import "WFSportModel+Additions.h"
#import "WFSessionModel.h"

@implementation WFSportsServices

- (RACSignal *)sportTitleForSessionsServiceSignal:(NSArray<WFSessionModel *> *)sessions {
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [self parseSessions:^(NSArray *allSports, NSError *error) {
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
        return [RACDisposable disposableWithBlock:^{}];
    }];
}

- (void)parseSessions:(WFServiceHandler)handler {
    handler([[WFSportModel new]allSports], nil);
}

@end
