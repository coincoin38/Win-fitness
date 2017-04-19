//
//  WFSportsServices.m
//  Win Fitness
//
//  Created by julien gimenez on 19/04/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "WFSportsServices.h"
#import "WFSportModel+Additions.h"

typedef void (^WFSportHandler)(id result,NSError *error);

@implementation WFSportsServices

- (RACSignal *)sportTitleServiceSignal {
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [self parseSessions:^(NSArray *result, NSError *error) {
            [subscriber sendNext:result];
            [subscriber sendCompleted];
        }];
        return [RACDisposable disposableWithBlock:^{}];
    }];
}

- (void)parseSessions:(WFSportHandler)handler {
    handler([[WFSportModel new]allSports], nil);
}

@end
