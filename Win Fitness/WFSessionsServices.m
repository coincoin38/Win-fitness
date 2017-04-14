//
//  WFSessionsServices.m
//  Win Fitness
//
//  Created by julien gimenez on 14/04/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "WFSessionsServices.h"
#import "WFJSONReader.h"

typedef void (^WFSessionHandler)(id result,NSError *error);

@implementation WFSessionsServices

- (RACSignal *)sessionsServiceSignal {
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [self parseSessions:^(id result, NSError *error) {


            [subscriber sendNext:nil];
            [subscriber sendCompleted];
        }];
        return [RACDisposable disposableWithBlock:^{}];
    }];
}

- (void)parseSessions:(WFSessionHandler)handler {

    NSArray <NSDictionary*> *week = [NSArray arrayWithObjects:[WFJSONReader JSONFromFile:@"Lundi"],
                      [WFJSONReader JSONFromFile:@"Mardi"],
                      [WFJSONReader JSONFromFile:@"Mercredi"],
                      [WFJSONReader JSONFromFile:@"Jeudi"],
                      [WFJSONReader JSONFromFile:@"Vendredi"],
                      [WFJSONReader JSONFromFile:@"Samedi"], nil];

    for (NSDictionary *sessions in week) {
        NSLog(@"sessions %@",sessions);
        for (id hour in sessions) {
            NSLog(@"hour %@",hour);
        }
    }
}

@end
