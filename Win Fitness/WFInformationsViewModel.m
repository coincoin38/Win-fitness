//
//  WFInformationsViewModel.m
//  Win Fitness
//
//  Created by julien gimenez on 25/04/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "WFInformationsViewModel.h"
#import "WFInformationsServices.h"

@interface WFInformationsViewModel ()

@property (nonatomic, strong) WFInformationsServices *services;

@end

@implementation WFInformationsViewModel

- (instancetype)initWithInformationsServices:(WFInformationsServices *)services {
    self = [super init];
    if (self) {
        _services = services;
    }
    return self;
}

@end
