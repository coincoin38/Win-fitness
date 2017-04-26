//
//  WFSportsProvider.m
//  Win Fitness
//
//  Created by julien gimenez on 25/04/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "WFSportsProvider.h"
#import "WFJSONReader.h"
#import "WFSessionsConstants.h"
#import "WFSportModel.h"
#import "WFObjectiveModel.h"
#import "WFSportDescriptionModel.h"

@implementation WFSportsProvider

+ (instancetype)sharedInstance {
    static WFSportsProvider *sportsProvider;
    static dispatch_once_t dispatchToken;
    dispatch_once(&dispatchToken, ^{
        sportsProvider = [[WFSportsProvider alloc] init];
    });
    return sportsProvider;
}

- (NSArray *)allSports {
    if (!_allSports) {
        NSMutableArray *sports = [NSMutableArray new];
        for (id sport in [WFJSONReader JSONFromFile:kSportsFeed].allValues[0]) {
            [sports addObject:[[WFSportModel alloc]initWithDictionary:sport]];
        }
        _allSports = [sports copy];
    }
    return _allSports;
}

- (NSArray *)allObjectives {
    if (!_allObjectives) {
        NSMutableArray *objectives = [NSMutableArray new];
        for (id objective in [WFJSONReader JSONFromFile:kObjectivesFeed].allValues[0]) {
            [objectives addObject:[[WFObjectiveModel alloc]initWithDictionary:objective]];
        }
        _allObjectives = [objectives copy];
    }
    return _allObjectives;
}

- (NSArray *)allDescriptions {
    if (!_allDescriptions) {
        NSMutableArray *descriptions = [NSMutableArray new];
        for (id _description in [WFJSONReader JSONFromFile:kSportsDescriptionsFeed].allValues[0]) {
            [descriptions addObject:[[WFSportDescriptionModel alloc]initWithDictionary:_description]];
        }
        _allDescriptions = [descriptions copy];
    }
    return _allDescriptions;
}

@end
