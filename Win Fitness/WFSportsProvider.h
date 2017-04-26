//
//  WFSportsProvider.h
//  Win Fitness
//
//  Created by julien gimenez on 25/04/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WFSportsProvider : NSObject

+ (instancetype)sharedInstance;

@property (nonatomic, retain) NSArray * allSports;
@property (nonatomic, retain) NSArray * allObjectives;
@property (nonatomic, retain) NSArray * allDescriptions;

@end
