//
//  WFSportsViewModel.m
//  Win Fitness
//
//  Created by julien gimenez on 25/04/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "WFSportsViewModel.h"
#import "WFSportsServices.h"

@interface WFSportsViewModel ()

@property (nonatomic, strong) WFSportsServices *services;

@end

@implementation WFSportsViewModel

- (instancetype)initWithSportsServices:(WFSportsServices *)services {
    self = [super init];
    if (self) {
        _services = services;
    }
    return self;
}

@end
