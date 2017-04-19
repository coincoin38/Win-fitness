//
//  WFSessionsServices.m
//  Win Fitness
//
//  Created by julien gimenez on 14/04/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "WFSessionsServices.h"
#import "WFDaySessionModel.h"
#import "WFDaySessionModel+Additions.h"

typedef void (^WFSessionHandler)(id result,NSError *error);

@implementation WFSessionsServices

- (RACSignal *)sessionsServiceSignal {
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [self parseSessions:^(NSArray *result, NSError *error) {
            [subscriber sendNext:result];
            [subscriber sendCompleted];
        }];
        return [RACDisposable disposableWithBlock:^{}];
    }];
}

- (void)parseSessions:(WFSessionHandler)handler {
    handler([[WFDaySessionModel new]weekSessions], nil);
}

@end
