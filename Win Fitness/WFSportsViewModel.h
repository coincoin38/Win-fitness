//
//  WFSportsViewModel.h
//  Win Fitness
//
//  Created by julien gimenez on 25/04/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "WFBaseViewModel.h"

@class WFSportsServices;

@interface WFSportsViewModel : WFBaseViewModel

- (instancetype)initWithSportsServices:(WFSportsServices *)services;

@end
