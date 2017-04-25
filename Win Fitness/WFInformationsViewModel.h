//
//  WFInformationsViewModel.h
//  Win Fitness
//
//  Created by julien gimenez on 25/04/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "WFBaseViewModel.h"

@class WFInformationsServices;

@interface WFInformationsViewModel : WFBaseViewModel

- (instancetype)initWithInformationsServices:(WFInformationsServices *)services;

@end
