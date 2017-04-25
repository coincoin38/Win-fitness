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

@end
