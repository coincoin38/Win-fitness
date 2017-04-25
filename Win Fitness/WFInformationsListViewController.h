//
//  WFInformationsListViewController.h
//  Win Fitness
//
//  Created by julien gimenez on 25/04/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "WFBaseListViewController.h"

@class WFInformationsViewModel;

@interface WFInformationsListViewController : WFBaseListViewController

- (instancetype)initWithInformationsViewModel:(WFInformationsViewModel *)viewModel;

@end
