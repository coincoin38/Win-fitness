//
//  WFSportsViewModel.h
//  Win Fitness
//
//  Created by julien gimenez on 25/04/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "WFBaseViewModel.h"

@class WFSportsServices;
@class WFSportModel;

@interface WFSportsViewModel : WFBaseViewModel

@property (nonatomic, strong) NSArray<WFSportModel *> *sportsList;
@property (nonatomic, strong) WFSportModel *selectedSport;

- (instancetype)initWithSportsServices:(WFSportsServices *)services;
- (void)startSportCompletionParsing;

@end
