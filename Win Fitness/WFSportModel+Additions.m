//
//  WFSportModel+Additions.m
//  Win Fitness
//
//  Created by julien gimenez on 19/04/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "WFSportModel+Additions.h"
#import "WFJSONReader.h"
#import "WFSessionsConstants.h"

@implementation WFSportModel (Additions)

+ (NSArray *)allSports {
    NSMutableArray *sports = [NSMutableArray new];
    for (id sport in [WFJSONReader JSONFromFile:kSportsFeed].allValues[0]) {
        [sports addObject:[[WFSportModel alloc]initWithDictionary:sport]];
    }
    return [sports copy];
}

@end
