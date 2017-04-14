//
//  WFSessionsServices.m
//  Win Fitness
//
//  Created by julien gimenez on 14/04/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "WFSessionsServices.h"
#import "WFDaySessionModel.h"
#import "WFJSONReader.h"

typedef NS_ENUM(NSInteger, WFDays) {
    Monday    = 0,
    Tuesday   = 1,
    Wednesday = 2,
    Thursday = 3,
    Friday = 4,
    Saturday = 5
};

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

    WFDaySessionModel * monday = [[WFDaySessionModel alloc]initWithArrayOfHours:[WFJSONReader JSONFromFile:@"Lundi"].allValues
                                                                        withDay:Monday];
    WFDaySessionModel * tuesday = [[WFDaySessionModel alloc]initWithArrayOfHours:[WFJSONReader JSONFromFile:@"Mardi"].allValues
                                                                         withDay:Tuesday];
    WFDaySessionModel * wednesday = [[WFDaySessionModel alloc]initWithArrayOfHours:[WFJSONReader JSONFromFile:@"Mercredi"].allValues
                                                                           withDay:Wednesday];
    WFDaySessionModel * thursday = [[WFDaySessionModel alloc]initWithArrayOfHours:[WFJSONReader JSONFromFile:@"Jeudi"].allValues
                                                                          withDay:Thursday];
    WFDaySessionModel * friday = [[WFDaySessionModel alloc]initWithArrayOfHours:[WFJSONReader JSONFromFile:@"Vendredi"].allValues
                                                                        withDay:Friday];
    WFDaySessionModel * saturday = [[WFDaySessionModel alloc]initWithArrayOfHours:[WFJSONReader JSONFromFile:@"Samedi"].allValues
                                                                          withDay:Saturday];

    NSArray *arrayOfSessions = [NSArray arrayWithObjects:monday, tuesday, wednesday, thursday, friday, saturday, nil];
    handler(arrayOfSessions, nil);

}

@end
